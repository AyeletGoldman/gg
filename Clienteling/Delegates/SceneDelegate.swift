// Copyright © 2020 LVMH. All rights reserved.

import UIKit
import Combine
import SwiftUI
import MaisonKit
import StylableSwiftUI
import MaisonKitAuth
import FirebaseCrashlytics
import CoreSpotlight
import Biodag

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private var stylist: Stylist?
    private var createMainController: (() -> UIViewController)?
    var userHasJustLoggedIn: Bool = false
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    var toastViewPresenter: ToastViewPresenter?
    var createMainTabsController: (()-> UIViewController)?
    var cancellables = Set<AnyCancellable>()
    @Inject var userAdapter: UserAdapter
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let registry = SceneRegistry()
        
        MaisonKit.initialize(sceneRegistry: registry)
        
        self.setupFeatureFlags()
        
        let stylist = self.createStylist()
        let styleContainer = UIKitStyleContainer.create(with: stylist)
        let webstylist = self.setupWebStylist(with: stylist)
        let factory = SceneFactory(stylist: stylist, styleContainer: styleContainer, webStylist: webstylist, registry: registry)
        
        self.createMainController = {
            self.refreshUser()
//            NotificationCenter.default.post(name: .userDidLoginNotificationName, object: nil)
            let controller = self.getMainController(factory: factory, styleContainer: styleContainer)
            
            // Configure the InboundItemHandler to handle notifications when the user is logged in only
            InboundItemHandler.default.configure(withWindowScene: windowScene, sceneFactory: factory, stylist: stylist)
            if !self.userHasJustLoggedIn {
                NotificationCenter.default.post(name: DashboardStore.downloadDashboardsOnStart, object: nil)
            }
            return controller
        }
        self.createMainTabsController = {
            return self.createMainTabsController(factory: factory, styleContainer: styleContainer)
        }
        
        let authorizationEndpoint = URL(string: Config.default.authURL)!
        let tokenEndpoint = URL(string: Config.default.tokenURL)!
        MaisonKitAuth.configure(withAuthURL: authorizationEndpoint, tokenURL: tokenEndpoint)
        
        let createLoginController: (AuthenticationDelegate) -> UIViewController = { delegate in
            return self.createLoginController(factory: factory, delegate: delegate)
        }
        
        self.setupLogoutListeners()
        
        self.appCoordinator = AppCoordinator(window: self.window,
                                             stylist: stylist,
                                             delegate: self,
                                             loginControllerFactory: createLoginController,
                                             mainControllerFactory: self.createMainController!)
        
        if let window = self.window {
            self.toastViewPresenter = ToastViewPresenter(window: window, windowScene: windowScene, stylist: stylist, sceneFactory: factory)
            self.toastViewPresenter?.listenToToasts()
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard let userInfo = userActivity.userInfo as? [String: Any] else { return }
        guard userActivity.activityType == CSSearchableItemActionType else { return }
        DispatchQueue.main.async {
            InboundItemHandler.default.handleInboundItem(identifier: .coreSpotlightSearch, data: userInfo)
        }
    }
    
    private func createStylist() -> Stylist {
        let stylist = Stylist.create()
        self.stylist = stylist
        self.setLightTheme()
        return stylist
    }
    
    func setLightTheme() {
        self.stylist?.currentTheme = nil
        self.window?.overrideUserInterfaceStyle = .light
    }
}

// MARK: - Handle registering and unregistering from notifications
private extension SceneDelegate {
    func setupLogoutListeners() {
        NotificationCenter.default.publisher(for: .userDidLogoutNotificationName).sink { _ in
            UIApplication.shared.unregisterForRemoteNotifications()
            MaisonKitUser.currentLoggedInUser = nil
            Crashlytics.setMaisonKitKeysAndValues()
        }.store(in: &self.cancellables)
    }
}
