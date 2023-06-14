// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// An structure used to model the loading/error/success states of a view that loads its data from a remote instance.
public enum ResultState<T, E: Error> {
    /// The waiting state. It is usually used before the view model requests data.
    case waiting
    /// The loading state. This is usually used while the view model is waiting for the data to arrive.
    /// The associated value is any previous value that was `.found`.
    case loading(T?)
    /// The found state. This is usually used when the data has been found/retrieved successfully.
    /// The associated value is the data that was retrieved.
    case found(T)
    /// The failed state. This is usually used when the operation failed.
    /// The associated value is an error to explain what went wrong.
    case failed(E)
}

public extension ResultState {
    /// Returns the current value of the ResultState, if found.
    /// Will only return items if the state is .loading (with previous items assigned) or .found
    var value: T? {
        switch self {
        case .loading(let items):
            return items
        case .found(let items):
            return items
        default:
            return nil
        }
    }

    /// Returns the current error of the ResultState, if found.
    var error: Error? {
        switch self {
        case .failed(let error):
            return error
        default:
            return nil
        }
    }

    /// Returns whether the `ResultState` is in `.found` state
    var isSuccess: Bool {
        switch self {
        case .found:
            return true
        default:
            return false
        }
    }

    /// Returns whether the `ResultState` is in `.loading` state
    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }

    /// Returns whether the `ResultState` is in `.waiting` state
    var isWaiting: Bool {
        switch self {
        case .waiting:
            return true
        default:
            return false
        }
    }

    /// Returns whether the `ResultState` is in `.failed` state
    var isFailed: Bool {
        switch self {
        case .failed:
            return true
        default:
            return false
        }
    }
}

extension ResultState: Equatable where T: Equatable, E: Equatable {
    /// Any ResultState that is Equatable must have both the error and item it wraps Equatable.
    /// - Parameters:
    ///   - lhs: the first `ResultState` to compare
    ///   - rhs: the second `ResultState` to compare
    /// - Returns: Whether or not the two `ResultState`s that are passed in are considered equal.
    public static func == (lhs: ResultState<T, E>, rhs: ResultState<T, E>) -> Bool {
        switch (lhs, rhs) {
        case (.waiting, .waiting):
            return true
        case (.loading(let lhsItems), .loading(let rhsItems)):
            return lhsItems == rhsItems
        case (.found(let lhsItems), .found(let rhsItems)):
            return lhsItems == rhsItems
        case (.failed(let lhsError), .failed(let rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
}

extension ResultState {
    static func fromResult(result: Result<T, E>) -> ResultState<T, E> {
        switch result {
        case .failure(let error):
            return .failed(error)
        case .success(let value):
            return .found(value)
        }
    }
}

extension ResultState {
    func map<Out>(_ map: (T) -> Out) -> ResultState<Out, ErrorDisplayable> where E == ErrorDisplayable {
        switch self {
        case .found(let item):
            return .found(map(item))
        case .failed(let error):
            return .failed(error)
        case .loading(let item):
            if let item = item {
                return .loading(map(item))
            } else {
                return .loading(nil)
            }
        case .waiting:
            return .waiting
        }
    }
}
