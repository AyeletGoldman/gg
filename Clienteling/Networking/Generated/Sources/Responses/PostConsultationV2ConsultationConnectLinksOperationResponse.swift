/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum PostConsultationV2ConsultationConnectLinksResponses {
    case status201(DefaultSuccessResponse)
    case badRequestError(JSON)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
    case internalServerError(JSON)
}

extension Publisher where Output == PostConsultationV2ConsultationConnectLinksResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, DefaultSuccessResponse> {
        self.tryMap { response in
            switch response {
            case .status201(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
