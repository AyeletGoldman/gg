// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public typealias AuthenticationResult = Result<AuthenticationToken, Error>
public typealias AuthenticationCompletion = (AuthenticationResult) -> Void

private var configuration: Configuration?

/// Sets up the configuration for the authentication via OAuth2. Calling this method is required *before* calling `beginAuthentication`
/// - Parameters:
///   - authURL: The URL to use to load in a web-view.
///   - tokenURL: The URL to use to exchange the authentication code for an access token.
public func configure(withAuthURL authURL: URL, tokenURL: URL) {
    MaisonKitAuth.configuration = Configuration(authURL: authURL, tokenURL: tokenURL)
}


/// Begins authentication by presenting a webview loaded with the `authURL` from the `configure` function for the user to authenticate.
/// - Parameters:
///   - oauth2Details: The details to use to configure the request when presenting the authorization prompt
///   - presentingController: The controller that will present the authorization UI
///   - completion: A closure to invoke when authorization has completed with the result of the authorization operation.
public func beginAuthentication(oauth2Details: OAuth2Details,
                                presentingController: UIViewController,
                                completion: @escaping AuthenticationCompletion) {
    guard let configuration = MaisonKitAuth.configuration else {
        completion(.failure(AuthenticationError.configurationNotFound))
        return
    }

    AuthenticationProvider.default.beginAuthentication(configuration: configuration,
                                                       credentials: oauth2Details.credentials,
                                                       scopes: oauth2Details.scopes,
                                                       redirectURL: oauth2Details.redirectURL,
                                                       presentingController: presentingController,
                                                       completion: completion)
}

/// Begins authentication by presenting a webview loaded with the `authURL` from the `configure` function for the user to authenticate.
/// - Parameters:
///   - clientId: The client ID to use for authentication
///   - scopes: the array of scopes to request from the authorization server
///   - redirectURL: the URL to redirect to upon successful authentication.
///   - presentingController: The controller that will present the authorization UI
///   - completion: A closure to invoke when authorization has completed with the result of the authorization operation.
public func beginAuthentication(clientId: String,
                                scopes: [OIDScope],
                                redirectURL: URL,
                                presentingController: UIViewController,
                                completion: @escaping AuthenticationCompletion) {
    guard let configuration = MaisonKitAuth.configuration else {
        completion(.failure(AuthenticationError.configurationNotFound))
        return
    }

    AuthenticationProvider.default.beginAuthentication(configuration: configuration,
                                                       clientId: clientId,
                                                       scopes: scopes,
                                                       redirectURL: redirectURL,
                                                       presentingController: presentingController,
                                                       completion: completion)
}

/// Refreshes the access token if possible and calls the given closure with the result of refreshing
/// - Parameter complete: A closure to invoke with the result of refreshing the current access token.
public func refreshToken(complete: @escaping AuthenticationCompletion) {
    AuthenticationProvider.default.refreshToken(complete: complete)
}


/// Logs the user out, then calls the given closure to
/// - Parameter done: A closure to invoke with the result of logging the user out. `true` if the user was logged out, `false` otherwise.
public func logout(done: (Bool) -> Void) {
    AuthenticationProvider.default.logout(done: done)
}


/// Retrieves the current access token, if available
/// - Returns: an instance of `AuthenticationToken` if it is available and valid.
public func retrieveCurrentAccessToken() -> AuthenticationToken? {
    return AuthenticationProvider.default.retrieveCurrentAccessToken()
}
