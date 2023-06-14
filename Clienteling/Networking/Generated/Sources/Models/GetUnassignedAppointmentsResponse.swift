/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct GetUnassignedAppointmentsResponse: Codable, Equatable {

    let appointments: [UnassignedAppointment]

    enum CodingKeys: String, CodingKey {
        case appointments = "appointments"
    }

    init(appointments: [UnassignedAppointment]) {
        self.appointments = appointments
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appointments = try container.mkDecode([UnassignedAppointment].self, forKey: .appointments)
    }
}
