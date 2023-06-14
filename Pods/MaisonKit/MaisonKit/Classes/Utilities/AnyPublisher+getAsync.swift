// Copyright © 2022 LVMH. All rights reserved.

import Combine

public extension Publisher {

    /// Parse a publisher to an async function
    /// - Returns: The publisher output
    func getAsync() async throws -> Output {
        try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            cancellable = self.sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .finished: break
                }
                cancellable?.cancel() // Needed only for the garbage collector to keep the variable for later and not dispose of it
                cancellable = nil
            }, receiveValue: {
                continuation.resume(returning: $0)
                // `withCheckedContinuation`'s `resume` can only ever be called once, so make sure we cancel after the first value is received
                cancellable?.cancel() // Needed only for the garbage collector to keep the variable for later and not dispose of it
            })
        }
    }

    /// Parse a publisher with a `Result` output type to an async function
    /// - Returns: The publisher output result data
    func getResultAsync<T>() async throws -> T where Output == Result<T, ErrorDisplayable> {
        try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            cancellable = self.sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .finished: break
                }
                cancellable?.cancel() // Needed only for the garbage collector to keep the variable for later and not dispose of it
                cancellable = nil
            }, receiveValue: {
                continuation.resume(with: $0)
                // `withCheckedContinuation`'s `resume` can only ever be called once, so make sure we cancel after the first value is received
                cancellable?.cancel()
            })
        }
    }
}
