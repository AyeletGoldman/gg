/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.
///
/// Clienteling APIs
/// Clienteling APIs.
/// Version: v1

import Foundation

struct ISO8601DateTime: Codable, Equatable {
    let value: Date

    init(value: Date) {
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        guard let value = DateFormatter.iso8601Full.date(from: dateString) else {
            throw DecodingError.valueNotFound(Date.self,
                                              DecodingError.Context(codingPath: [],
                                                                    debugDescription: "Unable to create date from string"))
        }
        self.value = value
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let string = DateFormatter.iso8601Full.string(from: self.value)
        try container.encode(string)
    }
}
