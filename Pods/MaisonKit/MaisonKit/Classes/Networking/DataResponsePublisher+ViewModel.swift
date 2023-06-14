// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// Convenience methods to support transforming DTOs into view models.
public extension AnyPublisher {
    /// Maps a given publisher whose `Output` is `Result<T, Error>`  to a different publisher
    /// whose `Output` is of type `Result<VM, Error>`.
    /// - Parameter responseMap: The closure to call to map the output from one publisher's `Output` to another.
    ///  This closure can throw, in which case the publisher's `Output` is `.failure` with the error thrown.
    /// - Returns: a publisher that has been mapped by applying the closure given in `responseMap`
    func mk_mapToViewModel<T, VM>(responseMap: @escaping (T) throws -> VM) -> AnyPublisher<Result<VM, ErrorDisplayable>, Failure> where Output == Result<T, ErrorDisplayable> {
        self.map { value in
            switch value {
            case .failure(let error):
                return .failure(error)
            case .success(let val):
                do {
                    return try .success(responseMap(val))
                } catch {
                    return .failure(ErrorDisplayable(error))
                }
            }
        }.eraseToAnyPublisher()
    }

    /// Maps a given publisher to a different publisher whose `Output` is of type `Result<VM, Error>`.
    /// - Parameter responseMap: The closure to call to map the output from one publisher's `Output` to another.
    ///  This closure can throw, in which case the publisher's `Output` is `.failure` with the error thrown.
    /// - Returns: a publisher that has been mapped by applying the closure given in `responseMap`
    func mk_mapToResultViewModel<VM>(responseMap: @escaping (Output) throws -> VM) -> AnyPublisher<Result<VM, ErrorDisplayable>, Error> {
        self.map { value -> Result<VM, ErrorDisplayable> in
            do {
                return try .success(responseMap(value))
            } catch {
                return .failure(ErrorDisplayable(error))
            }
        }.mapError { error in
            return error as Error
        }.eraseToAnyPublisher()
    }

    /// Maps a given publisher to a different publisher based on the passed in closure.
    /// - Parameter responseMap: The closure to call to map the output from one publisher's `Output` to another.
    ///  This closure can throw, in which case the publisher returns an error.
    /// - Returns: a publisher that has been mapped by applying the closure given in `responseMap`
    func mk_mapToViewModel<VM>(responseMap: @escaping (Output) throws -> VM) -> AnyPublisher<VM, ErrorDisplayable> {
        self.tryMap { value -> VM in
            return try responseMap(value)
        }.mapError { error in
            return ErrorDisplayable(error)
        }.eraseToAnyPublisher()
    }
}

#if DEBUG
public extension AnyPublisher {

    /// Maps a given publisher whose `Output` is `Result<T, Error>`  to a different publisher
    /// whose `Output` is of type `Result<VM, Error>`.
    /// - Parameter responseMap: The closure to call to map the output from one publisher's `Output` to another.
    ///  This closure can throw, in which case the publisher's `Output` is `.failure` with the error thrown.
    /// - Parameter debugErrorMapping: The closure to call to map an error to another error. Useful to make errors more verbose.
    /// - Returns: a publisher that has been mapped by applying the closure given in `responseMap`;
    /// if the value is an error, the `debugErrorMapping` closure is applied instead
    func mapToViewModel<T, VM>(responseMap: @escaping (T) throws -> VM,
                               debugErrorMapping: @escaping (Error) -> ErrorDisplayable) -> AnyPublisher<Result<VM, ErrorDisplayable>, Failure>
    where Output == Result<T, ErrorDisplayable> {
        self.map { value in
            switch value {
            case .failure(let error):
                return .failure(debugErrorMapping(error))
            case .success(let val):
                do {
                    return try .success(responseMap(val))
                } catch {
                    return .failure(debugErrorMapping(error))
                }
            }
        }.eraseToAnyPublisher()
    }

    /// Maps a given publisher to a different publisher whose `Output` is of type `Result<VM, Error>`.
    /// - Parameter responseMap: The closure to call to map the output from one publisher's `Output` to another.
    ///  This closure can throw, in which case the publisher's `Output` is `.failure` with the error thrown.
    /// - Parameter debugErrorMapping: The closure to call to map an error to another error. Useful to make errors more verbose.
    /// - Returns: a publisher that has been mapped by applying the closure given in `responseMap`;
    /// if the value is an error, the `debugErrorMapping` closure is applied instead
    func mapToResultViewModel<VM>(responseMap: @escaping (Output) throws -> VM,
                                  debugErrorMapping: @escaping (Error) -> Error) -> AnyPublisher<Result<VM, ErrorDisplayable>, Error> {
        return self.mk_mapToResultViewModel(responseMap: responseMap)
            .mapError(debugErrorMapping)
            .eraseToAnyPublisher()
    }

    /// Maps a given publisher to a different publisher based on the passed in closure.
    /// - Parameter responseMap: The closure to call to map the output from one publisher's `Output` to another.
    ///  This closure can throw, in which case the publisher returns an error.
    /// - Parameter debugErrorMapping: The closure to call to map an error to another error. Useful to make errors more verbose.
    /// - Returns: a publisher that has been mapped by applying the closure given in `responseMap`;
    /// if the value is an error, the `debugErrorMapping` closure is applied instead
    func mapToViewModel<VM>(responseMap: @escaping (Output) throws -> VM,
                            debugErrorMapping: @escaping (Error) -> ErrorDisplayable) -> AnyPublisher<VM, ErrorDisplayable> {
        return self.mk_mapToViewModel(responseMap: responseMap)
            .mapError(debugErrorMapping)
            .eraseToAnyPublisher()
    }
}
#endif
