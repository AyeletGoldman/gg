// Copyright © 2022 LVMH. All rights reserved.

import Combine

struct ZipMany<Element, Failure>: Publisher where Failure: Error {
    typealias Output = [Element]

    private let underlying: AnyPublisher<Output, Failure>

    init<T: Publisher>(_ publishers: [T]) where T.Output == Element, T.Failure == Failure {
        let zipped: AnyPublisher<[T.Output], T.Failure>? = publishers.reduce(nil) { result, publisher in
            if let result = result {
                return publisher.zip(result).map { element, array in
                    array + [element]
                }.eraseToAnyPublisher()
            } else {
                return publisher.map { [$0] }.eraseToAnyPublisher()
            }
        }
        underlying = zipped ?? Empty(completeImmediately: false)
            .eraseToAnyPublisher()
    }

    func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        underlying.receive(subscriber: subscriber)
    }
}
