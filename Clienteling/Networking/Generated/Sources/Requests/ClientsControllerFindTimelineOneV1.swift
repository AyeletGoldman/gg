/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get client's timeline V1.
/// @description Returns Client360 page timeline section data, such as - interactions, transactions, outreaches
struct ClientsControllerFindTimelineOneV1: TargetType {
    ///The client ID to get data of
    let clientId: String

    init(clientId: String) {
        self.clientId = clientId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/client360/v1/clients/{clientId}/timeline"
        let formatter = PathFormatter()
        let clientIdSafe = formatter.format(value: self.clientId)
        path = path.replacingOccurrences(of: "{clientId}", with: clientIdSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientsControllerFindTimelineOneV1").url
    }
}

extension ClientsControllerFindTimelineOneV1: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

