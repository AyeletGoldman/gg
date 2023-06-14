// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct MemberListScene: Scene {

    let listId: String
    let listType: String
    let onDeleted: ((UIViewController) -> Void)?

    init(listId: String, listType: String, onDeleted: ((UIViewController) -> Void)?) {
        self.listId = listId
        self.listType = listType
        self.onDeleted = onDeleted
    }

    func createViewController() -> MemberListViewController {
        return MemberListViewController()
    }

    func configure(controller: MemberListViewController,
                   using factory: SceneFactory) {
        let router = DefaultMemberListRouter(controller: controller, factory: factory)

        controller.viewModel = MemberListViewModel(listId: self.listId,
                                                   listType: self.listType,
                                                   router: router,
                                                   onDeleted: { [weak controller] in
                                                    guard let controller = controller else { return }
                                                    self.onDeleted?(controller)
                                                   })

        let scene = factory.retrieveScene(with: SearchClientListRouteDescriptor(listId: self.listId,
                                                                                title: nil))

        if let clientSearchController = factory.createViewController(scene) as? UIViewController & UISearchResultsUpdating {
            let searchController = factory.createSearchController(searchResultsController: clientSearchController)
            searchController.searchResultsUpdater = clientSearchController
            controller.searchController = searchController
        }
    }
}
