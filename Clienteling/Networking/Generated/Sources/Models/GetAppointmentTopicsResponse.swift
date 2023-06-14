/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct GetAppointmentTopicsResponse: Codable, Equatable {

    /// An array of topics which includes topics of the same subject
    let topics: [TopicGroup]

    enum CodingKeys: String, CodingKey {
        case topics = "topics"
    }

    init(topics: [TopicGroup]) {
        self.topics = topics
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.topics = try container.mkDecode([TopicGroup].self, forKey: .topics)
    }
}
