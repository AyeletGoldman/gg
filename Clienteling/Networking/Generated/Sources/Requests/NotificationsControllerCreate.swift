/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create a notification.
/// @description Create a notification.
struct NotificationsControllerCreate: TargetType {
    let createNotificationBody: CreateNotificationBody

    init(createNotificationBody: CreateNotificationBody) {
        self.createNotificationBody = createNotificationBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/notifications/v1/notifications"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.createNotificationBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("NotificationsControllerCreate").url
    }
}

extension NotificationsControllerCreate: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

