/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardMultiAbstractComponent: Codable, Equatable {

    enum IDashboardMultiAbstractComponentDataType: String, Codable, Equatable, CaseIterable {
        case multiAbstractComponent = "multiAbstractComponent"
    }

    enum IDashboardMultiAbstractComponentClientGraph: String, Codable, Equatable, CaseIterable {
        case bar = "BAR"
        case singleValue = "SINGLE_VALUE"
        case circles = "CIRCLES"
        case gauge = "GAUGE"
        case horizontal = "HORIZONTAL"
        case combineBar = "COMBINE_BAR"
    }

    struct IDashboardMultiAbstractComponentData: Codable, Equatable {

        struct IDashboardMultiAbstractComponentDataData: Codable, Equatable {

            let label: String
            let value: String

            enum CodingKeys: String, CodingKey {
                case label = "label"
                case value = "value"
            }

            init(label: String, value: String) {
                self.label = label
                self.value = value
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.label = try container.mkDecode(String.self, forKey: .label)
                self.value = try container.mkDecode(String.self, forKey: .value)
            }
        }

        let data: [IDashboardMultiAbstractComponentDataData]
        let label: String

        enum CodingKeys: String, CodingKey {
            case data = "data"
            case label = "label"
        }

        init(data: [IDashboardMultiAbstractComponentDataData], label: String) {
            self.data = data
            self.label = label
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.data = try container.mkDecode([IDashboardMultiAbstractComponentDataData].self, forKey: .data)
            self.label = try container.mkDecode(String.self, forKey: .label)
        }
    }

    let clientGraph: IDashboardMultiAbstractComponentClientGraph?
    let componentId: String
    let componentTitle: String
    let customLabels: [String]
    let data: [IDashboardMultiAbstractComponentData]
    let dataType: IDashboardMultiAbstractComponentDataType
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

    init(clientGraph: IDashboardMultiAbstractComponentClientGraph? = nil, componentId: String, componentTitle: String, customLabels: [String], data: [IDashboardMultiAbstractComponentData], dataType: IDashboardMultiAbstractComponentDataType, metricLabel: String? = nil, subtitle: String? = nil) {
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
        self.clientGraph = try container.mkDecodeIfPresent(IDashboardMultiAbstractComponentClientGraph.self, forKey: .clientGraph)
        self.componentId = try container.mkDecode(String.self, forKey: .componentId)
        self.componentTitle = try container.mkDecode(String.self, forKey: .componentTitle)
        self.customLabels = try container.mkDecode([String].self, forKey: .customLabels)
        self.data = try container.mkDecode([IDashboardMultiAbstractComponentData].self, forKey: .data)
        self.dataType = try container.mkDecode(IDashboardMultiAbstractComponentDataType.self, forKey: .dataType)
        self.metricLabel = try container.mkDecodeIfPresent(String.self, forKey: .metricLabel)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
    }
}
