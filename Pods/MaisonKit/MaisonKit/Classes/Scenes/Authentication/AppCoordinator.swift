// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import UIKit
import SwiftUI
import KeychainAccess
import Combine
import StylableSwiftUI

public enum MaisonKitError: Error {
    case notLoggedIn
    case invalidAccessToken
    case noRefreshToken
    case refreshTokenExpired
}

/// An enum to determine the login status of the user
public enum LoginStatus {
    /// The user is not logged in
    case loggedOut
    /// The user is logged in
    case loggedIn
    /// A refresh of the
    case refreshRequired
}

/// A closure that returns a `UIViewController`
public typealias ControllerFactory = () -> UIViewController
/// A closure that takes an `AuthenticationDelegate` and returns a `UIViewController`
public typealias LoginControllerFactory = (AuthenticationDelegate) -> UIViewController

/// A delegate the coordinator uses to inform itself of login status and to tell the host application when it requires a log out event,
/// or a token refresh event.
public protocol CoordinatorAuthenticationDelegate: AnyObject {

    /// Requests the current login status  from the delegate
    /// - Returns: The login status of the host application. 
    func currentLoginStatus() -> LoginStatus

    /// The app coordinator wants the user to be logged out.
    /// - Parameters:
    ///   - coordinator: the coordinator that's requesting the logout event
    ///   - logoutResult: a closure to invoke after logging out, with a parameter indicating whether or not the logout was successful
    func appCoordinatorWantsLogout(_ coordinator: AppCoordinator, logoutResult: @escaping (Bool) -> Void)

    /// The app coordinator wants the access token to be refreshed
    /// - Parameters:
    ///   - coordinator: the coordinator that's requesting the token to be refreshed
    ///   - refreshTokenResult: a closure to invoke after refreshing the token with a parameter indicating whether or not the refresh was successful
    func appCoordinatorWantsRefreshToken(_ coordinator: AppCoordinator, refreshTokenResult: @escaping (Bool) -> Void)
}

/// Main app coordinator. Its responsibility is to manage what view/controller is displayed in the
/// window's root view controller depending on whether the user is logged in or not.
public final class AppCoordinator {

    /// The delegate for authentication. This delegate is responsible for actually performing the authentication.
    /// For example, in an app that authenticates via OAuth, this delegate would present the webview for the user to log in.
    public weak var delegate: CoordinatorAuthenticationDelegate?

    private weak var window: UIWindow?
    private let notificationCenter: NotificationCenter

    private var notificationTokens = [NSObjectProtocol]()
    private var lifecycleNotificationTokens = [NSObjectProtocol]()
    private let mainControllerFactory: ControllerFactory
    private let loginControllerFactory: LoginControllerFactory
    private let stylist: Stylist

    private lazy var intermediaryView: UIView = {
        let view = IntermediaryView()
            .environmentObject(self.stylist)
        let returnView = UIHostingController(rootView: view).view!
        returnView.translatesAutoresizingMaskIntoConstraints = false
        return returnView
    }()

    /// Creates a new AppCoordinator
    /// - Parameters:
    ///   - window: The app's window
    ///   - notificationCenter: the notification center used to post and listen for notifications. Defaults to `default`.
    ///   - stylist: the stylist instance to use to style the login screen. Defaults to `.unstyled`.
    ///   - delegate: the delegate for authentication. This delegate is responsible for actually performing the authentication. Defaults to `nil`.
    ///   - loginControllerFactory: a closure that returns a UIViewController to use as the apps "login controller"
    ///   - mainControllerFactory: a closure that returns a UIViewController to use as the apps "main controller"
    public init(window: UIWindow?,
                notificationCenter: NotificationCenter = .default,
                stylist: Stylist = .unstyled,
                delegate: CoordinatorAuthenticationDelegate? = nil,
                loginControllerFactory: @escaping LoginControllerFactory,
                mainControllerFactory: @escaping ControllerFactory) {
        self.window = window
        self.delegate = delegate
        self.notificationCenter = notificationCenter
        self.loginControllerFactory = loginControllerFactory
        self.mainControllerFactory = mainControllerFactory
        self.stylist = stylist

        window?.rootViewController = self.initialViewController()
        window?.makeKeyAndVisible()
        self.observeLoginStatus()
        self.beginDeterminingLoginStatus()
    }

    /// Observe the login status notifications to present either the main controller or the login views.
    private func observeLoginStatus() {
        let logoutToken = self.notificationCenter.addObserver(forName: .userDidLogoutNotificationName,
                                                              object: nil,
                                                              queue: nil) { [weak self] _ in
                                                                self?.handleLogout()
        }
        self.notificationTokens.append(contentsOf: [logoutToken])
    }

    private func handleLogoutIfNecessary(with error: Error) {
        guard let maisonKitError = error as? MaisonKitError else {
            self.handleLogout()
            return
        }
        switch maisonKitError {
        case .notLoggedIn:
            return
        default:
            self.handleLogout()
        }
    }

    /// Sets the window's root view controller to the login/auth view using a modal "presenting" animation
    private func handleLogout() {
        self.delegate?.appCoordinatorWantsLogout(self, logoutResult: { [weak self] success in
            guard let self = self else { return }
            if success {
                let loginController = self.createLoginController()
                self.window?.setRootViewController(loginController, done: { [weak self] in
                    // Remove the intermediary view if necessary
                    self?.intermediaryView.removeFromSuperview()
                })
                self.stopObservingLifecycleEvents()
            }
        })
    }

    // Creates the login controller/authentication view
    private func createLoginController() -> UIViewController {
        return self.loginControllerFactory(self)
    }

    /// Sets the window's root view controller to the main controller with a "dismissing" animation
    /// i.e. whatever is currently on the screen slides off to screen
    private func handleLogin() {
        let mainController = self.createMainController()
        self.window?.setRootViewController(mainController, options: .dismissing)
        self.observeLifecycleEvents()
        self.notificationCenter.post(name: .userDidLoginNotificationName, object: nil)
    }

    // Creates the main view controller
    private func createMainController() -> UIViewController {
        return self.mainControllerFactory()
    }

    // Returns the initial view controller that should be set in the app's window.
    // If there is no auth token in the keychain we return the login controller, otherwise we
    // create the "main" view controller, as defined by the closure passed in.
    private func initialViewController() -> UIViewController {
        guard let loginStatus = self.delegate?.currentLoginStatus() else {
            return self.createLoginController()
        }
        switch loginStatus {
        case .loggedOut:
            return self.createLoginController()
        case .loggedIn, .refreshRequired:
            return createMainController()
        }
    }

    // Checks login status and refreshes the auth token if needed.
    // If the login status is logged in, it removes the intermediary view
    // If the login status is logged out it shows the authentication view
    private func beginDeterminingLoginStatus() {
        self.showIntermediaryViewIfNeeded()
        guard let loginStatus = self.delegate?.currentLoginStatus() else {
            self.handleLogoutIfNecessary(with: MaisonKitError.notLoggedIn)
            return
        }

        let onLoginSuccess: () -> Void = { [weak self] in
            self?.observeLifecycleEvents()
            self?.intermediaryView.removeFromSuperview()
        }

        switch loginStatus {
        case .loggedIn:
            onLoginSuccess()
        case .loggedOut:
            self.handleLogoutIfNecessary(with: MaisonKitError.notLoggedIn)
            return
        case .refreshRequired:
            self.delegate?.appCoordinatorWantsRefreshToken(self,
                                                           refreshTokenResult: { [weak self] success in
                                                            if success {
                                                                onLoginSuccess()
                                                            } else {
                                                                self?.handleLogoutIfNecessary(with: MaisonKitError.invalidAccessToken)
                                                            }
                                                           })
        }
    }

    private func showIntermediaryViewIfNeeded() {
        // We don't want to show the intermediary view if there is no token
        // because there's nothing to hide.
        // We also don't show the intermediary view if the user is `loggedIn` because
        // we have a valid token
        guard let loginStatus = self.delegate?.currentLoginStatus() else {
            return
        }
        switch loginStatus {
        case .loggedIn, .loggedOut:
            return
        case .refreshRequired:
            break
        }

        // If the intermediary view's superview is nil then it's not being displayed
        guard self.intermediaryView.superview == nil else {
            return
        }

        self.window?.addSubview(self.intermediaryView)
        self.window?.bringSubviewToFront(self.intermediaryView)
        self.window.map { window in
            NSLayoutConstraint.activate([
                window.topAnchor.constraint(equalTo: self.intermediaryView.topAnchor),
                window.bottomAnchor.constraint(equalTo: self.intermediaryView.bottomAnchor),
                window.leadingAnchor.constraint(equalTo: self.intermediaryView.leadingAnchor),
                window.trailingAnchor.constraint(equalTo: self.intermediaryView.trailingAnchor)
            ])
        }
    }

    // We listen to these notifcations to show and hide the intermediary view
    private func observeLifecycleEvents() {
        self.stopObservingLifecycleEvents()
        // Show the intermediary view when we go to the background
        let backgroundToken = self.notificationCenter.addObserver(forName: UIApplication.didEnterBackgroundNotification,
                                                                  object: nil,
                                                                  queue: nil) { [weak self] _ in
                                                                    self?.showIntermediaryViewIfNeeded()
        }

        // Determine what view to show when the user returns to the app
        let foregroundToken = self.notificationCenter.addObserver(forName: UIApplication.willEnterForegroundNotification,
                                                                  object: nil,
                                                                  queue: nil) { [weak self] _ in
                                                                    self?.beginDeterminingLoginStatus()
        }

        self.lifecycleNotificationTokens.append(contentsOf: [backgroundToken, foregroundToken])
    }

    private func stopObservingLifecycleEvents() {
        for token in self.lifecycleNotificationTokens {
            self.notificationCenter.removeObserver(token)
        }
        self.lifecycleNotificationTokens = []
    }

    deinit {
        self.stopObservingLifecycleEvents()
        for token in self.notificationTokens {
            self.notificationCenter.removeObserver(token)
        }
    }
}

extension AppCoordinator: AuthenticationDelegate {
    public func authenticationViewModelDidFetchUser(_ authenticationViewModel: AuthenticationViewModel) {
        self.handleLogin()
    }
}
