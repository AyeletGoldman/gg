/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create a client list.
/// @description Create a client list.
struct ClientListsControllerCreate: TargetType {
    let body: CreateClientList

    init(body: CreateClientList) {
        self.body = body
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/clientlists/v1/lists/clients"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.body, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientListsControllerCreate").url
    }
}

extension ClientListsControllerCreate: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

