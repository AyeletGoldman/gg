/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct GetAppointmentTerritoriesResponse: Codable, Equatable {

    /// An array of requested territories details
    let territories: [Territory]

    enum CodingKeys: String, CodingKey {
        case territories = "territories"
    }

    init(territories: [Territory]) {
        self.territories = territories
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.territories = try container.mkDecode([Territory].self, forKey: .territories)
    }
}
