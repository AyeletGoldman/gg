/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Sort: Codable, Equatable {

    let availableSorts: [AvailableSort]
    let selectedSort: SelectedSort

    enum CodingKeys: String, CodingKey {
        case availableSorts = "availableSorts"
        case selectedSort = "selectedSort"
    }

    init(availableSorts: [AvailableSort], selectedSort: SelectedSort) {
        self.availableSorts = availableSorts
        self.selectedSort = selectedSort
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.availableSorts = try container.mkDecode([AvailableSort].self, forKey: .availableSorts)
        self.selectedSort = try container.mkDecode(SelectedSort.self, forKey: .selectedSort)
    }
}
