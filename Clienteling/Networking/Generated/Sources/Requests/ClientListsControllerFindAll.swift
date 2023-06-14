/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get all client lists.
/// @description Get all client lists.
struct ClientListsControllerFindAll: TargetType {

    init() {
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/clientlists/v1/lists/clients"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientListsControllerFindAll").url
    }
}

extension ClientListsControllerFindAll: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

