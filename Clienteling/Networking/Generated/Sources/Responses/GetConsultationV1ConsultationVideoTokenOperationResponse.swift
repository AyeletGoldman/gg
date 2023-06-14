/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetConsultationV1ConsultationVideoTokenResponses {
    case status200(RegistrationTokenResponse)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
    case unprocessableEntity(JSON)
}

extension Publisher where Output == GetConsultationV1ConsultationVideoTokenResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, RegistrationTokenResponse> {
        self.tryMap { response in
            switch response {
            case .status200(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
