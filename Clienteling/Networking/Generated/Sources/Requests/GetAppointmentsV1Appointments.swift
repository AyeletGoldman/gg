/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get appointments for the current logged in user
/// @description Get appointments for the current logged in user
struct GetAppointmentsV1Appointments: TargetType {

    init() {
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/appointments/v1/appointments"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/appointments/v1/appointments").url
    }
}

extension GetAppointmentsV1Appointments: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

