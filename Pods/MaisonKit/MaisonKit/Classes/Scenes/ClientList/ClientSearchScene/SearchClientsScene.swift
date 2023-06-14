// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct SearchClientsScene: Scene {

    private let clientListId: String?
    private let title: String?
    private let onDismiss: ((SearchClientsViewController) -> Void)?
    private let onDone: ((SearchClientsViewController, Set<String>) -> Void)?
    private let isEditing: Bool
    private let selectedClients: Set<String>
    private let includeSearchController: Bool
    private let showCreateClientButton: Bool

    init(clientListId: String?,
         title: String?,
         isEditing: Bool,
         selectedClients: Set<String>,
         includeSearchController: Bool = false,
         showCreateClientButton: Bool = false,
         onDismiss: ((SearchClientsViewController) -> Void)? = nil,
         onDone: ((SearchClientsViewController, Set<String>) -> Void)? = nil) {
        self.clientListId = clientListId
        self.title = title
        self.isEditing = isEditing
        self.selectedClients = selectedClients
        self.includeSearchController = includeSearchController
        self.showCreateClientButton = showCreateClientButton
        self.onDismiss = onDismiss
        self.onDone = onDone
    }

    func createViewController() -> SearchClientsViewController {
        return SearchClientsViewController()
    }

    func configure(controller: SearchClientsViewController,
                   using factory: SceneFactory) {
        let router = DefaultSearchClientsRouter(controller: controller, factory: factory)
        let viewModel = SearchClientsViewModel(clientListId: self.clientListId,
                                               title: self.title,
                                               selectedClients: self.selectedClients,
                                               isEditing: self.isEditing,
                                               showCreateClientButton: self.showCreateClientButton,
                                               router: router,
                                               onDismiss: self.onDismiss.map { [weak controller] onDismissFunc in {
                                                guard let controller = controller else { return }
                                                onDismissFunc(controller)
                                               }},
                                               onDone: self.onDone.map { onDone in
                                                return { [weak controller] in
                                                    guard let controller = controller else { return }
                                                    onDone(controller, $0)
                                                }
                                               })
        controller.viewModel = viewModel

        if self.includeSearchController {
            controller.searchController = factory.createSearchController(searchResultsController: nil)
        }
    }
}
