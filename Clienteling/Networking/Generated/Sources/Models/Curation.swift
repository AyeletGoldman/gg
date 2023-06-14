/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Curation: Codable, Equatable {

    let id: String
    let items: [ProductCurationItem]
    let name: String
    /// Id of the oldest ancestor curation from which this curation is derived.
    let originalId: String?
    let ownerName: String
    /// Id of a curation which has been duplicated to this one.
    let parentId: String?
    /// True if no further modification are possible on this curation.
    let readOnly: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case items = "items"
        case name = "name"
        case originalId = "originalId"
        case ownerName = "ownerName"
        case parentId = "parentId"
        case readOnly = "readOnly"
    }

    init(id: String, items: [ProductCurationItem], name: String, originalId: String? = nil, ownerName: String, parentId: String? = nil, readOnly: Bool) {
        self.id = id
        self.items = items
        self.name = name
        self.originalId = originalId
        self.ownerName = ownerName
        self.parentId = parentId
        self.readOnly = readOnly
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.items = try container.mkDecode([ProductCurationItem].self, forKey: .items)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.originalId = try container.mkDecodeIfPresent(String.self, forKey: .originalId)
        self.ownerName = try container.mkDecode(String.self, forKey: .ownerName)
        self.parentId = try container.mkDecodeIfPresent(String.self, forKey: .parentId)
        self.readOnly = try container.mkDecode(Bool.self, forKey: .readOnly)
    }
}
