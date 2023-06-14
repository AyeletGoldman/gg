/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AppointmentConsultation: Codable, Equatable {

    /// Indicates at what time the users can connect to the consultation link
    let activeTime: ISO8601DateTimeString
    /// Consultation id
    let id: String
    /// URL of the consultation
    let url: URL

    enum CodingKeys: String, CodingKey {
        case activeTime = "activeTime"
        case id = "id"
        case url = "url"
    }

    init(activeTime: ISO8601DateTimeString, id: String, url: URL) {
        self.activeTime = activeTime
        self.id = id
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activeTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .activeTime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.url = try container.mkDecode(URL.self, forKey: .url)
    }
}
