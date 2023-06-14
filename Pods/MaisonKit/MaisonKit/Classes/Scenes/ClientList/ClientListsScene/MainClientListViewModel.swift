// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import Combine
import Biodag
import LocalAuthentication

/// The view model that manages the client lists.
/// This view model handles the fetching of clients lists and the state of the main client lists view.
public final class MainClientListViewModel: ObservableObject {

    private enum Labels {
        static let deleteListAlertButtonConfirmationTitle = MKLocalizedString("client-list.delete-list.alert.button.confirm.title",
                                                                              comment: "Title for confirmation alert button when deleting a client list")
        static let deleteListAlertConfirmationTitle = MKLocalizedString("client-list.delete-list.alert.confirm.title",
                                                                        comment: "Title for confirmation alert for deleting a client list")
        static let deleteListAlertConfirmationMessage = MKLocalizedString("client-list.delete-list.alert.confirm.message",
                                                                          comment: "Message for confirmation alert for deleting a client list")
        static let deleteListAlertConfirmationMessageFormat = MKLocalizedString("client-list.delete-list.error.alert.message",
                                                                                comment: "Message to show on an alert when deleting a client list fails")
    }

    @Published private(set) var clientLists: ResultState<ClientListSection, ErrorDisplayable> = .waiting
    @Published private(set) var availableNavigationBarActions: [MenuAction] = []
    @Published var alertContext: AlertContext?
    @Published var isEditingPersonalLists: Bool = false

    @Inject private var store: LoadableClientListStoring
    private let router: ClientListsRouter
    private var authenticationContext = LAContext()

    private var disposables = Set<AnyCancellable>()

    public init(router: ClientListsRouter) {
        self.router = router
    }

    func fetchClientLists() {
        self.store.fetchClientLists()
            .assign(to: &self.$clientLists)

        self.fetchNavigationBarActions()
    }

    func didTapCreateClientList() {
        self.presentCreateNewListScene()
    }

    func deleteClientListConfirmPopup(listId: ListID) {
        let secondaryButton = AlertContext.Button(
            title: Labels.deleteListAlertButtonConfirmationTitle,
            style: .destructive(action: { [weak self] in
                withAnimation {
                    self?.deleteClientList(listId: listId)
                }
            })
        )
        self.alertContext = AlertContext(
            title: Labels.deleteListAlertConfirmationTitle,
            message: Labels.deleteListAlertConfirmationMessage,
            secondaryButton: secondaryButton
        )
    }

    private func deleteClientList(listId: ListID) {
        self.store.deleteClientList(listId: listId)
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.showDeletionError(error)
                case .success:
                    // If we deleted the last list, we are not in "editing mode" anymore
                    if let clientLists = self?.clientLists.value?.personal.clientLists, clientLists.isEmpty {
                        self?.isEditingPersonalLists = false
                    }
                    Analytics.log(DeletedClientListEvent(source: .list))
                }
            })
            .store(in: &self.disposables)
    }

    private func showDeletionError(_ error: Error) {
        let format = Labels.deleteListAlertConfirmationMessageFormat
        self.alertContext = AlertContext(
            title: Labels.deleteListAlertConfirmationTitle,
            message: String(format: format, error.localizedDescription)
        )
    }

    func fetchNavigationBarActions() {
        self.store.getMainClientListsNavigationActions()
            .weakAssign(to: \.availableNavigationBarActions, on: self)
            .store(in: &self.disposables)
    }

    func didTapCreateClient() {
        self.authenticationContext = LAContext()
        self.authenticationContext.authenticateDevice(reason: CreateClientLabels.deviceAuthenticationReason) {
            self.router.presentCreateClient()
        } onPolicyFail: { error in
            self.alertContext = AlertContext(
                title: error.localizedTitle ?? "",
                message: error.localizedDescription
            )
        }
    }
}

// MARK: - Routing

extension MainClientListViewModel {

    func presentCreateNewListScene() {
        self.router.presentCreateNewList()
    }

    func presentMemberListScene(listId: String, listType: String) {
        self.router.presentMemberList(listId: listId, listType: listType)
    }
}

extension MainClientListViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { return self.router }
}
