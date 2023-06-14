//  Copyright © 2021 LVMH. All rights reserved.

import Combine
import Biodag

final class PBLConfirmOrderViewModel: ObservableObject {

    private enum Labels {
        static let title = MKLocalizedString("pay-by-link.confirm-order.navigation-bar.title",
                                             comment: "The title for the pay by link confirmation screen")
        static let alertConfirmationCloseButtonTitle = MKLocalizedString("pay-by-link.confirm-order.alert.close-confirmation.done-button.title",
                                                                         comment: "Title for button when closing form")
        static let alertConfirmationCancelButtonTitle = MKLocalizedString("pay-by-link.confirm-order.alert.close-confirmation.cancel-button.title",
                                                                          comment: "Title for button when canceling closing form")
        static let alertConfirmationCloseTitle = MKLocalizedString("pay-by-link.confirm-order.alert.close-confirmation.title",
                                                                   comment: "Title for the alert when closing form")
        static let alertConfirmationCloseMessage = MKLocalizedString("pay-by-link.confirm-order.alert.close-confirmation.message",
                                                                     comment: "Message for the alert when closing the form")
    }

    private let router: PBLConfirmOrderRouter
    private let orderId: String
    private let onClose: (() -> Void)
    private let onShareCompletion: (() -> Void)

    @Inject private var payByLinkAdapter: PayByLinkAdapter
    @Inject private var notificationsAdapter: NotificationsAdapter

    let title = Labels.title

    @Published private(set) var data: ResultState<ConfirmOrderDisplayable, ErrorDisplayable> = .waiting
    @Published private(set) var paymentLink: ResultState<PaymentLinkDisplayable, ErrorDisplayable> = .waiting

    @Published var isButtonLoading: Bool = false
    @Published var alertContext: AlertContext?

    private var cancellables = Set<AnyCancellable>()
    private let handler = OutreachPublisherHandler()

    init(orderId: String,
         router: PBLConfirmOrderRouter,
         onClose: @escaping (() -> Void),
         onShareCompletion: @escaping (() -> Void)) {
        self.orderId = orderId
        self.router = router
        self.onClose = onClose
        self.onShareCompletion = onShareCompletion
    }

    func fetchOrderDetails() {
        self.data = .loading(nil)
        self.payByLinkAdapter.retrieveOrder(orderId: self.orderId)
            .map {
                return ResultState.fromResult(result: $0)
            }.catch { error in
                return Just(.failed(ErrorDisplayable(error))).eraseToAnyPublisher()
            }.assign(to: &self.$data)
    }

    func didTapClose() {
        let doneButton = AlertContext.Button(
            title: Labels.alertConfirmationCloseButtonTitle,
            style: .destructive(action: { [weak self] in
                guard let self = self else { return }
                self.payByLinkAdapter.cancelOrder(orderId: self.orderId)
                self.onClose()
            })
        )
        let cancelButton = AlertContext.Button(
            title: Labels.alertConfirmationCancelButtonTitle,
            style: .cancel(action: nil)
        )
        self.alertContext = AlertContext(
            title: Labels.alertConfirmationCloseTitle,
            message: Labels.alertConfirmationCloseMessage,
            primaryButton: cancelButton,
            secondaryButton: doneButton
        )
    }

    func didTapSendPaymentLinkButton() {
        guard let clientId = self.data.value?.clientId else { return }
        self.isButtonLoading = true

        self.createLinkStream()
            .compactMap { paymentURL -> (PaymentLinkDisplayable)? in
                // Clean up a little, to make sure there weren't any errors
                return paymentURL.value
            }
            .sink { [weak self] paymentURL in
                self?.isButtonLoading = false
                self?.handlePaymentLink(paymentURL, clientID: clientId)
            }
            .store(in: &self.cancellables)
    }

    private func createLinkStream() -> AnyPublisher<ResultState<PaymentLinkDisplayable, ErrorDisplayable>, Never> {
        // If we already requested in the past...
        if self.paymentLink.isSuccess {
            return self.$paymentLink.eraseToAnyPublisher()
        }

        return self.payByLinkAdapter.getPaymentLink(orderId: self.orderId)
            .handleEvents(receiveOutput: { result in
                if let value = result.value {
                    self.paymentLink = .found(value)
                } else {
                    self.paymentLink = .loading(nil)
                }
            })
            .map(ResultState.fromResult)
            .catch { error in return Just(.failed(ErrorDisplayable(error))) }
            .eraseToAnyPublisher()
    }

    private func handlePaymentLink(_ paymentLink: PaymentLinkDisplayable, clientID: String) {
        // Show the notifications UI if needed
        self.notificationsAdapter.hasNotificationsPermissions { [weak self] hasPermissions in
            self?.isButtonLoading = false
            if hasPermissions {
                self?.presentOutreachSelection(paymentLink: paymentLink, clientID: clientID)
            } else {
                self?.router.presentNotificationPermissions { didCancel in
                    if !didCancel {
                        self?.presentOutreachSelection(paymentLink: paymentLink, clientID: clientID)
                    }
                }
            }
        }
    }

    private func presentOutreachSelection(paymentLink: PaymentLinkDisplayable, clientID: String) {
        self.router.presentOutreachSelection(getOutreachActions: { [payByLinkAdapter, orderId] in
            payByLinkAdapter.getPayByLinkClientOutreachChannels(clientID: clientID, orderID: orderId)
        },
                                             onItemSelected: { [weak self] outreachType, recipient in
            let flowItem = OutreachFlowItem(clientID: clientID, type: outreachType, recipient: recipient)
            self?.didFinishCreatingOutreachFlowItem(flowItem: flowItem, linkId: paymentLink.id)
        })
    }

    func didFinishCreatingOutreachFlowItem(flowItem: OutreachFlowItem, linkId: String) {
        self.router.presentTemplateSelection(
            outreachFlowItem: flowItem,
            getTemplates: { [payByLinkAdapter] in
                payByLinkAdapter.getTemplates(orderId: self.orderId,
                                              clientId: flowItem.clientID,
                                              linkId: linkId)
            },
            onDone: { [weak self] result in
                self?.handleOutreachResult(result)
            })
    }
}

// MARK: - Handle outreach results
private extension PBLConfirmOrderViewModel {
    private func handleOutreachResult(_ result: OutreachResult) {
        switch result.resultStatus {
        case .success:
            // Create an Outreach Interaction Object to send to the server
            let interaction = OutreachInteractionCreation(result: result)
            // Call server to create The Interaction
            let publisher = self.payByLinkAdapter.createInteraction(interaction: interaction, orderId: self.orderId)
            self.handler.sinkPublisherWhenNeeded(publisher, onDone: { [weak self] result in
                if !Features.manager.isEnabled(.enableTimelinePublisherRefreshFromImplementation, defaultValue: true), result.isSuccess {
                    NotificationCenter.default.post(name: .outreachCompletedSuccessfullyNotification,
                                                    object: interaction.clientId)
                }
                self?.onShareCompletion()
            })
            Analytics.log(OutreachActionPerformedEvent(type: result.outreachType,
                                                       templateUsed: result.templateName))
        case .failure, .cancelled:
            break
        }
    }
}
