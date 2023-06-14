// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A representation of an authentication token that has a value and expiration information
public struct Token {

    /// The `Token`'s expiration information
    public struct Expiry {
        private let issueDate: Date
        private let length: Double // Number of seconds

        /// The date the token is valid until
        var validUntil: Date {
            return self.issueDate.addingTimeInterval(self.length)
        }

        /// Whether or not the token has expired
        var hasExpired: Bool {
            return self.validUntil < Date()
        }

        /// Creates a new `Expiry` object with a duration for the token and an issue date.
        public init(length: Double, issueDate: Date = Date()) {
            self.length = length
            self.issueDate = issueDate
        }

        public init(expiryDate: Date, issueDate: Date = Date()) {
            self.length = issueDate.distance(to: expiryDate)
            self.issueDate = issueDate
        }
    }

    /// The value of this token.
    public let value: String
    /// The expiration information for this token
    let expiry: Expiry?

    /// Creates a new `Token` with a given value and some optional `Expiry` information
    public init(value: String, expiry: Expiry? = nil) {
        self.value = value
        self.expiry = expiry
    }

    /// The date the token is valid until. If there is no expiration date we assume that the token is valid forever.
    var validUntil: Date {
        return self.expiry?.validUntil ?? Date.distantFuture
    }

    /// Whether or not this token has expired. If there is no expiration information we assume the token is valid forever and therefore does not expire.
    var hasExpired: Bool {
        return self.expiry?.hasExpired ?? false
    }
}

/// The main AuthenticationToken object. Stores both the access token and refresh tokens required for making networking calls.
public struct AuthenticationToken {

    /// The access token to be sent as a Bearer
    public let token: Token
    /// The refresh token to use if the current access token has expired to request a new one.
    public let refreshToken: Token

    /// Creates a new `AuthenticationToken` with a given access and refresh `Token`.
    public init(token: Token, refreshToken: Token) {
        self.token = token
        self.refreshToken = refreshToken
    }

    /// Returns whether the current access token is valid. It will be valid if the token has not yet expired,
    /// or if we have no expiration information for the access token.
    public var isValid: Bool {
        return !self.token.hasExpired
    }

    /// Returns whether the current refresh token is valid. It will be valid if the token has not yet expired,
    /// or if we have no expiration information for the refresh token.
    public var isRefreshable: Bool {
        return !self.refreshToken.hasExpired
    }
}

extension AuthenticationToken: Codable { }
extension Token: Codable { }
extension Token.Expiry: Codable { }
