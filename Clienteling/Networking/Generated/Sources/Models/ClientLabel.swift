/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientLabel: Codable, Equatable {

    enum ClientLabelType: String, Codable, Equatable, CaseIterable {
        case primary = "primary"
        case secondary = "secondary"
        case tertiary = "tertiary"
    }

    let type: ClientLabelType
    let value: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }

    init(type: ClientLabelType, value: String) {
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.mkDecode(ClientLabelType.self, forKey: .type)
        self.value = try container.mkDecode(String.self, forKey: .value)
    }
}
