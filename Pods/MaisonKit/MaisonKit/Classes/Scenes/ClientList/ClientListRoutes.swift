// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class ClientListRoutes: NSObject, RouteRegistering {
    /// Registers all client list routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerMainClientListRoute(onto: registry)
        self.registerMembersListRoute(onto: registry)
        self.registerCreateClientListRoute(onto: registry)
        self.registerEditClientListRoute(onto: registry)
        self.registerSortClientsRoute(onto: registry)
        self.registerSearchEditableClientListRoute(onto: registry)
        self.registerSearchClientListRoute(onto: registry)
        self.registerGlobalClientSearchRoute(onto: registry)
        self.registerSelectClientRoute(onto: registry)
        self.registerCreateClientRoute(onto: registry)
    }
}

/// Defines the route registrations available for the client list module
private extension ClientListRoutes {

    static func registerMainClientListRoute(onto registry: SceneRegistry) {
        registry.registerScene { (_: ClientListsRouteDescriptor) in
            return ClientListsScene(showSearchInNavigationBar: true)
        }
    }

    static func registerMembersListRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: MemberListRouteDescriptor) in
            return MemberListScene(listId: descriptor.listId, listType: descriptor.listType, onDeleted: descriptor.onDeleted)
        }
    }

    static func registerCreateClientListRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: CreateClientListsRouteDescriptor) in
            return CreateClientListsScene(onDone: descriptor.onDone)
        }
    }

    static func registerEditClientListRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: EditClientListsRouteDescriptor) in
            return EditClientListsScene(listId: descriptor.listId,
                                        listName: descriptor.listName,
                                        onDone: descriptor.onDone)
        }
    }

    static func registerSortClientsRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: SortMemberListRouteDescriptor) in
            return SelectionListScene.sortSelectionListScene(items: descriptor.sortItems,
                                                             selection: descriptor.initialSortValue,
                                                             title: descriptor.title,
                                                             onDismiss: descriptor.onClose,
                                                             doneButtonTitle: descriptor.doneButtonTitle,
                                                             onDone: descriptor.onDone)
        }
    }

    static func registerSearchEditableClientListRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: SearchEditableClientListRouteDescriptor) in
            return SearchClientsScene(clientListId: nil,
                                      title: descriptor.title,
                                      isEditing: true,
                                      selectedClients: descriptor.initialSelectedClientIds,
                                      includeSearchController: true,
                                      onDismiss: descriptor.onDismiss,
                                      onDone: descriptor.onDone)
        }
    }

    static func registerSearchClientListRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: SearchClientListRouteDescriptor) in
            return SearchClientsScene(clientListId: descriptor.listId,
                                      title: descriptor.title,
                                      isEditing: false,
                                      selectedClients: [])
        }
    }

    static func registerGlobalClientSearchRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: GlobalClientSearchRouteDescriptor) in
            return SearchClientsScene(clientListId: nil,
                                      title: descriptor.title,
                                      isEditing: false,
                                      selectedClients: [],
                                      showCreateClientButton: Features.manager.isEnabled(.createClient, defaultValue: false))
        }
    }

    static func registerSelectClientRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: SelectClientRouteDescriptor) in
            return SelectClientScene(title: descriptor.title,
                                     stylistSection: descriptor.stylistSection,
                                     onDismiss: descriptor.onDismiss,
                                     onDone: descriptor.onDone)
        }
    }

    static func registerCreateClientRoute(onto registry: SceneRegistry) {
        registry.registerScene { (_: CreateClientRouteDescriptor) in
            return CreateClientScene()
        }
    }
}
