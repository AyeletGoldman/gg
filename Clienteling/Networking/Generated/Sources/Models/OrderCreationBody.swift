/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct OrderCreationBody: Codable, Equatable {

    /// TODO

    struct OrderCreationBodyItems: Codable, Equatable {

        let quantity: Int
        let sku: String

        enum CodingKeys: String, CodingKey {
            case quantity = "quantity"
            case sku = "sku"
        }

        init(quantity: Int, sku: String) {
            self.quantity = quantity
            self.sku = sku
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.quantity = try container.mkDecode(Int.self, forKey: .quantity)
            self.sku = try container.mkDecode(String.self, forKey: .sku)
        }
    }

    /// TODO
    let clientId: String
    let deliveryType: DeliveryType
    /// TODO
    let items: [OrderCreationBodyItems]

    enum CodingKeys: String, CodingKey {
        case clientId = "clientId"
        case deliveryType = "deliveryType"
        case items = "items"
    }

    init(clientId: String, deliveryType: DeliveryType, items: [OrderCreationBodyItems]) {
        self.clientId = clientId
        self.deliveryType = deliveryType
        self.items = items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.deliveryType = try container.mkDecode(DeliveryType.self, forKey: .deliveryType)
        self.items = try container.mkDecode([OrderCreationBodyItems].self, forKey: .items)
    }
}
