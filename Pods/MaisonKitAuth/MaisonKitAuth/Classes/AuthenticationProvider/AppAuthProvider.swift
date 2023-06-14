// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import AppAuth
import KeychainAccess

final class AuthenticationProvider {
    static let `default` = AuthenticationProvider()

    private var currentAuthorizationFlow: OIDExternalUserAgentSession?
    private var authState: OIDAuthState?

    /// Creates the AppAuth AuthenticationProvider and attempts to restore previous credentials
    init() {
        try? self.retrieve()
    }

    /// Starts authentication using the given parameters.
    /// Use this authentication when you have only a client ID.
    func beginAuthentication(configuration: Configuration,
                             clientId: String,
                             scopes: [OIDScope],
                             redirectURL: URL,
                             presentingController: UIViewController,
                             completion: @escaping AuthenticationCompletion) {
        let oidConfiguration = OIDServiceConfiguration(authorizationEndpoint: configuration.authURL,
                                                       tokenEndpoint: configuration.tokenURL)
        // builds authentication request
        let request = OIDAuthorizationRequest(configuration: oidConfiguration,
                                              clientId: clientId,
                                              scopes: scopes.map { $0.rawValue },
                                              redirectURL: redirectURL,
                                              responseType: OIDResponseTypeCode,
                                              additionalParameters: nil)
        self.beginAuthentication(request: request, presentingController: presentingController, completion: completion)
    }

    /// Starts authentication using the given parameters.
    /// Use this authentication when you have a client ID and secret.
    func beginAuthentication(configuration: Configuration,
                             credentials: OAuth2Details.Credentials,
                             scopes: [OIDScope],
                             redirectURL: URL,
                             presentingController: UIViewController,
                             completion: @escaping AuthenticationCompletion) {
        let oidConfiguration = OIDServiceConfiguration(authorizationEndpoint: configuration.authURL,
                                                       tokenEndpoint: configuration.tokenURL)
        // builds authentication request
        let request = OIDAuthorizationRequest(configuration: oidConfiguration,
                                              clientId: credentials.clientId,
                                              clientSecret: credentials.clientSecret,
                                              scopes: scopes.map { $0.rawValue },
                                              redirectURL: redirectURL,
                                              responseType: OIDResponseTypeCode,
                                              additionalParameters: nil)
        self.beginAuthentication(request: request, presentingController: presentingController, completion: completion)

    }

    private func beginAuthentication(request: OIDAuthorizationRequest,
                                     presentingController: UIViewController,
                                     completion: @escaping AuthenticationCompletion) {
        // performs authentication request
        self.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request,
                                                               externalUserAgent: OIDEphemeralASWebAuthenticationUserAgent(with: presentingController)) { [weak self] authState, error in
            self?.authState = authState
            if let authState = authState {
                guard let token = self?.authenticationToken(from: authState) else {
                    completion(.failure(AuthenticationError.noTokensFound))
                    return
                }
                try? self?.store()
                completion(.success(token))
            } else {
                let error = error ?? AuthenticationError.unknown
                completion(.failure(error))
            }
        }
    }

    func refreshToken(complete: @escaping AuthenticationCompletion) {
        guard let authState = self.authState else {
            complete(.failure(AuthenticationError.noTokensFound))
            return
        }
        authState.performAction(freshTokens: { [weak self] authToken, idToken, error in
            if let error = error {
                complete(.failure(AuthenticationError.tokenRefreshFailed(underlying: error)))
                return
            }
            guard let authToken = self?.authenticationToken(from: authState, authToken: authToken) else {
                complete(.failure(AuthenticationError.noTokensFound))
                return
            }
            try? self?.store()
            complete(.success(authToken))
        })
    }

    func retrieveCurrentAccessToken() -> AuthenticationToken? {
        guard let authState = self.authState else { return nil }
        return self.authenticationToken(from: authState)
    }

    func logout(done: (Bool) -> Void) {
        self.clear()
        // TODO: We don't currently have a logout endpoint
        done(true)
    }
}

// MARK: Private

private extension AuthenticationProvider {
    func authenticationToken(from state: OIDAuthState, authToken: String? = nil) -> AuthenticationToken? {
        guard let authToken = authToken ?? state.lastTokenResponse?.accessToken,
              let refreshToken = state.refreshToken else {
            return nil
        }

        let accessExpiry = state.lastTokenResponse?.accessTokenExpirationDate.map {
            return Token.Expiry(expiryDate: $0)
        }
        return AuthenticationToken(token: Token(value: authToken, expiry: accessExpiry),
                                   refreshToken: Token(value: refreshToken))
    }
}

// MARK: Storage

private extension String {
    /// MaisonKitAuth's keychain user key
    static let userKeychainKey = "fr.lvmh.authStateKey"
}

extension Keychain {
    /// A keychain service for use in MaisonKitAuth.
    static let maisonKitAuth = Keychain(service: "fr.lvmh.auth")
}


private extension AuthenticationProvider {
    func store() throws {
        guard let authState = self.authState else { return }
        let data = try NSKeyedArchiver.archivedData(withRootObject: authState, requiringSecureCoding: true)
        try Keychain.maisonKitAuth.set(data, key: .userKeychainKey)
    }

    func retrieve() throws {
        guard let data = try Keychain.maisonKitAuth.getData(.userKeychainKey) else {
            throw AuthenticationError.noTokensFound
        }
        self.authState = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? OIDAuthState
    }

    func clear() {
        self.authState = nil
        self.currentAuthorizationFlow?.cancel()
        self.currentAuthorizationFlow = nil
        try? Keychain.maisonKitAuth.remove(.userKeychainKey)
    }
}
