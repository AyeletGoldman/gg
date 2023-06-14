/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Pagination: Codable, Equatable {

    let actualPageIndex: Int
    let pageSize: Int
    let totalCount: Int
    let totalPageCount: Int

    enum CodingKeys: String, CodingKey {
        case actualPageIndex = "actualPageIndex"
        case pageSize = "pageSize"
        case totalCount = "totalCount"
        case totalPageCount = "totalPageCount"
    }

    init(actualPageIndex: Int, pageSize: Int, totalCount: Int, totalPageCount: Int) {
        self.actualPageIndex = actualPageIndex
        self.pageSize = pageSize
        self.totalCount = totalCount
        self.totalPageCount = totalPageCount
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actualPageIndex = try container.mkDecode(Int.self, forKey: .actualPageIndex)
        self.pageSize = try container.mkDecode(Int.self, forKey: .pageSize)
        self.totalCount = try container.mkDecode(Int.self, forKey: .totalCount)
        self.totalPageCount = try container.mkDecode(Int.self, forKey: .totalPageCount)
    }
}
