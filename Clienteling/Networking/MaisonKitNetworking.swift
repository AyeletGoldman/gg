// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Moya
import MaisonKit
import MaisonKitAuth
import LVMHMoyaPlugins

/// A convenience class to create all the networking classes and funnel all calls through
final class MaisonKitNetworking: ClientelingAPIsAPI {

    private static var tokenClosure: (AccessTokenAuthorizable) -> String {
        return { accessTokenAuthorizable in
            switch accessTokenAuthorizable.authorizationType {
            case .bearer:
                return MaisonKitAuth.retrieveCurrentAccessToken()?.token.value ?? ""
            default:
                return ""
            }
        }
    }

    private static var defaultPlugins: [PluginType] {
#if DEBUG
        return [
            LoggerPlugin()
            // Comment this out if you want to get CURL requests for debugging
            // NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .formatRequestAscURL))
        ]
#else
        return []
#endif
    }

    private let requestClosureBuilder: RequestClosureBuilder
    private let refresher: TokenRefreshing

    init(tokenRefresher: TokenRefreshing,
         endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
         stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
         callbackQueue: DispatchQueue? = nil,
         session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
         plugins: [PluginType] = [],
         trackInflights: Bool = false) {

        let requestClosureBuilder = RequestClosureBuilder(refresher: tokenRefresher)

        self.requestClosureBuilder = requestClosureBuilder
        self.refresher = tokenRefresher

        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosureBuilder.buildRequestClosure(),
                   stubClosure: stubClosure,
                   tokenClosure: Self.tokenClosure,
                   callbackQueue: callbackQueue,
                   session: session,
                   plugins: Self.defaultPlugins + plugins,
                   trackInflights: trackInflights)
    }

    override func buildRequest(for target: TargetType) -> AnyPublisher<Response, MoyaError> {
        return self.requestPublisher(MultiTarget(target))
            .flatMap { response -> AnyPublisher<Response, MoyaError> in
                guard response.statusCode == 401 else {
                    return Just(response).setFailureType(to: MoyaError.self).eraseToAnyPublisher()
                }
                return self.handleUnauthenticatedResponse(target: target)
            }
            .eraseToAnyPublisher()
            .filterSuccessfulStatusAndRedirectCodes()
    }

    /// Calls the auth token refresh closure and handles the result by retrying the request once and forwarding the result
    private func handleUnauthenticatedResponse(target: TargetType) -> AnyPublisher<Response, MoyaError> {
        return Future { [refresher] promise in
            refresher.refreshToken(done: promise)
        }.flatMap { [weak self] _ -> AnyPublisher<Response, Error> in
            guard let self = self else {
                return Fail<Response, Error>(error: MaisonKitError.notLoggedIn)
                    .eraseToAnyPublisher()
            }
            return self.requestPublisher(MultiTarget(target))
                .mapError { $0 }
                .eraseToAnyPublisher()
        }
        .mapError { error -> MoyaError in
            if let moyaError = error as? MoyaError {
                return moyaError
            }
            return MoyaError.underlying(error, nil)
        }.handleEvents(receiveCompletion: { complete in
            switch complete {
            case .failure(let error):
                self.handleError(error: error)
            case .finished:
                break
            }
        }).eraseToAnyPublisher()
    }

    private func handleError(error: MoyaError) {
        switch error {
        case .underlying(let underlying, _):
            if let authError = underlying as? AuthenticationError {
                switch authError {
                case .tokenRefreshFailed:
                    MaisonKit.logout()
                default:
                    break
                }
            }
        case .statusCode(let response):
            if response.statusCode == 401 {
                MaisonKit.logout()
            }
        default:
            break
        }
    }
}
