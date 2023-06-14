//
//  SceneDelegate+CreateController.swift
//  Zenith Clienteling
//
//  Created by Balink on 15/05/2022.
//

import UIKit
import Combine
import MaisonKit
import StylableSwiftUI
import Biodag


// MARK: - Make initial view controllers
extension SceneDelegate {
    
    // Get MainTabsController if the connected user have less than 2 stores otherwise get SelectionStoresController
    func getMainController(factory: SceneFactory, styleContainer: UIKitStyleContainer) -> UIViewController {
        return self.createMainTabsController(factory: factory, styleContainer: styleContainer)
    }
    
    func createMainTabsController(factory: SceneFactory, styleContainer: UIKitStyleContainer) -> UIViewController {
        let controller = StylableTabBarController()
        controller.styleContainer = styleContainer
        let viewControllers = [
            self.buildClientsTab(factory: factory),
            self.buildCatalogTab(factory: factory),
            self.buildDashboardTab(factory: factory),
            self.buildSettingsTab(factory: factory)
        ]
        controller.viewControllers = viewControllers
        return controller
    }
    
    func createLoginController(factory: SceneFactory, delegate: AuthenticationDelegate) -> UIViewController {
        let scene = factory.retrieveScene(with: AuthenticationRouteDescriptor(delegate: delegate,
                                                                              performLogin: { [weak self] onDone in
            self?.attemptToLogin(loginResult: { error in
                self?.userHasJustLoggedIn = error == nil
                onDone(error)
            })
        }))
        let controller = factory.createViewController(scene)
        return controller
    }
    
    func refreshUser() {
        userAdapter.getUserDetails()
            .sink { _ in
            } receiveValue: { user in
                MaisonKitUser.currentLoggedInUser = user
            }.store(in: &cancellables)
    }
    
    func loadMainController() {
        self.window?.rootViewController = self.createMainTabsController!()
    }
}





