/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientTimelineActionsContent: Codable, Equatable {

    enum ClientTimelineActionsContentType: String, Codable, Equatable, CaseIterable {
        case visit = "visit"
        case booking = "booking"
        case preOrder = "preOrder"
        case alterationsTailoring = "alterationsTailoring"
        case afterSales = "afterSales"
        case gift = "gift"
        case instorePickup = "instorePickup"
        case delivery = "delivery"
    }

    let translationKey: String
    let type: ClientTimelineActionsContentType

    enum CodingKeys: String, CodingKey {
        case translationKey = "translationKey"
        case type = "type"
    }

    init(translationKey: String, type: ClientTimelineActionsContentType) {
        self.translationKey = translationKey
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.translationKey = try container.mkDecode(String.self, forKey: .translationKey)
        self.type = try container.mkDecode(ClientTimelineActionsContentType.self, forKey: .type)
    }
}
