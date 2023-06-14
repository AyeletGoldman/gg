// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

/// The delegate for authentication. Implement this delegate to be informed when the
/// authentication view model has finished authenticating.
public protocol AuthenticationDelegate: AnyObject {

    /// Invoked when the authentication view model has finished fetching the current logged-in user's details, and therefore the user is
    /// fully logged in.
    /// - Parameter authenticationViewModel: the view model that has performed authentication.
    func authenticationViewModelDidFetchUser(_ authenticationViewModel: AuthenticationViewModel)
}

/// A view model to handle the authentication from the `AuthenticationView`.
public final class AuthenticationViewModel: ObservableObject {

    enum AuthenticationStatus {
        case notStarted
        case loggingIn
        case errored
    }

    private var cancellables = Set<AnyCancellable>()

    weak var delegate: AuthenticationDelegate?

    @Published private(set) var authenticationStatus: AuthenticationStatus = .notStarted

    private enum Constants {
        static let queryItemCodeKey = "code"
        static let lvmhScheme = "lvmh"
        static let loginSuccessPath = "login-success"
    }

    private let performLogin: (@escaping (Error?) -> Void) -> Void
    @Inject private var userAdapter: UserAdapter

    /// Initializes a new `AuthenticationViewModel` and registers with the notification center
    /// for the user log in notification.
    /// - Parameters:
    ///   - performLogin: The closure to invoke when the user wants to log in. It takes another closure that will be invoked when the login has happened.
    public init(performLogin: @escaping (@escaping (Error?) -> Void) -> Void) {
        self.performLogin = performLogin
    }

    func didTapLogin() {
        self.authenticationStatus = .loggingIn
        self.performLogin { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.authenticationStatus = .errored
                Analytics.log(LoginFailedEvent(error: error))
                return
            }
            self.userAdapter.getUserDetails().sink { completion in
                switch completion {
                case .failure(let error):
                    self.authenticationStatus = .errored
                    Analytics.log(LoginFailedEvent(error: error))
                case .finished:
                    break
                }
            } receiveValue: { user in
                MaisonKitUser.currentLoggedInUser = user
                Analytics.log(LoginSuccessEvent())
                self.delegate?.authenticationViewModelDidFetchUser(self)
            }.store(in: &self.cancellables)
        }
    }
}
