/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct SourceEventInstore: Codable, Equatable {

    enum SourceEventInstoreType: String, Codable, Equatable, CaseIterable {
        case inStore = "inStore"
    }

    let advisor: Advisor
    let store: Store
    let type: SourceEventInstoreType

    enum CodingKeys: String, CodingKey {
        case advisor = "advisor"
        case store = "store"
        case type = "type"
    }

    init(advisor: Advisor, store: Store, type: SourceEventInstoreType) {
        self.advisor = advisor
        self.store = store
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisor = try container.mkDecode(Advisor.self, forKey: .advisor)
        self.store = try container.mkDecode(Store.self, forKey: .store)
        self.type = try container.mkDecode(SourceEventInstoreType.self, forKey: .type)
    }
}
