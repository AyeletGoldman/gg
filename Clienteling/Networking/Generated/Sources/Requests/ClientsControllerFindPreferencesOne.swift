/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get client's preferences.
/// @description Get client's preferences.
struct ClientsControllerFindPreferencesOne: TargetType {
    ///The client ID to get details of
    let clientId: String

    init(clientId: String) {
        self.clientId = clientId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/clients/v1/clients/{clientId}/preferences"
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
        return Server.selectedServerForOperationName("ClientsControllerFindPreferencesOne").url
    }
}

extension ClientsControllerFindPreferencesOne: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

