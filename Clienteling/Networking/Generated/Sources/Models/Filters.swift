/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Filters: Codable, Equatable {

    let availableFilters: [AvailableFilters]
    let selectedFilters: [SelectedFilters]

    enum CodingKeys: String, CodingKey {
        case availableFilters = "availableFilters"
        case selectedFilters = "selectedFilters"
    }

    init(availableFilters: [AvailableFilters], selectedFilters: [SelectedFilters]) {
        self.availableFilters = availableFilters
        self.selectedFilters = selectedFilters
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.availableFilters = try container.mkDecode([AvailableFilters].self, forKey: .availableFilters)
        self.selectedFilters = try container.mkDecode([SelectedFilters].self, forKey: .selectedFilters)
    }
}
