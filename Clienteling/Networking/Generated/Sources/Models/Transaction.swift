/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Transaction: Codable, Equatable {

    let advisorName: String?
    let clientId: String
    let clientName: String?
    let datetime: ISO8601DateTime
    let id: String
    let itemCount: Int
    let items: [TransactionItem]?
    let price: TypedValue?
    let storeName: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case advisorName = "advisorName"
        case clientId = "clientId"
        case clientName = "clientName"
        case datetime = "datetime"
        case id = "id"
        case itemCount = "itemCount"
        case items = "items"
        case price = "price"
        case storeName = "storeName"
        case title = "title"
    }

    init(advisorName: String? = nil, clientId: String, clientName: String? = nil, datetime: ISO8601DateTime, id: String, itemCount: Int, items: [TransactionItem]? = nil, price: TypedValue? = nil, storeName: String, title: String) {
        self.advisorName = advisorName
        self.clientId = clientId
        self.clientName = clientName
        self.datetime = datetime
        self.id = id
        self.itemCount = itemCount
        self.items = items
        self.price = price
        self.storeName = storeName
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorName = try container.mkDecodeIfPresent(String.self, forKey: .advisorName)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.clientName = try container.mkDecodeIfPresent(String.self, forKey: .clientName)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.itemCount = try container.mkDecode(Int.self, forKey: .itemCount)
        self.items = try container.mkDecodeIfPresent([TransactionItem].self, forKey: .items)
        self.price = try container.mkDecodeIfPresent(TypedValue.self, forKey: .price)
        self.storeName = try container.mkDecode(String.self, forKey: .storeName)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
