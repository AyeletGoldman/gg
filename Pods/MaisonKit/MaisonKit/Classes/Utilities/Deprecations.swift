// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// An `Error` that indicates that a method was not implemented
/// This is usually used by MaisonKit to indicate that an adapter function was not implemented by the host app
/// so that it is convenient to check the error type and decide to call a deprecated method.
public struct NotImplementedError: Error {

    /// Creates a new `NotImplementedError`
    public init() { }
}

extension Publisher {
    func patchUnimplemented<OtherValue: Publisher>(to otherValue: OtherValue) -> AnyPublisher<OtherValue.Output, OtherValue.Failure>
    where Failure == OtherValue.Failure, Output == OtherValue.Output {
        self.catch { error -> AnyPublisher<OtherValue.Output, OtherValue.Failure> in
            guard error is NotImplementedError else { return Fail(error: error).eraseToAnyPublisher() }
            return otherValue.eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}
