/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateConnectLinkBody: Codable, Equatable {

    let endTime: ISO8601DateTimeString?
    /// Related id to create a link for. Can be either an interaction id, an appointment id, etc...
    let externalId: String
    let startTime: ISO8601DateTimeString?
    /// Meeting title
    let title: String?

    enum CodingKeys: String, CodingKey {
        case endTime = "endTime"
        case externalId = "externalId"
        case startTime = "startTime"
        case title = "title"
    }

    init(endTime: ISO8601DateTimeString? = nil, externalId: String, startTime: ISO8601DateTimeString? = nil, title: String? = nil) {
        self.endTime = endTime
        self.externalId = externalId
        self.startTime = startTime
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endTime = try container.mkDecodeIfPresent(ISO8601DateTimeString.self, forKey: .endTime)
        self.externalId = try container.mkDecode(String.self, forKey: .externalId)
        self.startTime = try container.mkDecodeIfPresent(ISO8601DateTimeString.self, forKey: .startTime)
        self.title = try container.mkDecodeIfPresent(String.self, forKey: .title)
    }
}
