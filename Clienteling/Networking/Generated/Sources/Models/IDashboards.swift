/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboards: Codable, Equatable {

    enum IDashboardsItems: Codable, Equatable {
        case iDashboardCircularStat(IDashboardCircularStat)
        case iDashboardMultiValueBar(IDashboardMultiValueBar)
        case iDashboardMultiValueCircular(IDashboardMultiValueCircular)
        case iDashboardSimpleStat(IDashboardSimpleStat)
        case iDashboardSingleValueBar(IDashboardSingleValueBar)

        enum CodingKeys: String, CodingKey {
            case type = "type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .type)
            switch discriminator {
                case "circularStat":
                    self = try .iDashboardCircularStat(IDashboardCircularStat(from: decoder))
                case "multiValueBar":
                    self = try .iDashboardMultiValueBar(IDashboardMultiValueBar(from: decoder))
                case "multiValueCircular":
                    self = try .iDashboardMultiValueCircular(IDashboardMultiValueCircular(from: decoder))
                case "simpleStat":
                    self = try .iDashboardSimpleStat(IDashboardSimpleStat(from: decoder))
                case "singleValueBar":
                    self = try .iDashboardSingleValueBar(IDashboardSingleValueBar(from: decoder))
                default:
                    throw DecodingError.typeMismatch(IDashboardsItems.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .iDashboardCircularStat(let wrapped):
                    try wrapped.encode(to: encoder)
                case .iDashboardMultiValueBar(let wrapped):
                    try wrapped.encode(to: encoder)
                case .iDashboardMultiValueCircular(let wrapped):
                    try wrapped.encode(to: encoder)
                case .iDashboardSimpleStat(let wrapped):
                    try wrapped.encode(to: encoder)
                case .iDashboardSingleValueBar(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    let filters: IFilters
    let items: [IDashboardsItems]
    let title: String

    enum CodingKeys: String, CodingKey {
        case filters = "filters"
        case items = "items"
        case title = "title"
    }

    init(filters: IFilters, items: [IDashboardsItems], title: String) {
        self.filters = filters
        self.items = items
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filters = try container.mkDecode(IFilters.self, forKey: .filters)
        self.items = try container.mkDecode([IDashboardsItems].self, forKey: .items)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
