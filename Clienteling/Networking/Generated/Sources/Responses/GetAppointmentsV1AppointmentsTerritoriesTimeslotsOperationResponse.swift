/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetAppointmentsV1AppointmentsTerritoriesTimeslotsResponses {
    case status200(GetAppointmentTimeSlotsResponse)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
    case internalServerError(JSON)
}

extension Publisher where Output == GetAppointmentsV1AppointmentsTerritoriesTimeslotsResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, GetAppointmentTimeSlotsResponse> {
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
