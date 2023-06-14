// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the presentation of the authentication screen.
public struct AuthenticationRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "AuthenticationRouteDescriptor"

    /// A closure that should perform the login and then call the given closure with an error if there was an error or `nil` if authentication was successful.
    public let performLogin: (@escaping (Error?) -> Void) -> Void
    /// The authentication delegate. Has a single method that is called when the authentication screen has finished authenticating.
    // swiftlint:disable:next weak_delegate
    public let delegate: AuthenticationDelegate

    /// Creates a new `AuthenticationRouteDescriptor` to map to a scene that will present an authentication screen.
    /// - Parameters:
    ///   - delegate: The authentication delegate. Has a single method that is called when the authentication screen has finished authenticating.
    ///   - performLogin: A closure that should perform the login and then call the given closure with an error if there was an error or `nil` if authentication was successful.
    public init(delegate: AuthenticationDelegate, performLogin: @escaping (@escaping (Error?) -> Void) -> Void) {
        self.delegate = delegate
        self.performLogin = performLogin
    }
}
