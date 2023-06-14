/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CardItems: Codable, Equatable {

    enum CardItemsDisplay: String, Codable, Equatable, CaseIterable {
        case card = "card"
    }

    let display: CardItemsDisplay
    let list: [CardItem]

    enum CodingKeys: String, CodingKey {
        case display = "display"
        case list = "list"
    }

    init(display: CardItemsDisplay, list: [CardItem]) {
        self.display = display
        self.list = list
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.display = try container.mkDecode(CardItemsDisplay.self, forKey: .display)
        self.list = try container.mkDecode([CardItem].self, forKey: .list)
    }
}
