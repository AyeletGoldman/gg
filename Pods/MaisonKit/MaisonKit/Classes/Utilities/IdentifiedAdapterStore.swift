// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// An object that creates and stores publishers. Pass this object a publisher that will return a new value for the stored types and the store
/// will find the correct publisher and pass through the new value. The publishers stored do not end.
public final class IdentifiedAdapterStore<StoredType, ID: Hashable> {
    private var storedValue = [ID: PassthroughSubject<Result<StoredType, ErrorDisplayable>, Never>]()
    private var cancellables = Set<AnyCancellable>()

    /// Creates a new `IdentifiedAdapterStore`.
    public init() {
        NotificationCenter.default
            .publisher(for: UIApplication.didReceiveMemoryWarningNotification)
            .merge(with: NotificationCenter.default.publisher(for: .userDidLogoutNotificationName))
                .sink { [weak self] _ in
                    self?.clearAndCancel()
                }.store(in: &self.cancellables)
    }

    /// Takes a publisher to subscribe to and returns a publisher that will update when the new value is received
    /// - Parameters:
    ///   - objectID: the ID of the object. This is used for storing and retrieving the correct publisher.
    ///   - publisher: the publisher to subscribe to whose result will be forwarded onto the stored publisher.
    /// - Returns: A publisher that will return the result of the original publisher, but will not finish.
    public func update<P: Publisher>(objectID: ID, from publisher: P) -> AnyPublisher<Result<StoredType, ErrorDisplayable>, Never>
    where P.Output == StoredType, P.Failure == Error {
        // 1. Retrieve or create a publisher from the store
        let pub = self.retrieveOrCreatePublisher(objectID: objectID)

        // 2. Subscribe to the publisher we got to be able to listen to completion events
        publisher.sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                pub.send(.failure(ErrorDisplayable(error)))
            }
        } receiveValue: { value in
            pub.send(.success(value))
        }.store(in: &self.cancellables)

        return pub.eraseToAnyPublisher()
    }

    private func retrieveOrCreatePublisher(objectID: ID) -> PassthroughSubject<Result<StoredType, ErrorDisplayable>, Never> {
        if let publisher = self.storedValue[objectID] {
            return publisher
        }
        let newPublisher = PassthroughSubject<Result<StoredType, ErrorDisplayable>, Never>()
        self.storedValue[objectID] = newPublisher
        return newPublisher
    }

    private func clearAndCancel() {
        self.storedValue = [:]
        self.cancellables.forEach { $0.cancel() }
        self.cancellables = []
    }
}
