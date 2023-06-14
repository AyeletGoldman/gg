// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKitAuth
import Moya

final class RequestClosureBuilder {

    private var cancellables = Set<AnyCancellable>()
    private let refresher: TokenRefreshing

    init(refresher: TokenRefreshing) {
        self.refresher = refresher
    }

    func buildRequestClosure() -> MoyaProvider<MultiTarget>.RequestClosure {
        return { [weak self] (endpoint: Endpoint, done: @escaping MoyaProvider.RequestResultClosure) in
            do {
                let urlRequest = try endpoint.urlRequest()

                guard let self = self else { return done(.success(urlRequest)) }

                self.refresher.authTokenObservable().sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        done(.failure(MoyaError.underlying(error, nil)))
                    case .finished: break
                    }
                }, receiveValue: { _ in
                    done(.success(urlRequest))
                }).store(in: &self.cancellables)
            } catch MoyaError.requestMapping(let url) {
                done(.failure(MoyaError.requestMapping(url)))
            } catch MoyaError.parameterEncoding(let error) {
                done(.failure(MoyaError.parameterEncoding(error)))
            } catch {
                done(.failure(MoyaError.underlying(error, nil)))
            }
        }
    }
}
