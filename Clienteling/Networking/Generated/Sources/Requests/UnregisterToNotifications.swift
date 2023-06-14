/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Unregister a token from the connected user.
/// @description Unregister a Firebase token from the connected user.
struct UnregisterToNotifications: TargetType {
    ///Firebase device token
    let token: Token

    init(token: Token) {
        self.token = token
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/users/v1/users/notifications/registrations/{token}"
        let formatter = PathFormatter()
        let tokenSafe = formatter.format(value: self.token)
        path = path.replacingOccurrences(of: "{token}", with: tokenSafe)
        return path
    }

    var method: Moya.Method {
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("UnregisterToNotifications").url
    }
}

extension UnregisterToNotifications: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

