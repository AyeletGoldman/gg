/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Notifications: Codable, Equatable {

    let notifications: [Notification]

    enum CodingKeys: String, CodingKey {
        case notifications = "notifications"
    }

    init(notifications: [Notification]) {
        self.notifications = notifications
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.notifications = try container.mkDecode([Notification].self, forKey: .notifications)
    }
}
