// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Moya
import MaisonKit

extension Publisher {
    func mapToResultViewModel<VM>(responseMap: @escaping (Output) throws -> VM) -> AnyPublisher<Result<VM, ErrorDisplayable>, Error> {
        self.eraseToAnyPublisher()
            .mapToResultViewModel(responseMap: responseMap)
    }

    func mapToViewModel<VM>(responseMap: @escaping (Output) throws -> VM) -> AnyPublisher<VM, ErrorDisplayable> {
        self.eraseToAnyPublisher()
            .mapToViewModel(responseMap: responseMap)
    }
}

extension AnyPublisher {

    func mapToResultViewModel<VM>(responseMap: @escaping (Output) throws -> VM) -> AnyPublisher<Result<VM, ErrorDisplayable>, Error> {
        #if DEBUG
        return self.mapToResultViewModel(responseMap: responseMap, debugErrorMapping: { error in
            Swift.print("\(#function):\(#line) error:")
            dump(error, indent: 2)
            return self.buildDebugError(error)
        })
        #else
        return self.mk_mapToResultViewModel(responseMap: responseMap)
        #endif
    }

    func mapToViewModel<T, VM>(responseMap: @escaping (T) throws -> VM) -> AnyPublisher<Result<VM, ErrorDisplayable>, Failure> where Output == Result<T, ErrorDisplayable> {
        #if DEBUG
        return self.mapToViewModel(responseMap: responseMap, debugErrorMapping: { error in
            Swift.print("\(#function):\(#line) error:")
            dump(error, indent: 2)
            return ErrorDisplayable(self.buildDebugError(error))
        })
        #else
        return self.mk_mapToViewModel(responseMap: responseMap)
        #endif
    }

    func mapToViewModel<VM>(responseMap: @escaping (Output) throws -> VM) -> AnyPublisher<VM, ErrorDisplayable> {
        #if DEBUG
        return self.mapToViewModel(responseMap: responseMap, debugErrorMapping: { error in
            Swift.print("\(#function):\(#line) error:")
            dump(error, indent: 2)
            return ErrorDisplayable(self.buildDebugError(error))
        })
        #else
        return self.mk_mapToViewModel(responseMap: responseMap)
        #endif
    }

    #if DEBUG
    private func buildDebugError(_ error: Error) -> Error {
        guard let moyaError = error as? MoyaError else { return error }
        var userInfo = moyaError.errorUserInfo
        userInfo[NSLocalizedDescriptionKey] = self.buildDebugErrorDescription(from: moyaError)
        return NSError(domain: "com.lvmh.debug", code: moyaError.errorCode, userInfo: userInfo)
    }

    private func buildDebugErrorDescription(from error: MoyaError) -> String {
        var description = error.localizedDescription
        guard let response = error.response else { return description }
        description += "\nStatus code: \(response.statusCode)"
        if let body = String(data: response.data, encoding: .utf8) {
            description += "\nBody: \(body)"
        }
        description += "\nDebug Description: \(response.debugDescription)"
        return description
    }
    #endif
}
