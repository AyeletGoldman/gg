/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Unregister agent's token(s) when the user logs out of the app.
/// @description Unregister agent's tokens when the user logs out of the app (Sightcall).
struct DeleteConsultationV1ConsultationVideoToken: TargetType {

    init() {
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/consultation/v1/consultation/video/token"
    }

    var method: Moya.Method {
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Delete/consultation/v1/consultation/video/token").url
    }
}

extension DeleteConsultationV1ConsultationVideoToken: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

