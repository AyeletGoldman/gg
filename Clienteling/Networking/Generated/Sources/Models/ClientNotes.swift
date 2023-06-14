/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientNotes: Codable, Equatable {

    let notes: [ClientNote]

    enum CodingKeys: String, CodingKey {
        case notes = "notes"
    }

    init(notes: [ClientNote]) {
        self.notes = notes
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.notes = try container.mkDecode([ClientNote].self, forKey: .notes)
    }
}
