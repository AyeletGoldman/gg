// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The Scene for Authentication
/// This Scene creates and configures an `AuthenticationViewController`
struct AuthenticationScene: Scene {

    private let performLogin: (@escaping (Error?) -> Void) -> Void
    // swiftlint:disable:next weak_delegate
    private let delegate: AuthenticationDelegate

    /// Creates a new AuthenticationScene
    /// - Parameters:
    ///   - delegate: the authentication delegate to configure the view model with
    ///   - performLogin: The closure to invoke when the user wants to log in. It takes another closure that will be invoked when the login has happened.
    init(delegate: AuthenticationDelegate, performLogin: @escaping (@escaping (Error?) -> Void) -> Void) {
        self.performLogin = performLogin
        self.delegate = delegate
    }

    func createViewController() -> AuthenticationViewController {
        return AuthenticationViewController()
    }

    func configure(controller: AuthenticationViewController,
                   using factory: SceneFactory) {
        let viewModel = AuthenticationViewModel(performLogin: self.performLogin)
        viewModel.delegate = self.delegate
        controller.viewModel = viewModel
    }
}
