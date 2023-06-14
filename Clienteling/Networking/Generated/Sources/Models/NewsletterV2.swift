/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NewsletterV2: Codable, Equatable {

    let datetime: ISO8601DateTime
    /// The ID for this newsletter in case more details are required
    let id: String
    let status: String
    let subject: String

    enum CodingKeys: String, CodingKey {
        case datetime = "datetime"
        case id = "id"
        case status = "status"
        case subject = "subject"
    }

    init(datetime: ISO8601DateTime, id: String, status: String, subject: String) {
        self.datetime = datetime
        self.id = id
        self.status = status
        self.subject = subject
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.status = try container.mkDecode(String.self, forKey: .status)
        self.subject = try container.mkDecode(String.self, forKey: .subject)
    }
}
