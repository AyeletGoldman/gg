// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// A protocol to allow retrieving logged in user information
public protocol UserAdapter {
    /// Retrieves the logged-in user's information
    /// - Returns: a publisher that returns either a `User` or an `ErrorDisplayable`.
    /// If the publisher returns an error, this publisher finishes and you will not be able to return any new values for the user.
    func getUserDetails() -> AnyPublisher<User, ErrorDisplayable>
}
