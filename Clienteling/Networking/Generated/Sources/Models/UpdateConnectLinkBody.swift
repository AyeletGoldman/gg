/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct UpdateConnectLinkBody: Codable, Equatable {

    let endTime: ISO8601DateTimeString
    let startTime: ISO8601DateTimeString
    /// Meeting title
    let title: String?

    enum CodingKeys: String, CodingKey {
        case endTime = "endTime"
        case startTime = "startTime"
        case title = "title"
    }

    init(endTime: ISO8601DateTimeString, startTime: ISO8601DateTimeString, title: String? = nil) {
        self.endTime = endTime
        self.startTime = startTime
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.title = try container.mkDecodeIfPresent(String.self, forKey: .title)
    }
}
