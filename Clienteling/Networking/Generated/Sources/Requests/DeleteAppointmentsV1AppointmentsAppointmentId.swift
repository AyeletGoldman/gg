/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Delete an appointment
/// @description Delete an appointment
struct DeleteAppointmentsV1AppointmentsAppointmentId: TargetType {
    ///Appointment id.
    let appointmentId: String

    init(appointmentId: String) {
        self.appointmentId = appointmentId
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
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Delete/appointments/v1/appointments/{appointmentId}").url
    }
}

extension DeleteAppointmentsV1AppointmentsAppointmentId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

