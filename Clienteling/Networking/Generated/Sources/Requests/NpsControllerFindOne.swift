/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get one NpsFeedback from its id.
/// @description Get one NpsFeedback from its id
struct NpsControllerFindOne: TargetType {
    ///NPS ID to retrieve
    let npsId: String

    init(npsId: String) {
        self.npsId = npsId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/nps/v1/nps/{npsId}"
        let formatter = PathFormatter()
        let npsIdSafe = formatter.format(value: self.npsId)
        path = path.replacingOccurrences(of: "{npsId}", with: npsIdSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("NpsControllerFindOne").url
    }
}

extension NpsControllerFindOne: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

