/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AssignAppointmentBody: Codable, Equatable {

    /// The advisor id to which the appointment should be assigned
    let advisorId: String?
    /// The territory id in which the appointment should take place
    let territoryId: String?

    enum CodingKeys: String, CodingKey {
        case advisorId = "advisorId"
        case territoryId = "territoryId"
    }

    init(advisorId: String? = nil, territoryId: String? = nil) {
        self.advisorId = advisorId
        self.territoryId = territoryId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorId = try container.mkDecodeIfPresent(String.self, forKey: .advisorId)
        self.territoryId = try container.mkDecodeIfPresent(String.self, forKey: .territoryId)
    }
}
