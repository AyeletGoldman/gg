/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Delete a client list by ID.
/// @description Delete a client list by ID.
struct ClientListsControllerDelete: TargetType {
    ///The list Id to use
    let listId: String

    init(listId: String) {
        self.listId = listId
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
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientListsControllerDelete").url
    }
}

extension ClientListsControllerDelete: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

