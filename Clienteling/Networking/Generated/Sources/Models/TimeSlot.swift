/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TimeSlot: Codable, Equatable {

    let endTime: ISO8601DateTimeString
    let startTime: ISO8601DateTimeString

    enum CodingKeys: String, CodingKey {
        case endTime = "endTime"
        case startTime = "startTime"
    }

    init(endTime: ISO8601DateTimeString, startTime: ISO8601DateTimeString) {
        self.endTime = endTime
        self.startTime = startTime
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
    }
}
