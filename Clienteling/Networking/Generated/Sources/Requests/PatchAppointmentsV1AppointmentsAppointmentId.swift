/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Edit an appointment
/// @description Edit an appointment
struct PatchAppointmentsV1AppointmentsAppointmentId: TargetType {
    ///Appointment id.
    let appointmentId: String
    let editAppointmentBody: EditAppointmentBody

    init(appointmentId: String, editAppointmentBody: EditAppointmentBody) {
        self.appointmentId = appointmentId
        self.editAppointmentBody = editAppointmentBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/appointments/v1/appointments/{appointmentId}"
        let formatter = PathFormatter()
        let appointmentIdSafe = formatter.format(value: self.appointmentId)
        path = path.replacingOccurrences(of: "{appointmentId}", with: appointmentIdSafe)
        return path
    }

    var method: Moya.Method {
        return .patch
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.editAppointmentBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Patch/appointments/v1/appointments/{appointmentId}").url
    }
}

extension PatchAppointmentsV1AppointmentsAppointmentId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

