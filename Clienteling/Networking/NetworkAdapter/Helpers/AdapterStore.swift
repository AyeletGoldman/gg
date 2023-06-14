// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Moya

final class AdapterStore<StoredType> {

    private var cancellables = Set<AnyCancellable>()

    let storedValue = PassthroughSubject<Result<StoredType, Error>, Never>()

    func update<P: Publisher>(from publisher: P) where P.Output == StoredType, P.Failure == MoyaError {
        publisher.sink { [weak self] completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self?.storedValue.send(.failure(error))
            }
        } receiveValue: { [weak self] value in
            self?.storedValue.send(.success(value))
        }.store(in: &self.cancellables)
    }
}

extension Publisher {
    func onFinished(_ perform: @escaping () -> Void) -> Publishers.HandleEvents<Self> {
        return self.handleEvents(receiveCompletion: { completion in
            switch completion {
            case .finished:
                perform()
            case .failure:
                break
            }
        })
    }
}
