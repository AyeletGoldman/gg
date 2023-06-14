/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientHeader: Codable, Equatable {

    let advisorId: String?
    let basicInfo: [TypedValue]?
    let clientId: String
    /// In some localities (like Japan), client can have a local first name
    let clientLocalFirstName: String?
    /// In some localities (like Japan), client can have a local last name
    let clientLocalLastName: String?
    let clientName: String
    let clientNumber: String?
    let labels: [ClientLabel]?
    let storeId: String?

    enum CodingKeys: String, CodingKey {
        case advisorId = "advisorId"
        case basicInfo = "basicInfo"
        case clientId = "clientId"
        case clientLocalFirstName = "clientLocalFirstName"
        case clientLocalLastName = "clientLocalLastName"
        case clientName = "clientName"
        case clientNumber = "clientNumber"
        case labels = "labels"
        case storeId = "storeId"
    }

    init(advisorId: String? = nil, basicInfo: [TypedValue]? = nil, clientId: String, clientLocalFirstName: String? = nil, clientLocalLastName: String? = nil, clientName: String, clientNumber: String? = nil, labels: [ClientLabel]? = nil, storeId: String? = nil) {
        self.advisorId = advisorId
        self.basicInfo = basicInfo
        self.clientId = clientId
        self.clientLocalFirstName = clientLocalFirstName
        self.clientLocalLastName = clientLocalLastName
        self.clientName = clientName
        self.clientNumber = clientNumber
        self.labels = labels
        self.storeId = storeId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorId = try container.mkDecodeIfPresent(String.self, forKey: .advisorId)
        self.basicInfo = try container.mkDecodeIfPresent([TypedValue].self, forKey: .basicInfo)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.clientLocalFirstName = try container.mkDecodeIfPresent(String.self, forKey: .clientLocalFirstName)
        self.clientLocalLastName = try container.mkDecodeIfPresent(String.self, forKey: .clientLocalLastName)
        self.clientName = try container.mkDecode(String.self, forKey: .clientName)
        self.clientNumber = try container.mkDecodeIfPresent(String.self, forKey: .clientNumber)
        self.labels = try container.mkDecodeIfPresent([ClientLabel].self, forKey: .labels)
        self.storeId = try container.mkDecodeIfPresent(String.self, forKey: .storeId)
    }
}
