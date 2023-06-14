// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A result that has three possible states: success, failure or cancelled.
public enum CancellableResult {
    /// A successful result of the operation
    case success
    /// A failure result of the operation, with the error as an associated value if available
    case failure(Error?)
    /// The operation was cancelled
    case cancelled
}
