/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NewsletterV1: Codable, Equatable {

    let clientId: String
    let clientName: String?
    let datetime: ISO8601DateTime
    let id: String
    let status: String
    let subtitle: String
    let title: String
    let type: String?

    enum CodingKeys: String, CodingKey {
        case clientId = "clientId"
        case clientName = "clientName"
        case datetime = "datetime"
        case id = "id"
        case status = "status"
        case subtitle = "subtitle"
        case title = "title"
        case type = "type"
    }

    init(clientId: String, clientName: String? = nil, datetime: ISO8601DateTime, id: String, status: String, subtitle: String, title: String, type: String? = nil) {
        self.clientId = clientId
        self.clientName = clientName
        self.datetime = datetime
        self.id = id
        self.status = status
        self.subtitle = subtitle
        self.title = title
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.clientName = try container.mkDecodeIfPresent(String.self, forKey: .clientName)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.status = try container.mkDecode(String.self, forKey: .status)
        self.subtitle = try container.mkDecode(String.self, forKey: .subtitle)
        self.title = try container.mkDecode(String.self, forKey: .title)
        self.type = try container.mkDecodeIfPresent(String.self, forKey: .type)
    }
}
