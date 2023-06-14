/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct GetAppointmentTimeSlotsResponse: Codable, Equatable {

    /// An array of requested timeslot entries
    let timeslots: [TimeSlot]

    enum CodingKeys: String, CodingKey {
        case timeslots = "timeslots"
    }

    init(timeslots: [TimeSlot]) {
        self.timeslots = timeslots
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timeslots = try container.mkDecode([TimeSlot].self, forKey: .timeslots)
    }
}
