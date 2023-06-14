// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// Defines a class that will support providing and refreshing authorization tokens.
public protocol TokenRefreshing {

    typealias RefreshTokenClosure = (Result<Void, Error>) -> Void

    func refreshToken(done: @escaping RefreshTokenClosure)
    func authTokenObservable() -> AnyPublisher<AuthenticationToken, Error>
}

public typealias TokenRefreshingAdapter = (@escaping AuthenticationCompletion) -> Void
public typealias TokenFactory = () -> AuthenticationToken?

/// The default authentication token refresher.
public final class AuthTokenRefresher: TokenRefreshing {

    public static let defaultTokenFactory: TokenFactory = {
        return AuthenticationProvider.default.retrieveCurrentAccessToken()
    }

    public typealias TokenProviding = () -> AuthenticationToken?
    public typealias TokenStoring = (AuthenticationToken) -> Void
    typealias AuthTokenPromise = Future<AuthenticationToken, Error>.Promise

    /// The networking stack that will support refreshing access tokens
    private let tokenRefreshAdapter: TokenRefreshingAdapter
    private let tokenFactory: TokenFactory

    private var bin = Set<AnyCancellable>()
    private var isRequestingNewToken = false
    private var refreshSubject = PassthroughSubject<AuthenticationToken, Error>()

    // When we make a, or a series of requests in parallel, and the token has expired
    // we want to refresh the token and then retry the request. Now, if the requests
    // were made in parallel, and they all receive a 401 at the same time we don't want
    // to make X requests for token refresh so we take the first one and wait until it has
    // completed, then we dispatch all the retries at the same time.
    private let semaphore = DispatchSemaphore(value: 1)
    private var refreshTokenRegistrations = [TokenRefreshing.RefreshTokenClosure]()

    public init(tokenRefreshAdapter: @escaping TokenRefreshingAdapter,
                tokenFactory: @escaping TokenFactory = AuthTokenRefresher.defaultTokenFactory) {
        self.tokenRefreshAdapter = tokenRefreshAdapter
        self.tokenFactory = tokenFactory
    }

    /// Refreshes an authentication token and calls the given closure when done with the result
    /// When the token is refreshed, the new token is stored via the tokenStorage passed in to this class
    public func refreshToken(done: @escaping TokenRefreshing.RefreshTokenClosure) {
        // This may be called several times very quickly, but we only want to dispatch the
        // refresh once.
        self.semaphore.wait()
        defer { self.semaphore.signal() }

        guard self.refreshTokenRegistrations.isEmpty else {
            self.refreshTokenRegistrations.append(done)
            return
        }

        self.refreshTokenRegistrations.append(done)
        self.createRefreshTokenOperation()
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.semaphore.wait()
                defer { self?.semaphore.signal() }
                self?.handleRefreshTokenCompletion(completion: completion)
                self?.refreshTokenRegistrations = []
            }, receiveValue: { _ in })
            .store(in: &self.bin)
    }

    private func handleRefreshTokenCompletion(completion: Subscribers.Completion<Error>) {
        let result: Result<Void, Error> = completion.error.map { .failure($0) } ?? .success(())
        for callback in self.refreshTokenRegistrations {
            callback(result)
        }
    }

    /// Returns an observable token that on completion will either have a new token to use for authentication
    /// or an complete with an error if there was no way to get a token.
    public func authTokenObservable() -> AnyPublisher<AuthenticationToken, Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }

            if let token = self.tokenFactory() {
                promise(.success(token))
                return
            }

            self.setupRefreshSubject(promise)

            if !self.isRequestingNewToken {
                self.refreshTokenAndPublishResult()
            }
        }.eraseToAnyPublisher()
    }

    /// Sets up the refresh subject with the given promise. Once the subject has received a value for the token it calls the
    /// given promise with the newly refreshed token's value.
    /// - Parameter promise the promise to call when the subject has either completed or received a value.
    private func setupRefreshSubject(_ promise: @escaping AuthTokenPromise) {
        self.refreshSubject.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                promise(.failure(error))
            case .finished: break
            }
        }, receiveValue: { token in
            promise(.success(token))
        }).store(in: &self.bin)
    }

    /// Refreshes the given `AuthenticationToken` and publishes the result to the `refreshSubject` so all listening subscriptions will continue
    /// when the token has been refreshed
    /// - Parameter with the `AuthenticationToken` that will be refreshed.
    private func refreshTokenAndPublishResult() {
        self.createRefreshTokenOperation()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.isRequestingNewToken = true
            })
            .sink(receiveCompletion: { [weak self] completion in
                self?.isRequestingNewToken = false
                switch completion {
                case .failure:
                    self?.refreshSubject.send(completion: completion)
                case .finished:
                    break // We don't want to send a `finished` event to the refreshSubject because it outlives this request.
                }

            }, receiveValue: { [weak self] in
                self?.refreshSubject.send($0)
            }
        ).store(in: &self.bin)
    }

    /// Creates and returns a refresh token operation with the refresh token in the given `AuthenticationToken`.
    /// - Parameter with the `AuthenticationToken` to get the value of the refresh token from.
    /// - Returns: a Publisher that will either error or return a refreshed `AuthenticationToken`
    private func createRefreshTokenOperation() -> AnyPublisher<AuthenticationToken, Error> {
        return Future { [weak self] promise in
            self?.tokenRefreshAdapter {
                promise($0)
            }
        }.eraseToAnyPublisher()
    }
}


extension Subscribers.Completion where Failure: Error {
    var error: Error? {
        switch self {
        case .failure(let error):
        return error
        case .finished:
            return nil
        }
    }
}
