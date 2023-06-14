/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A constraint placed on a filter. Constraints can either be "in" (an array) or "equals" (to a value).

struct ProductFilterRequestConstraint: Codable, Equatable {

    /// A constraint placed on a filter. Constraints can either be "in" (an array) or "equals" (to a value).
    enum ProductFilterRequestConstraintOperator: String, Codable, Equatable, CaseIterable {
        case _in = "in"
        case eq = "eq"
    }

    let _operator: ProductFilterRequestConstraintOperator
    let value: [String]

    enum CodingKeys: String, CodingKey {
        case _operator = "operator"
        case value = "value"
    }

    init(_operator: ProductFilterRequestConstraintOperator, value: [String]) {
        self._operator = _operator
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._operator = try container.mkDecode(ProductFilterRequestConstraintOperator.self, forKey: ._operator)
        self.value = try container.mkDecode([String].self, forKey: .value)
    }
}
