// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import SwiftUI
import Biodag

/// ClientListFormViewModel holds and manages the information needed to create a client list
class ClientListFormViewModel: ObservableObject {

    private enum Labels {
        static let createListTitle = MKLocalizedString("client-list.form.create-list.title",
                                                       comment: "Title for the form when we are creating a list")
        static let editListTitle = MKLocalizedString("client-list.form.edit-list.title",
                                                     comment: "Title for the form when we are editing a list")

        static let saveErrorAlertTitle = MKLocalizedString("client-list.form.save-list.error.title",
                                                           comment: "Title for alert shown when saving a list fails")
        static let saveErrorAlertMessageFormat = MKLocalizedString("client-list.form.save-list.error.message",
                                                                   comment: "Message for alert shown when saving a list fails")

        static let alertConfirmationDeleteButtonTitle = MKLocalizedString("client-list.form.alert.delete-confirmation.button.title",
                                                                          comment: "Title for button when deleting a client list")
        static let alertConfirmationDeleteTitle = MKLocalizedString("client-list.form.alert.delete-confirmation.title",
                                                                    comment: "Title for the alert when deleting a list")
        static let alertConfirmationDeleteMessage = MKLocalizedString("client-list.form.alert.delete-confirmation.message",
                                                                      comment: "Message for the alert when deleting a list")
        static let toastClientDeletionErrorTitleFormat = MKLocalizedString("client-list.form.toast.error.title",
                                                                           comment: "Title for the toast shown when deleting a client list fails")
    }

    private enum ClientCreationError: Error {
        case listNameEmpty
        case editingListUnchanged
    }

    @Inject private var store: LoadableClientListStoring
    private var cancellables = Set<AnyCancellable>()

    /// Holds the previously selected clients in case of client selection cancelation
    @Published private(set) var originalClients = Set<String>()
    /// If we must show an error alert, set the value of this
    @Published private(set) var isSavingList = false
    @Published private(set) var isValidForm = false
    @Published private(set) var state = ResultState<Set<String>, ErrorDisplayable>.waiting
    @Published var alertContext: AlertContext?

    /// What to do when we're done creating or editing a list (either saving or cancelling)
    /// The boolean indicates whether or not the editing is finished because this list is being deleted
    private let onDone: ((Bool) -> Void)?
    private let originalListName: String
    private let router: ClientListFormRouter

    let listId: String?
    @Published var listName: String = ""

    var title: String {
        self.listId == nil ? Labels.createListTitle : Labels.editListTitle
    }

    /// Creates a new `ClientListFormViewModel`
    /// - Parameter router: the router for this viewmodel. Will be used to present client search.
    /// - Parameter onDone: a callback for when a user is done editing or creating a list (whether that be by cancelling or saving the list)
    init(router: ClientListFormRouter,
         onDone: (() -> Void)? = nil) {
        // This initializer is used when we are creating a new list, so there is no boolean needed to decide if this
        // list is being deleted or not.
        self.onDone = onDone.map { closure in
            return { _ in closure() }
        }
        self.router = router
        self.listId = nil
        self.originalListName = ""
        self.setupValidationSubscription()
    }

    /// Creates a new `ClientListFormViewModel`
    /// - Parameters:
    ///   - clientListId: the ID of the client list we're editing
    ///   - listName: the name of the list we're editing
    ///   - router: the router for this viewmodel. Will be used to present client search.
    ///   - onDone: a closure for when a user is done editing or creating a list (whether that be by cancelling, saving the list, or deleting it)
    init(clientListId: String,
         listName: String,
         router: ClientListFormRouter,
         onDone: ((Bool) -> Void)? = nil) {
        self.listId = clientListId
        self.listName = listName
        self.router = router
        self.onDone = onDone
        self.originalListName = listName
        self.setupValidationSubscription()
    }

    private func setupValidationSubscription() {
        self.$listName
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .removeDuplicates()
            .combineLatest(self.$originalClients.removeDuplicates(),
                           self.$state.compactMap { $0.value }.removeDuplicates())
            .flatMap { [weak self] listName, originalClients, selectedClients in
                Just(())
                    .tryMap {
                        try self?.validate(listName: listName,
                                           selectedClients: selectedClients,
                                           originalClients: originalClients)
                        return true
                    }.catch { _ in
                        return Just(false)
                    }
            }.assign(to: &self.$isValidForm)
    }

    // A list is not valid if:
    // - It doesn't have a name OR
    // - We are not in "creation mode" and the list of clients is different than the original list
    private func validate(listName: String, selectedClients: Set<String>, originalClients: Set<String>) throws {
        if listName.trimmingCharacters(in: .whitespaces).isEmpty {
            throw ClientCreationError.listNameEmpty
        }

        if self.listId != nil
            && selectedClients == originalClients
            && listName == self.originalListName {
            throw ClientCreationError.editingListUnchanged
        }
    }

    func fetchListContentIfNecessary() {
        guard let listId else {
            self.state = .found([])
            return
        }

        self.state = .loading(nil)
        self.store.fetchAllClientListMembers(clientListId: listId)
            .compactMap { $0.value }
            .sink { [weak self] allMembers in
                let clientIDs = Set(allMembers.map { $0.cellProvider.clientID })
                self?.originalClients = clientIDs
                self?.state = .found(clientIDs)
            }.store(in: &self.cancellables)
    }

    func saveList() {
        // TODO: Should we have two different data sources for the selected clients?
        // Because we're setting the clients in a list in a particular order, but using
        // a Set... that doesn't seem to make sense.
        self.store.upsertClientList(listId: self.listId,
                                    listName: self.listName,
                                    clientIds: Array(self.state.value ?? []))
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.isSavingList = true
            }).sink(receiveCompletion: { [weak self] completion in
                self?.isSavingList = false
                switch completion {
                case .failure(let error):
                    self?.showSavingError(error)
                case .finished:
                    self?.onDone?(false)
                    let event: EventType = self?.listId == nil ? CreatedClientListEvent() : EditedClientListEvent()
                    Analytics.log(event)
                }
            }, receiveValue: { _ in }).store(in: &self.cancellables)
    }

    private func showSavingError(_ error: Error) {
        let format = Labels.saveErrorAlertMessageFormat
        self.alertContext = AlertContext(
            title: Labels.saveErrorAlertTitle,
            message: String(format: format, error.localizedDescription)
        )
    }

    func deleteClientListConfirmPopup() {
        let secondaryButton = AlertContext.Button(
            title: Labels.alertConfirmationDeleteButtonTitle,
            style: .destructive(action: { [weak self] in
                self?.deleteClientList()
            })
        )
        self.alertContext = AlertContext(
            title: Labels.alertConfirmationDeleteTitle,
            message: Labels.alertConfirmationDeleteMessage,
            secondaryButton: secondaryButton
        )
    }

    private func deleteClientList() {
        guard let listId = self.listId else { return }

        self.store.deleteClientList(listId: listId)
            .sink(receiveValue: { result in
                switch result {
                case .failure(let error):
                    // Regular alert can't work with optimistic update
                    let title = String(format: Labels.toastClientDeletionErrorTitleFormat, error.localizedDescription)
                    ToastView.show(text: title, style: .error)
                case .success:
                    Analytics.log(DeletedClientListEvent(source: .membersList))
                }
            })
            .store(in: &self.cancellables)
        self.onDone?(true)
    }

    func didTapClose() {
        self.onDone?(false)
    }

    func presentSearch() {
        self.router.presentClientSearch(initialSelectedClientIds: self.state.value ?? []) { [weak self] selectedClients in
            self?.state = .found(selectedClients)
        }
    }
}
