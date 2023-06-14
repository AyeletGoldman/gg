// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import AppAuth

/// A representation of the available OAuth2 scopes. See http://openid.net/specs/openid-connect-core-1_0.html#ScopeClaims
public struct OIDScope: RawRepresentable, ExpressibleByStringLiteral {

    public private(set) var rawValue: String

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral: String) {
        self.rawValue = stringLiteral
    }

    /// Scope that indicates this request is an OpenID Connect request.
    /// http://openid.net/specs/openid-connect-core-1_0.html#AuthRequestValidation
    public static let openId: OIDScope = OIDScope(stringLiteral: OIDScopeOpenID)
    /// This scope value requests access to the End-User's default profile Claims, which are:
    /// name, family_name, given_name, middle_name, nickname, preferred_username, profile, picture,
    /// website, gender, birthdate, zoneinfo, locale, and updated_at.
    public static let profile: OIDScope = OIDScope(stringLiteral: OIDScopeProfile)
    /// This scope value requests access to the email and email_verified Claims.
    public static let email: OIDScope = OIDScope(stringLiteral: OIDScopeEmail)
    /// This scope value requests access to the address Claim.
    public static let address: OIDScope = OIDScope(stringLiteral: OIDScopeAddress)
    /// This scope value requests access to the phone_number and phone_number_verified Claims.
    public static let phone: OIDScope = OIDScope(stringLiteral: OIDScopePhone)
}

/// A data-holder for the details needed to establish a OAuth2 connection.
public struct OAuth2Details {

    /// The credendials required to identify the client in OAuth2
    public struct Credentials {
        let clientId: String
        let clientSecret: String

        /// Creates a new set of credentials with the given clientId and clientSecret
        public init(clientId: String, clientSecret: String) {
            self.clientId = clientId
            self.clientSecret = clientSecret
        }
    }

    let credentials: Credentials
    let scopes: [OIDScope]
    let redirectURL: URL

    /// Creates a new OAuth2Details data hodler with the given parameters.
    /// - Parameters:
    ///   - credentials: The set of credentials to use when connecting to OAuth2
    ///   - scopes: The set of scopes to request from the connection
    ///   - redirectURL: The URL to redirect to when the authentication succeeds
    public init(credentials: OAuth2Details.Credentials, scopes: [OIDScope], redirectURL: URL) {
        self.credentials = credentials
        self.scopes = scopes
        self.redirectURL = redirectURL
    }
}
