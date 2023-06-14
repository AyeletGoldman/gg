// Copyright © 2020 LVMH. All rights reserved.

import Foundation

public extension Result {
    /// Returns the value in the `Result` if the result is `.success`. Otherwise returns `nil`.
    var value: Success? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    /// Returns whether or not this `Result` was `.success`.
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    /// Returns the value in the `Result` if the result is `.success`. Otherwise throws the error.
    /// - Returns: the value in the `Result` if the result is `.success`.
    func getValue() throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }

}
