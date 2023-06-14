/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Asset: Codable, Equatable {

    enum AssetSource: String, Codable, Equatable, CaseIterable {
        case catalog = "catalog"
        case personal = "personal"
    }

    let contentType: String
    /// Unique asset id within the curations
    let id: String
    let isSelected: Bool
    let source: AssetSource
    let url: URL

    enum CodingKeys: String, CodingKey {
        case contentType = "contentType"
        case id = "id"
        case isSelected = "isSelected"
        case source = "source"
        case url = "url"
    }

    init(contentType: String, id: String, isSelected: Bool, source: AssetSource, url: URL) {
        self.contentType = contentType
        self.id = id
        self.isSelected = isSelected
        self.source = source
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.mkDecode(String.self, forKey: .contentType)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.isSelected = try container.mkDecode(Bool.self, forKey: .isSelected)
        self.source = try container.mkDecode(AssetSource.self, forKey: .source)
        self.url = try container.mkDecode(URL.self, forKey: .url)
    }
}
