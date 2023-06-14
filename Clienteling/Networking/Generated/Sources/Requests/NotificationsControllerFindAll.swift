/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get the list of all notifications.
/// @description Get the list of all notifications.
struct NotificationsControllerFindAll: TargetType {
    ///Filter to restrict to read/unread notifications
    let read: Bool?
    ///Filter to restrict to notifications created after given datetime.
    let createdAfter: ISO8601DateTime?
    ///Filter to restrict to notifications created before given datetime.
    let createdBefore: ISO8601DateTime?

    init(read: Bool?, createdAfter: ISO8601DateTime?, createdBefore: ISO8601DateTime?) {
        self.read = read
        self.createdAfter = createdAfter
        self.createdBefore = createdBefore
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/notifications/v1/notifications"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.read,
                            forKey: "read",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.createdAfter,
                            forKey: "createdAfter",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.createdBefore,
                            forKey: "createdBefore",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("NotificationsControllerFindAll").url
    }
}

extension NotificationsControllerFindAll: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

