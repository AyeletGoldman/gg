// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

extension ResultState where E == ErrorDisplayable {
    static func fromTask(_ task: Task<T, any Error>) async -> Self {
        let result = await task.result.mapError { return ErrorDisplayable($0) }
        if task.isCancelled { return .waiting }
        return ResultState.fromResult(result: result)
    }
}

extension ResultState where E == ErrorDisplayable {
    static func fromAsyncPublisher<P: Publisher>(_ publisher: P) async -> Self where P.Output == Result<T, ErrorDisplayable> {
        let task = Task {
            return try await publisher.getResultAsync()
        }
        return await ResultState.fromTask(task)
    }
}

extension ResultState where E == ErrorDisplayable {
    static func fromAsyncPublisher<P: Publisher>(_ publisher: P) async -> Self where P.Output == T {
        let task = Task {
            return try await publisher.getAsync()
        }
        return await ResultState.fromTask(task)
    }
}
