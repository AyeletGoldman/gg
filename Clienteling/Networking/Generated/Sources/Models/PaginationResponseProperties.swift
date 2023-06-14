/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PaginationResponseProperties: Codable, Equatable {

    /// The `cursor` to be provided for fetching remaining results.
    let nextCursor: String?
    /// Total number of pages for the given result.
    let totalNumberOfPages: Int?

    enum CodingKeys: String, CodingKey {
        case nextCursor = "next_cursor"
        case totalNumberOfPages = "totalNumberOfPages"
    }

    init(nextCursor: String? = nil, totalNumberOfPages: Int? = nil) {
        self.nextCursor = nextCursor
        self.totalNumberOfPages = totalNumberOfPages
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nextCursor = try container.mkDecodeIfPresent(String.self, forKey: .nextCursor)
        self.totalNumberOfPages = try container.mkDecodeIfPresent(Int.self, forKey: .totalNumberOfPages)
    }
}
