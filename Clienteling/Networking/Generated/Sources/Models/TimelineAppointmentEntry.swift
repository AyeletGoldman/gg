/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TimelineAppointmentEntry: Codable, Equatable {

    enum TimelineAppointmentEntryType: String, Codable, Equatable, CaseIterable {
        case appointment = "appointment"
    }

    let advisor: Advisor
    let channel: ChannelKey
    let endTime: ISO8601DateTimeString
    /// The ID for the appointment. Use this to get the appointment details.
    let id: String
    let startTime: ISO8601DateTimeString
    let territory: AppointmentTerritory
    let type: TimelineAppointmentEntryType

    enum CodingKeys: String, CodingKey {
        case advisor = "advisor"
        case channel = "channel"
        case endTime = "endTime"
        case id = "id"
        case startTime = "startTime"
        case territory = "territory"
        case type = "type"
    }

    init(advisor: Advisor, channel: ChannelKey, endTime: ISO8601DateTimeString, id: String, startTime: ISO8601DateTimeString, territory: AppointmentTerritory, type: TimelineAppointmentEntryType) {
        self.advisor = advisor
        self.channel = channel
        self.endTime = endTime
        self.id = id
        self.startTime = startTime
        self.territory = territory
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisor = try container.mkDecode(Advisor.self, forKey: .advisor)
        self.channel = try container.mkDecode(ChannelKey.self, forKey: .channel)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.territory = try container.mkDecode(AppointmentTerritory.self, forKey: .territory)
        self.type = try container.mkDecode(TimelineAppointmentEntryType.self, forKey: .type)
    }
}
