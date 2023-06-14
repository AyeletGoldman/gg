/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientDetails: Codable, Equatable {

    let clientDetails: [ClientDetailsContent]

    enum CodingKeys: String, CodingKey {
        case clientDetails = "clientDetails"
    }

    init(clientDetails: [ClientDetailsContent]) {
        self.clientDetails = clientDetails
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientDetails = try container.mkDecode([ClientDetailsContent].self, forKey: .clientDetails)
    }
}
