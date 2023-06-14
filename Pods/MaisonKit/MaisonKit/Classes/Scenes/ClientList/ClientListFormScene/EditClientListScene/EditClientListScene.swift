// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Biodag

/// A `Scene` to create and configure a `ClientListFormViewController` for editing an existing client list
struct EditClientListsScene: Scene {

    private let onDone: (ClientListFormViewController, Bool) -> Void
    private let listId: String
    private let listName: String

    /// Create a new `EditClientListsScene`
    /// - Parameters:
    ///   - listId: the list to edit
    ///   - listName: the name of the list to edit
    ///   - onDone: A closure to invoke when the user has finished editing the list
    ///     Takes a view controller (the edit list view controller) and a boolean indicating whether the controller was closed because of
    ///     the list being deleted or not. `true` if the list is being deleted, `false` otherwise
    init(listId: String, listName: String, onDone: @escaping (ClientListFormViewController, Bool) -> Void) {
        self.listId = listId
        self.listName = listName
        self.onDone = onDone
    }

    func createViewController() -> ClientListFormViewController {
        return ClientListFormViewController()
    }

    func configure(controller: ClientListFormViewController,
                   using factory: SceneFactory) {
        let router = DefaultClientListFormRouter(controller: controller, factory: factory)
        let editViewModel = ClientListFormViewModel(clientListId: listId,
                                                    listName: listName,
                                                    router: router,
                                                    onDone: { [weak controller, onDone] isBeingDeleted in
                                                        guard let controller = controller else { return }
                                                        onDone(controller, isBeingDeleted)
                                                    })
        controller.viewModel = editViewModel
    }
}
