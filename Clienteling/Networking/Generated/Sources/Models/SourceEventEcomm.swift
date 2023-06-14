/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct SourceEventEcomm: Codable, Equatable {

    enum SourceEventEcommType: String, Codable, Equatable, CaseIterable {
        case postPayment = "postPayment"
        case postDelivery = "postDelivery"
    }

    /// The name of the e-commerce website
    let name: String
    let type: SourceEventEcommType

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
    }

    init(name: String, type: SourceEventEcommType) {
        self.name = name
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.type = try container.mkDecode(SourceEventEcommType.self, forKey: .type)
    }
}
