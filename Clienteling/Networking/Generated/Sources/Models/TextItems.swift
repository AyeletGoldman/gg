/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TextItems: Codable, Equatable {

    enum TextItemsDisplay: String, Codable, Equatable, CaseIterable {
        case text = "text"
    }

    let display: TextItemsDisplay
    let list: [TextItem]

    enum CodingKeys: String, CodingKey {
        case display = "display"
        case list = "list"
    }

    init(display: TextItemsDisplay, list: [TextItem]) {
        self.display = display
        self.list = list
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.display = try container.mkDecode(TextItemsDisplay.self, forKey: .display)
        self.list = try container.mkDecode([TextItem].self, forKey: .list)
    }
}
