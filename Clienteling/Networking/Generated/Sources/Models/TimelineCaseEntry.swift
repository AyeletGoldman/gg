/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TimelineCaseEntry: Codable, Equatable {

    enum TimelineCaseEntryType: String, Codable, Equatable, CaseIterable {
        case _case = "case"
    }

    let datetime: ISO8601DateTimeString
    /// Additional fields to display.
    let detailsFields: [TypedValue]?
    /// The ID for the case.
    let id: String
    let owner: Advisor
    /// Current status for the case.
    let status: String
    let store: Store?
    let type: TimelineCaseEntryType

    enum CodingKeys: String, CodingKey {
        case datetime = "datetime"
        case detailsFields = "detailsFields"
        case id = "id"
        case owner = "owner"
        case status = "status"
        case store = "store"
        case type = "type"
    }

    init(datetime: ISO8601DateTimeString, detailsFields: [TypedValue]? = nil, id: String, owner: Advisor, status: String, store: Store? = nil, type: TimelineCaseEntryType) {
        self.datetime = datetime
        self.detailsFields = detailsFields
        self.id = id
        self.owner = owner
        self.status = status
        self.store = store
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.datetime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .datetime)
        self.detailsFields = try container.mkDecodeIfPresent([TypedValue].self, forKey: .detailsFields)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.owner = try container.mkDecode(Advisor.self, forKey: .owner)
        self.status = try container.mkDecode(String.self, forKey: .status)
        self.store = try container.mkDecodeIfPresent(Store.self, forKey: .store)
        self.type = try container.mkDecode(TimelineCaseEntryType.self, forKey: .type)
    }
}
