//  Copyright (c) 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import MaisonKit

// MARK: - Create initial view controllers
extension SceneDelegate {

    func buildClientsTab(factory: SceneFactory) -> UIViewController {
        let scene = factory.retrieveScene(with: ClientListsRouteDescriptor())
        let controller = factory.createViewController(scene)
        return UINavigationController(rootViewController: controller)
    }
    
    func buildCatalogTab(factory: SceneFactory) -> UIViewController {
        let scene = factory.retrieveScene(with: ProductCatalogRouteDescriptor(category: nil))
        let controller = factory.createViewController(scene)
        return UINavigationController(rootViewController: controller)
    }

    func buildDashboardTab(factory: SceneFactory) -> UIViewController {
        let scene = factory.retrieveScene(with: DashboardRouteDescriptor())
        let controller = factory.createViewController(scene)
        return UINavigationController(rootViewController: controller)
    }

    func buildSettingsTab(factory: SceneFactory) -> UIViewController {
        let scene = factory.retrieveScene(with: SettingsRouteDescriptor())
        let controller = factory.createViewController(scene)
        return UINavigationController(rootViewController: controller)
    }
}
