/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Register device's token to the connected user.
/// @description Register device's Firebase token to the connected user.
/// * If the token already exists for the requesting user, updates its last_updated field.
/// * If the token already exists for a different user, deletes the token from his user and adds it to the requesting user.
struct RegisterToNotifications: TargetType {
    ///The body of a request that contains a firebase device token, in JSON format.
    let registerToNotificationsBody: RegisterToNotificationsBody?

    init(registerToNotificationsBody: RegisterToNotificationsBody?) {
        self.registerToNotificationsBody = registerToNotificationsBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/users/v1/users/notifications/registrations"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.registerToNotificationsBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("RegisterToNotifications").url
    }
}

extension RegisterToNotifications: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

