// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MaisonKit
import MaisonKitAuth

enum MaisonKitDevError: Error {
    case noRootViewController
}

// MARK: CoordinatorAuthenticationDelegate
extension SceneDelegate: CoordinatorAuthenticationDelegate {

    func currentLoginStatus() -> LoginStatus {
        guard let token = MaisonKitAuth.retrieveCurrentAccessToken(),
              NetworkAdapter.currentCurrencyCode != nil,
              NetworkAdapter.currentStoreCode != nil else {
            return .loggedOut
        }

        if token.isValid {
            return .loggedIn
        } else {
            return .refreshRequired
        }
    }

    func appCoordinatorWantsLogout(_ coordinator: AppCoordinator, logoutResult: @escaping (Bool) -> Void) {
        MaisonKitAuth.logout(done: logoutResult)
    }

    func appCoordinatorWantsRefreshToken(_ coordinator: AppCoordinator, refreshTokenResult: @escaping (Bool) -> Void) {
        MaisonKitAuth.refreshToken(complete: { result in
            refreshTokenResult(result.isSuccess)
        })
    }

    func attemptToLogin(loginResult: @escaping (Error?) -> Void) {
        guard let presentingController = self.window?.rootViewController else {
            loginResult(MaisonKitDevError.noRootViewController)
            return
        }
        
        MaisonKitAuth.beginAuthentication(clientId: Config.default.clientId,
                                          scopes: [.openId, .profile, "offline_access"],
                                          redirectURL: URL(string: Config.default.returnURL)!,
                                          presentingController: presentingController,
                                          completion: { loginResult($0.error) })
    }
}

extension Result {
    var error: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }

    var isSuccess: Bool {
        switch self {
        case .failure:
            return false
        case .success:
            return true
        }
    }
}
