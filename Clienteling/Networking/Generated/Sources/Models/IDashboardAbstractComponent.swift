/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardAbstractComponent: Codable, Equatable {

    enum IDashboardAbstractComponentDataType: String, Codable, Equatable, CaseIterable {
        case abstractComponent = "abstractComponent"
    }

    enum IDashboardAbstractComponentClientGraph: String, Codable, Equatable, CaseIterable {
        case bar = "BAR"
        case singleValue = "SINGLE_VALUE"
        case circles = "CIRCLES"
        case gauge = "GAUGE"
        case horizontal = "HORIZONTAL"
        case combineBar = "COMBINE_BAR"
    }

    struct IDashboardAbstractComponentData: Codable, Equatable {

        let componentTitle: String
        let value: Double?

        enum CodingKeys: String, CodingKey {
            case componentTitle = "componentTitle"
            case value = "value"
        }

        init(componentTitle: String, value: Double? = nil) {
            self.componentTitle = componentTitle
            self.value = value
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.componentTitle = try container.mkDecode(String.self, forKey: .componentTitle)
            self.value = try container.mkDecodeIfPresent(Double.self, forKey: .value)
        }
    }

    let clientGraph: IDashboardAbstractComponentClientGraph?
    let componentId: String
    let componentTitle: String
    let customLabels: [String]
    let data: [IDashboardAbstractComponentData]
    let dataType: IDashboardAbstractComponentDataType
    let metricLabel: String?
    let subtitle: String?

    enum CodingKeys: String, CodingKey {
        case clientGraph = "clientGraph"
        case componentId = "componentId"
        case componentTitle = "componentTitle"
        case customLabels = "customLabels"
        case data = "data"
        case dataType = "dataType"
        case metricLabel = "metricLabel"
        case subtitle = "subtitle"
    }

    init(clientGraph: IDashboardAbstractComponentClientGraph? = nil, componentId: String, componentTitle: String, customLabels: [String], data: [IDashboardAbstractComponentData], dataType: IDashboardAbstractComponentDataType, metricLabel: String? = nil, subtitle: String? = nil) {
        self.clientGraph = clientGraph
        self.componentId = componentId
        self.componentTitle = componentTitle
        self.customLabels = customLabels
        self.data = data
        self.dataType = dataType
        self.metricLabel = metricLabel
        self.subtitle = subtitle
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientGraph = try container.mkDecodeIfPresent(IDashboardAbstractComponentClientGraph.self, forKey: .clientGraph)
        self.componentId = try container.mkDecode(String.self, forKey: .componentId)
        self.componentTitle = try container.mkDecode(String.self, forKey: .componentTitle)
        self.customLabels = try container.mkDecode([String].self, forKey: .customLabels)
        self.data = try container.mkDecode([IDashboardAbstractComponentData].self, forKey: .data)
        self.dataType = try container.mkDecode(IDashboardAbstractComponentDataType.self, forKey: .dataType)
        self.metricLabel = try container.mkDecodeIfPresent(String.self, forKey: .metricLabel)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
    }
}
