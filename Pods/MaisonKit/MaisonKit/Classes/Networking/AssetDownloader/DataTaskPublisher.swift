// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

protocol DataTaskPublisherProvider {
    func taskPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}

extension URLSession: DataTaskPublisherProvider {
    func taskPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        return self.dataTaskPublisher(for: url).eraseToAnyPublisher()
    }
}
