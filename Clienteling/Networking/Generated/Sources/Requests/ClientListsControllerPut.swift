/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Update a client list.
/// @description Update a client list. `memberIds` property can only *add* member Ids to an existing list, but can not remove them.
/// 
/// In a scenario where no `memberIds` were provided in request's body, the existing `memberIds` will not change.
/// If `memberIds` were provided in request's body, these memberIds will be added in addition to the existing memberIds list.
/// 
/// `memberIds` and `criteria` are incompatible with each other. Only one of them can exist in a request.
/// 
/// ***-criteria*** attribute is currently not being used or have any implementation.
struct ClientListsControllerPut: TargetType {
    ///The list Id to use
    let listId: String
    let body: CreateClientList

    init(listId: String, body: CreateClientList) {
        self.listId = listId
        self.body = body
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/clientlists/v1/lists/clients/{listId}"
        let formatter = PathFormatter()
        let listIdSafe = formatter.format(value: self.listId)
        path = path.replacingOccurrences(of: "{listId}", with: listIdSafe)
        return path
    }

    var method: Moya.Method {
        return .put
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.body, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientListsControllerPut").url
    }
}

extension ClientListsControllerPut: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

