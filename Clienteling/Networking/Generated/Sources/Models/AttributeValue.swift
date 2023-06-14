/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AttributeValue: Codable, Equatable {

    let items: [AttributeValueItem]
    let name: String
    /// Defines whether the attribute should be displayed in the stock details view or not.
    let shouldDisplayInStockView: Bool
    /// The translation key used to display the translated attribute name.
    let translationKey: String

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case name = "name"
        case shouldDisplayInStockView = "shouldDisplayInStockView"
        case translationKey = "translationKey"
    }

    init(items: [AttributeValueItem], name: String, shouldDisplayInStockView: Bool, translationKey: String) {
        self.items = items
        self.name = name
        self.shouldDisplayInStockView = shouldDisplayInStockView
        self.translationKey = translationKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.mkDecode([AttributeValueItem].self, forKey: .items)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.shouldDisplayInStockView = try container.mkDecode(Bool.self, forKey: .shouldDisplayInStockView)
        self.translationKey = try container.mkDecode(String.self, forKey: .translationKey)
    }
}
