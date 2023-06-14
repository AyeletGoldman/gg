/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Delete client list member by member ID.
/// @description Delete client list member by member ID.
struct ClientListsMembersControllerDelete: TargetType {
    ///The member ID to delete from the client list
    let memberId: String

    init(memberId: String) {
        self.memberId = memberId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/clientlists/v1/lists/clients/members/{memberId}"
        let formatter = PathFormatter()
        let memberIdSafe = formatter.format(value: self.memberId)
        path = path.replacingOccurrences(of: "{memberId}", with: memberIdSafe)
        return path
    }

    var method: Moya.Method {
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientListsMembersControllerDelete").url
    }
}

extension ClientListsMembersControllerDelete: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

