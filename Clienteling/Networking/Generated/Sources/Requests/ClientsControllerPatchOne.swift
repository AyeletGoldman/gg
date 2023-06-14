/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary update a client by ID.
/// @description update a client by ID.
struct ClientsControllerPatchOne: TargetType {
    ///The client ID to get details of
    let clientId: String
    let body: CreateClientData

    init(clientId: String, body: CreateClientData) {
        self.clientId = clientId
        self.body = body
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/clients/v1/clients/{clientId}"
        let formatter = PathFormatter()
        let clientIdSafe = formatter.format(value: self.clientId)
        path = path.replacingOccurrences(of: "{clientId}", with: clientIdSafe)
        return path
    }

    var method: Moya.Method {
        return .patch
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.body, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientsControllerPatchOne").url
    }
}

extension ClientsControllerPatchOne: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

