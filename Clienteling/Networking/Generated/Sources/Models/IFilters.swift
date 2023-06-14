/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IFilters: Codable, Equatable {

    let availableFilters: [IAvailableFilters]
    let selectedFilters: [ISelectedFilters]

    enum CodingKeys: String, CodingKey {
        case availableFilters = "availableFilters"
        case selectedFilters = "selectedFilters"
    }

    init(availableFilters: [IAvailableFilters], selectedFilters: [ISelectedFilters]) {
        self.availableFilters = availableFilters
        self.selectedFilters = selectedFilters
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.availableFilters = try container.mkDecode([IAvailableFilters].self, forKey: .availableFilters)
        self.selectedFilters = try container.mkDecode([ISelectedFilters].self, forKey: .selectedFilters)
    }
}
