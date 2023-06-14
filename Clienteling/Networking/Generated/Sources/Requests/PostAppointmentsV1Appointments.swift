/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create an appointment for the currently logged in user
/// @description Create an appointment for the currently logged in user
struct PostAppointmentsV1Appointments: TargetType {
    let createAppointmentBody: CreateAppointmentBody

    init(createAppointmentBody: CreateAppointmentBody) {
        self.createAppointmentBody = createAppointmentBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/appointments/v1/appointments"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.createAppointmentBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Post/appointments/v1/appointments").url
    }
}

extension PostAppointmentsV1Appointments: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

