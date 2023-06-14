/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TransactionItemAttributesItem: Codable, Equatable {

    let displayName: String
    let displayValue: String

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case displayValue = "displayValue"
    }

    init(displayName: String, displayValue: String) {
        self.displayName = displayName
        self.displayValue = displayValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.displayName = try container.mkDecode(String.self, forKey: .displayName)
        self.displayValue = try container.mkDecode(String.self, forKey: .displayValue)
    }
}
