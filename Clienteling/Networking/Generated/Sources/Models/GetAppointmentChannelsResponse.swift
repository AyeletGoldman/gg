/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct GetAppointmentChannelsResponse: Codable, Equatable {

    /// An array of available channels (communication means) for creating an appointment
    let channels: [Channel]

    enum CodingKeys: String, CodingKey {
        case channels = "channels"
    }

    init(channels: [Channel]) {
        self.channels = channels
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channels = try container.mkDecode([Channel].self, forKey: .channels)
    }
}
