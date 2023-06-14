/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetAppointmentsV1AppointmentsResponses {
    case status200(GetAppointmentsResponseV1)
    case unauthorizedError(JSON)
    case internalServerError(JSON)
}

extension Publisher where Output == GetAppointmentsV1AppointmentsResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, GetAppointmentsResponseV1> {
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
