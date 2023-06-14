/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Sorts: Codable, Equatable {

    let availableSorts: [AvailableSort]
    let selectedSortKey: String

    enum CodingKeys: String, CodingKey {
        case availableSorts = "availableSorts"
        case selectedSortKey = "selectedSortKey"
    }

    init(availableSorts: [AvailableSort], selectedSortKey: String) {
        self.availableSorts = availableSorts
        self.selectedSortKey = selectedSortKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.availableSorts = try container.mkDecode([AvailableSort].self, forKey: .availableSorts)
        self.selectedSortKey = try container.mkDecode(String.self, forKey: .selectedSortKey)
    }
}
