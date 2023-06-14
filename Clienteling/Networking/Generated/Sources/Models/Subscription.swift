/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Subscription: Codable, Equatable {

    /// Subscription creation date
    let createdDate: ISO8601DateTime
    /// Subscription ID
    let id: String
    /// Notification types subscribed by the user
    let notificationTypes: [String]
    /// Device token that will be used to send notifications
    let userDeviceToken: String
    /// User ID
    let userId: String

    enum CodingKeys: String, CodingKey {
        case createdDate = "createdDate"
        case id = "id"
        case notificationTypes = "notificationTypes"
        case userDeviceToken = "userDeviceToken"
        case userId = "userId"
    }

    init(createdDate: ISO8601DateTime, id: String, notificationTypes: [String], userDeviceToken: String, userId: String) {
        self.createdDate = createdDate
        self.id = id
        self.notificationTypes = notificationTypes
        self.userDeviceToken = userDeviceToken
        self.userId = userId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdDate = try container.mkDecode(ISO8601DateTime.self, forKey: .createdDate)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.notificationTypes = try container.mkDecode([String].self, forKey: .notificationTypes)
        self.userDeviceToken = try container.mkDecode(String.self, forKey: .userDeviceToken)
        self.userId = try container.mkDecode(String.self, forKey: .userId)
    }
}
