/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionMetadataPblContext: Codable, Equatable {

    let pblTransactionID: String

    enum CodingKeys: String, CodingKey {
        case pblTransactionID = "pblTransactionID"
    }

    init(pblTransactionID: String) {
        self.pblTransactionID = pblTransactionID
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pblTransactionID = try container.mkDecode(String.self, forKey: .pblTransactionID)
    }
}
