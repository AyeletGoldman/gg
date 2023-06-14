/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetAppointmentsV2AppointmentsResponses {
    case status200(GetAppointmentsResponseV2)
    case badRequestError(JSON)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
    case internalServerError(JSON)
}

extension Publisher where Output == GetAppointmentsV2AppointmentsResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, GetAppointmentsResponseV2> {
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
