// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// Builds a view based on the result given and the views passed in.
/// 1. Waiting - before having any data.
///     1a. Show waitingView if not nil
///     1b. Else - show a loader
/// 2. Loading - waiting for results from the server
///     1a. Show a loader if we are not having any data yet
///     1a. Else - behave same as 'found' (so we are not blocked to see the existing results)
/// 3. Found - getting the data successfuly
///     1b. Show the content view
/// 4. Failed - getting an error when tring to get the data
///     1a. Show the error view if available or a text message with the error's description
public final class ResultStateViewBuilder<T, E: Error> {

    enum ErrorDisplayType {
        case custom((E) -> AnyView)
        case `default`(retryButtonData: ButtonData?)
    }

    private let result: ResultState<T, E>
    private var waiting: (() -> AnyView)?
    private var errored: ErrorDisplayType?
    private var loading: ((T?) -> AnyView)?
    fileprivate var empty: (() -> AnyView)?

    /// Creates a new `ResultStateViewBuilder` with the given `ResultState`
    /// - Parameter result: the state to model the view with
    public init(result: ResultState<T, E>) {
        self.result = result
    }

    /// Builds the content given by switching on the result state and displaying the required views
    /// - Parameter content: a closure to build the content for the `.found` state
    /// - Returns: a view representing the current `result`
    @ViewBuilder
    public func buildContent<Content: View>(@ViewBuilder _ content: (T) -> Content) -> some View {
        self.buildDefaultView(content)
    }

    @ViewBuilder
    private func buildDefaultView<Content: View>(@ViewBuilder _ content: (T) -> Content) -> some View {
        switch self.result {
        case .waiting:
            if let waiting = self.waiting {
                waiting()
            } else {
                LoadingView()
            }
        case .loading(let data):
            if let loadingView = self.loading {
                RedactedLoadingView(wrapped: { loadingView(data) })
            } else {
                LoadingView()
            }
        case .found(let data):
            if let emptyData = data as? EmptyStateRepresentable, emptyData.isEmpty, let empty = self.empty?() {
                empty
            } else {
                content(data)
            }
        case .failed(let error):
            self.buildErrorView(for: error)
        }
    }

    @ViewBuilder
    private func buildErrorView(for error: E) -> some View {
        switch self.errored {
        case .default(let buttonData):
            ErrorView(error: error, actionButtonData: buttonData)
        case .custom(let errorView):
            ErrorView(customErrorView: { errorView(error) })
        case .none:
            ErrorView(error: error, actionButtonData: nil)
        }
    }

    /// Sets the waiting view for the given result state
    /// - Parameter waiting: a closure that produces a view to be used when the state is `.waiting`
    /// - Returns: this instance of the `ResultStateViewBuilder` with the waiting view configured
    public func setWaitingView<Waiting: View>(@ViewBuilder _ waiting: @escaping () -> Waiting) -> Self {
        self.waiting = { waiting().eraseToAnyView() }
        return self
    }

    /// Sets the loading view for the given result state
    /// - Parameter loading: a closure that produces a view to be used when the state is `.loading`
    /// - Returns: this instance of the `ResultStateViewBuilder` with the loading view configured
    public func setLoadingView<Loading: View>(@ViewBuilder _ loading: @escaping () -> Loading) -> Self {
        self.loading = { _ in loading().eraseToAnyView() }
        return self
    }

    /// Sets the loading view for the given result state
    /// - Parameter loading: a closure that produces a view to be used when the state is `.loading` and we may have data.
    /// - Returns: this instance of the `ResultStateViewBuilder` with the loading view configured
    public func setLoadingView<Loading: View>(@ViewBuilder _ loading: @escaping (T?) -> Loading) -> Self {
        self.loading = { loading($0).eraseToAnyView() }
        return self
    }

    /// Sets the errored action to be used when there is no custom error view and we just want to use the default view
    /// Useful for implementing things like a retry button.
    /// - Parameter buttonData: the data of the button to show
    /// - Returns: this instance of the `ResultStateViewBuilder` with the errored state configured
    public func setErroredAction(_ buttonData: ButtonData) -> Self {
        self.errored = .default(retryButtonData: buttonData)
        return self
    }

    /// Sets the error view
    /// - Parameter errorView: a closure that produces a view to be used when the state is `.failed`.
    /// - Returns: this instance of the `ResultStateViewBuilder` with the error view configured
    public func setErrorView<ErrorView: View>(@ViewBuilder _ errorView: @escaping (E) -> ErrorView) -> Self {
        self.errored = .custom({ error in errorView(error).eraseToAnyView() })
        return self
    }
}

public extension ResultStateViewBuilder where T: EmptyStateRepresentable {

    /// Sets the empty view that will be shown when the state is considered to be empty.
    /// This is useful for lists of items, for example.
    /// - Parameter empty: the view to build
    /// - Returns: this instance of the `ResultStateViewBuilder` with the empty view configured
    func setEmptyView<Empty: View>(@ViewBuilder _ empty: @escaping () -> Empty) -> Self {
        self.empty = { empty().eraseToAnyView() }
        return self
    }
}

extension ResultStateViewBuilder where E == ErrorDisplayable {

    /// Builds the content for the view when the error type is `ErrorDisplayable`
    /// - Parameter content: the content view builder
    /// - Returns: a view where all states except the `.failed` state simply build the view given by `content`.
    @ViewBuilder
    public func buildContent<Content: View>(@ViewBuilder _ content: (T) -> Content) -> some View {
        switch self.result {
        case .waiting, .loading, .found:
            self.buildDefaultView(content)
        case .failed(let error):
            self.buildErrorView(for: error)
        }
    }
}

/// Represents an item that may be empty
public protocol EmptyStateRepresentable {

    /// Whether the state is empty or not
    var isEmpty: Bool { get }
}

extension Array: EmptyStateRepresentable { }
extension Set: EmptyStateRepresentable { }
extension Dictionary: EmptyStateRepresentable { }
