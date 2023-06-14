/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardSimpleComponent: Codable, Equatable {

    enum IDashboardSimpleComponentDataType: String, Codable, Equatable, CaseIterable {
        case simpleComponent = "simpleComponent"
    }

    enum IDashboardSimpleComponentClientGraph: String, Codable, Equatable, CaseIterable {
        case bar = "BAR"
        case singleValue = "SINGLE_VALUE"
        case circles = "CIRCLES"
        case gauge = "GAUGE"
        case horizontal = "HORIZONTAL"
        case combineBar = "COMBINE_BAR"
    }

    let clientGraph: IDashboardSimpleComponentClientGraph?
    let componentId: String
    let componentTitle: String
    let customLabels: [String]
    let dataType: IDashboardSimpleComponentDataType
    let label: String?
    let metricLabel: String?
    let subtitle: String?
    let value: Double?

    enum CodingKeys: String, CodingKey {
        case clientGraph = "clientGraph"
        case componentId = "componentId"
        case componentTitle = "componentTitle"
        case customLabels = "customLabels"
        case dataType = "dataType"
        case label = "label"
        case metricLabel = "metricLabel"
        case subtitle = "subtitle"
        case value = "value"
    }

    init(clientGraph: IDashboardSimpleComponentClientGraph? = nil, componentId: String, componentTitle: String, customLabels: [String], dataType: IDashboardSimpleComponentDataType, label: String? = nil, metricLabel: String? = nil, subtitle: String? = nil, value: Double? = nil) {
        self.clientGraph = clientGraph
        self.componentId = componentId
        self.componentTitle = componentTitle
        self.customLabels = customLabels
        self.dataType = dataType
        self.label = label
        self.metricLabel = metricLabel
        self.subtitle = subtitle
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientGraph = try container.mkDecodeIfPresent(IDashboardSimpleComponentClientGraph.self, forKey: .clientGraph)
        self.componentId = try container.mkDecode(String.self, forKey: .componentId)
        self.componentTitle = try container.mkDecode(String.self, forKey: .componentTitle)
        self.customLabels = try container.mkDecode([String].self, forKey: .customLabels)
        self.dataType = try container.mkDecode(IDashboardSimpleComponentDataType.self, forKey: .dataType)
        self.label = try container.mkDecodeIfPresent(String.self, forKey: .label)
        self.metricLabel = try container.mkDecodeIfPresent(String.self, forKey: .metricLabel)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.value = try container.mkDecodeIfPresent(Double.self, forKey: .value)
    }
}
