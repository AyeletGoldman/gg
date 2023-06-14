/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PatchSubscriptionBody: Codable, Equatable {

    /// Notification types that will be subscribed to
    let notificationTypes: [String]?
    /// Device token that will be used to send notifications
    let userDeviceToken: String?

    enum CodingKeys: String, CodingKey {
        case notificationTypes = "notificationTypes"
        case userDeviceToken = "userDeviceToken"
    }

    init(notificationTypes: [String]? = nil, userDeviceToken: String? = nil) {
        self.notificationTypes = notificationTypes
        self.userDeviceToken = userDeviceToken
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.notificationTypes = try container.mkDecodeIfPresent([String].self, forKey: .notificationTypes)
        self.userDeviceToken = try container.mkDecodeIfPresent(String.self, forKey: .userDeviceToken)
    }
}
