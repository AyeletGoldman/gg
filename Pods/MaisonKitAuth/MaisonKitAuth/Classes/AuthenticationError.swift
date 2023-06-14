// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The errors that can be returned from this library
public enum AuthenticationError: Error, CustomDebugStringConvertible, CustomStringConvertible {
    case configurationNotFound
    case noTokensFound
    case tokenRefreshFailed(underlying: Error?)
    case notLoggedIn
    case unknown

    public var debugDescription: String {
        switch self {
        case .configurationNotFound:
            return "You must set the configuration before calling any authorization method. See `configure(withAuthURL:tokenURL:).`"
        case .noTokensFound:
            return "The authorization call was successful but we were unable to find any tokens in the response."
        case .unknown:
            return "An unknown error occurred. Likely we did not get auth data but no error either."
        case .notLoggedIn:
            return "The user is not logged in."
        case .tokenRefreshFailed(let underlyingError):
            return "Could not refresh access token. Underlying error: \(underlyingError.debugDescription)."
        }
    }

    public var description: String {
        switch self {
        case .configurationNotFound:
            return "Unable to find configuration."
        case .noTokensFound:
            return "No tokens found."
        case .unknown:
            return "An unknown error occurred."
        case .notLoggedIn:
            return "The user is not logged in."
        case .tokenRefreshFailed:
            return "Unable to refresh the access token."
        }
    }
}
