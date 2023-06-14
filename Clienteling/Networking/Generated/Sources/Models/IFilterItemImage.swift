/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IFilterItemImage: Codable, Equatable {

    let displayName: String
    let imageURL: URL
    let value: String

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case imageURL = "imageURL"
        case value = "value"
    }

    init(displayName: String, imageURL: URL, value: String) {
        self.displayName = displayName
        self.imageURL = imageURL
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.displayName = try container.mkDecode(String.self, forKey: .displayName)
        self.imageURL = try container.mkDecode(URL.self, forKey: .imageURL)
        self.value = try container.mkDecode(String.self, forKey: .value)
    }
}
