// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

final class ProductCuratorQueue {

    private let dispatchQueue = DispatchQueue(label: "CuratorOperationQueue", qos: .default)
    private let semaphore = DispatchSemaphore(value: 1)

    private var cancellables = Set<AnyCancellable>()

    static let shared = ProductCuratorQueue()

    init() { }

    func addOperation<In: Publisher>(_ publisher: In,
                                     receiveValue: @escaping (In.Output) -> Void) where In.Failure == Never {
        self.dispatchQueue.async {
            self.semaphore.wait()
            publisher.receive(on: DispatchQueue.main).sink { [weak self] output in
                receiveValue(output)
                self?.semaphore.signal()
            }.store(in: &self.cancellables)
        }
    }
}
