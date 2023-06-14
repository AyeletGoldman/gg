/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Update some notification fields.
/// @description Update some notification fields.
struct NotificationsControllerPatch: TargetType {
    ///Notification ID to work on
    let notificationId: String
    let patchNotificationBody: PatchNotificationBody

    init(notificationId: String, patchNotificationBody: PatchNotificationBody) {
        self.notificationId = notificationId
        self.patchNotificationBody = patchNotificationBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/notifications/v1/notifications/{notificationId}"
        let formatter = PathFormatter()
        let notificationIdSafe = formatter.format(value: self.notificationId)
        path = path.replacingOccurrences(of: "{notificationId}", with: notificationIdSafe)
        return path
    }

    var method: Moya.Method {
        return .patch
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.patchNotificationBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("NotificationsControllerPatch").url
    }
}

extension NotificationsControllerPatch: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

