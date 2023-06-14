/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ColorAttributeHexCode: Codable, Equatable {

    enum ColorAttributeHexCodeType: String, Codable, Equatable, CaseIterable {
        case hexCode = "hexCode"
    }

    let hexCode: String
    let type: ColorAttributeHexCodeType

    enum CodingKeys: String, CodingKey {
        case hexCode = "hexCode"
        case type = "type"
    }

    init(hexCode: String, type: ColorAttributeHexCodeType) {
        self.hexCode = hexCode
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hexCode = try container.mkDecode(String.self, forKey: .hexCode)
        self.type = try container.mkDecode(ColorAttributeHexCodeType.self, forKey: .type)
    }
}
