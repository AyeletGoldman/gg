// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag
import LocalAuthentication

// Subclasses don't publish updates if their parent class is `ObservableObject`, it has to be the actual
// subclass. https://stackoverflow.com/questions/57615920/published-property-wrapper-not-working-on-subclass-of-observableobject
public final class SearchClientsViewModel: BaseSearchClientsViewModel, ObservableObject {

    @Published var selectedClients: Set<String>
    @Published var isEditing: Bool = false

    let showCreateClientButton: Bool
    private let onDone: ((Set<String>) -> Void)?
    private var authenticationContext = LAContext()

    var shouldShowDoneButton: Bool {
        return self.onDone != nil
    }

    private let router: SearchClientsRouter

    public init(clientListId: String? = nil,
                title: String? = nil,
                selectedClients: Set<String> = [],
                isEditing: Bool = false,
                showCreateClientButton: Bool,
                router: SearchClientsRouter,
                onDismiss: (() -> Void)?,
                onDone: ((Set<String>) -> Void)? = nil) {
        self.router = router
        self.isEditing = isEditing
        self.selectedClients = selectedClients
        self.showCreateClientButton = showCreateClientButton
        self.onDone = onDone
        super.init(clientListId: clientListId,
                   title: title,
                   onDismiss: onDismiss)
    }

    func didTapDone() {
        self.onDone?(self.selectedClients)
    }

    func didSelectClientRow(_ clientRow: ClientSearchRowDisplayable) {
        self.addLastSearchToRecentSearches()
        if !self.isEditing {
            self.router.presentClientDetails(clientId: clientRow.cellProvider.clientID)
        }
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

extension SearchClientsViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { return self.router }
}
