// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

final class OutreachSelectionViewModel: ObservableObject {

    private enum Labels {
        static let outreachToastErrorNoSMSTitle =  MKLocalizedString("outreach.toast.error.no-sms-available.title",
                                                                     comment: "Message to show on a toast view when a user cannot use text messaging")
        static let outreachToastErrorNoEmailTitle = MKLocalizedString("outreach.toast.error.no-email-available.title",
                                                                      comment: "Message to show on a toast view when a user cannot use emailing")
        static let outreachToastErrorNoCallAvailable = MKLocalizedString("outreach.toast.error.no-call-available.title",
                                                                         comment: "Message to show on a toast view when a user cannot use calling")
        static let outreachToastErrorNoFaceTimeAvailable = MKLocalizedString("outreach.toast.error.no-facetime-available.title",
                                                                             comment: "Message to show on a toast view when a user cannot use FaceTime")
    }

    private let getOutreachActions: GetOutreachActionsMethod
    private let outreachFlowContainer: OutreachFlowContainer?
    private let router: OutreachSelectionRouter
    private let onCancel: () -> Void
    private let onSelected: ((OutreachType, String?) -> Void)?
    private let phoneLine: PhoneLine

    private var cancellables = Set<AnyCancellable>()
    private let outreachHandler = OutreachPublisherHandler()

    @Published private(set) var outreachChannels: ResultState<OutreachSelectionDisplayable, ErrorDisplayable> = .waiting

    init(getOutreachActions: @escaping GetOutreachActionsMethod,
         router: OutreachSelectionRouter,
         phoneLine: PhoneLine = UIApplication.shared,
         onSelected: ((OutreachType, String?) -> Void)?,
         outreachFlowContainer: OutreachFlowContainer?,
         onCancel: @escaping () -> Void) {
        self.getOutreachActions = getOutreachActions
        self.onSelected = onSelected
        self.phoneLine = phoneLine
        self.onCancel = onCancel
        self.router = router
        self.outreachFlowContainer = outreachFlowContainer
    }

    func fetchChannels() {
        self.getOutreachActions()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.outreachChannels = .loading(nil)
            })
            .map(ResultState.fromResult)
            .catch { error in return Just(.failed(ErrorDisplayable(error))) }
            .weakAssign(to: \.outreachChannels, on: self)
            .store(in: &self.cancellables)
    }

    func didTapCancel() {
        self.onCancel()
    }

    func didSelectEntry(_ entry: OutreachSelectionEntryItem) {
        switch entry.entryType {
        case .action(let action):
            self.handleActionType(action: action)
        case .outreach(let type, let recipient):
            if self.isAvailable(outreachType: type) {
                self.handleSelectedOutreachType(type, recipient: recipient)
            } else {
                self.handleUnavailableOutreachType(for: type)
            }
        }
    }

    private func handleSelectedOutreachType(_ outreachType: OutreachType, recipient: String?) {
        if let onSelected {
            onSelected(outreachType, recipient)
        } else if let outreachFlowContainer {
            let flowItem = OutreachFlowItem(clientID: outreachFlowContainer.clientID,
                                            type: outreachType,
                                            recipient: recipient)
            self.handleOutreachFlowItem(flowItem, outreachFlowContainer: outreachFlowContainer)
        }
    }

    private func handleOutreachFlowItem(_ flowItem: OutreachFlowItem, outreachFlowContainer: OutreachFlowContainer) {
        switch flowItem.type {
        case .call:
            guard let recipient = flowItem.recipient else { return }
            self.phoneLine.call(potentialNumber: recipient) { [weak self] result in
                let outreachResult = OutreachResult(
                    outreachType: .call,
                    clientId: flowItem.clientID,
                    resultStatus: result
                )
                self?.handleOutreachResult(outreachResult, outreachFlowContainer: outreachFlowContainer)
            }
        case .facetime:
            guard let recipient = flowItem.recipient else { return }
            self.phoneLine.faceTime(potentialNumber: recipient) { [weak self] result in
                let outreachResult = OutreachResult(
                    outreachType: .facetime,
                    clientId: flowItem.clientID,
                    resultStatus: result
                )
                self?.handleOutreachResult(outreachResult, outreachFlowContainer: outreachFlowContainer)
            }
        default:
            self.router.presentTemplateSelection(
                outreachFlowItem: flowItem,
                assetURLs: outreachFlowContainer.assets,
                getTemplates: outreachFlowContainer.getTemplatesMethod,
                onDone: { [weak self] result in
                    self?.handleOutreachResult(result, outreachFlowContainer: outreachFlowContainer)
                })
        }
    }

    private func handleOutreachResult(_ result: OutreachResult, outreachFlowContainer: OutreachFlowContainer) {
        switch result.resultStatus {
        case .success:
            // Create an Outreach Interaction Object to send to the server
            let interaction = OutreachInteractionCreation(result: result)
            // Call server to create The Interaction
            let publisher = outreachFlowContainer.createInteraction(interaction)
            self.outreachHandler.sinkPublisherWhenNeeded(publisher) { result in
                if !Features.manager.isEnabled(.enableTimelinePublisherRefreshFromImplementation, defaultValue: true), result.isSuccess {
                    NotificationCenter.default.post(name: .outreachCompletedSuccessfullyNotification,
                                                    object: interaction.clientId)
                }
            }
            Analytics.log(OutreachActionPerformedEvent(type: result.outreachType,
                                                       templateUsed: result.templateName))
        case .failure:
            // Log analytics?
            break
        case .cancelled:
            // Do nothing
            break
        }
    }

}

// Hendle channels availability
private extension OutreachSelectionViewModel {
    func isAvailable(outreachType: OutreachType) -> Bool {
        switch outreachType {
        case .email:
            return Mail.canSendMail
        case .sms:
            return Messaging.canSendTextMessage
        case .call:
            return self.phoneLine.isCallAvailable
        case .facetime:
            return self.phoneLine.isFaceTimeAvailable
        case .whatsapp:
            return WhatsappOutreachAction.isAvailable
        case .lineWorks:
            return LineWorksOutreachAction.isAvailable
        case .wechat:
            return WechatOutreachAction.isAvailable
        case .line:
            return LineOutreachAction.isAvailable
        case .kakao:
            return KakaoOutreachAction.isAvailable
        }
    }

    private func handleUnavailableOutreachType(for type: OutreachType) {
        switch type {
        case .email:
            ToastView.show(text: Labels.outreachToastErrorNoEmailTitle, style: .error)
        case .sms:
            ToastView.show(text: Labels.outreachToastErrorNoSMSTitle, style: .error)
        case .call:
            ToastView.show(text: Labels.outreachToastErrorNoCallAvailable, style: .error)
        case .facetime:
            ToastView.show(text: Labels.outreachToastErrorNoFaceTimeAvailable, style: .error)
        case .whatsapp:
            WhatsappOutreachAction.openAppStoreLink()
        case .lineWorks:
            LineWorksOutreachAction.openAppStoreLink()
        case .wechat:
            WechatOutreachAction.openAppStoreLink()
        case .line:
            LineOutreachAction.openAppStoreLink()
        case .kakao:
            KakaoOutreachAction.openAppStoreLink()
        }
    }
}

extension OutreachSelectionDisplayable: EmptyStateRepresentable {
    public var isEmpty: Bool {
        return self.entries.isEmpty
    }
}

extension OutreachSelectionViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { return self.router }
}
