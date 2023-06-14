/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PatchNotificationBody: Codable, Equatable {

    let isRead: Bool

    enum CodingKeys: String, CodingKey {
        case isRead = "isRead"
    }

    init(isRead: Bool) {
        self.isRead = isRead
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isRead = try container.mkDecode(Bool.self, forKey: .isRead)
    }
}
