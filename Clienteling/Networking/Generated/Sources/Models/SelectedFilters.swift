/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct SelectedFilters: Codable, Equatable {

    enum SelectedFiltersOperator: String, Codable, Equatable, CaseIterable {
        case eq = "eq"
        case _in = "in"
    }

    let name: String
    let _operator: SelectedFiltersOperator
    let value: [SelectedFilterItem]

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case _operator = "operator"
        case value = "value"
    }

    init(name: String, _operator: SelectedFiltersOperator, value: [SelectedFilterItem]) {
        self.name = name
        self._operator = _operator
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self._operator = try container.mkDecode(SelectedFiltersOperator.self, forKey: ._operator)
        self.value = try container.mkDecode([SelectedFilterItem].self, forKey: .value)
    }
}
