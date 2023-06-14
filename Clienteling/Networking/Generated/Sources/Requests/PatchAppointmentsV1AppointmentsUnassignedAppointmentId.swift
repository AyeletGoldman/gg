/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Update an appointment with a CA id or a Store id
/// @description Update an appointment with a CA id or a Store id
struct PatchAppointmentsV1AppointmentsUnassignedAppointmentId: TargetType {
    ///Appointment id.
    let appointmentId: String
    let assignAppointmentBody: AssignAppointmentBody

    init(appointmentId: String, assignAppointmentBody: AssignAppointmentBody) {
        self.appointmentId = appointmentId
        self.assignAppointmentBody = assignAppointmentBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/appointments/v1/appointments/unassigned/{appointmentId}"
        let formatter = PathFormatter()
        let appointmentIdSafe = formatter.format(value: self.appointmentId)
        path = path.replacingOccurrences(of: "{appointmentId}", with: appointmentIdSafe)
        return path
    }

    var method: Moya.Method {
        return .patch
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.assignAppointmentBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Patch/appointments/v1/appointments/unassigned/{appointmentId}").url
    }
}

extension PatchAppointmentsV1AppointmentsUnassignedAppointmentId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

