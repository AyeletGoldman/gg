/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientKPI: Codable, Equatable {

    let kpis: [KPIItem]

    enum CodingKeys: String, CodingKey {
        case kpis = "kpis"
    }

    init(kpis: [KPIItem]) {
        self.kpis = kpis
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kpis = try container.mkDecode([KPIItem].self, forKey: .kpis)
    }
}
