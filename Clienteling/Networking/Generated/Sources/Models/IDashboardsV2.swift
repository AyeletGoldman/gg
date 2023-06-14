/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardsV2: Codable, Equatable {

    enum IDashboardsV2ItemsV2: Codable, Equatable {
        case iDashboardAbstractComponent(IDashboardAbstractComponent)
        case iDashboardMultiAbstractComponent(IDashboardMultiAbstractComponent)
        case iDashboardSimpleComponent(IDashboardSimpleComponent)

        enum CodingKeys: String, CodingKey {
            case dataType = "dataType"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .dataType)
            switch discriminator {
                case "abstractComponent":
                    self = try .iDashboardAbstractComponent(IDashboardAbstractComponent(from: decoder))
                case "multiAbstractComponent":
                    self = try .iDashboardMultiAbstractComponent(IDashboardMultiAbstractComponent(from: decoder))
                case "simpleComponent":
                    self = try .iDashboardSimpleComponent(IDashboardSimpleComponent(from: decoder))
                default:
                    throw DecodingError.typeMismatch(IDashboardsV2ItemsV2.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .iDashboardAbstractComponent(let wrapped):
                    try wrapped.encode(to: encoder)
                case .iDashboardMultiAbstractComponent(let wrapped):
                    try wrapped.encode(to: encoder)
                case .iDashboardSimpleComponent(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    struct IDashboardsV2Filters: Codable, Equatable {

        struct IDashboardsV2FiltersAvailableFilters: Codable, Equatable {

            let name: String
            let userId: String

            enum CodingKeys: String, CodingKey {
                case name = "name"
                case userId = "userId"
            }

            init(name: String, userId: String) {
                self.name = name
                self.userId = userId
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.name = try container.mkDecode(String.self, forKey: .name)
                self.userId = try container.mkDecode(String.self, forKey: .userId)
            }
        }

        struct IDashboardsV2FiltersSelectedFilter: Codable, Equatable {

            let userId: String
            let username: String

            enum CodingKeys: String, CodingKey {
                case userId = "userId"
                case username = "username"
            }

            init(userId: String, username: String) {
                self.userId = userId
                self.username = username
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.userId = try container.mkDecode(String.self, forKey: .userId)
                self.username = try container.mkDecode(String.self, forKey: .username)
            }
        }

        let availableFilters: [IDashboardsV2FiltersAvailableFilters]
        let selectedFilter: IDashboardsV2FiltersSelectedFilter?

        enum CodingKeys: String, CodingKey {
            case availableFilters = "availableFilters"
            case selectedFilter = "selectedFilter"
        }

        init(availableFilters: [IDashboardsV2FiltersAvailableFilters], selectedFilter: IDashboardsV2FiltersSelectedFilter? = nil) {
            self.availableFilters = availableFilters
            self.selectedFilter = selectedFilter
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.availableFilters = try container.mkDecode([IDashboardsV2FiltersAvailableFilters].self, forKey: .availableFilters)
            self.selectedFilter = try container.mkDecodeIfPresent(IDashboardsV2FiltersSelectedFilter.self, forKey: .selectedFilter)
        }
    }

    let filters: IDashboardsV2Filters
    let itemsV2: [IDashboardsV2ItemsV2]

    enum CodingKeys: String, CodingKey {
        case filters = "filters"
        case itemsV2 = "itemsV2"
    }

    init(filters: IDashboardsV2Filters, itemsV2: [IDashboardsV2ItemsV2]) {
        self.filters = filters
        self.itemsV2 = itemsV2
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filters = try container.mkDecode(IDashboardsV2Filters.self, forKey: .filters)
        self.itemsV2 = try container.mkDecode([IDashboardsV2ItemsV2].self, forKey: .itemsV2)
    }
}
