// MH Private Clienteling
// 28/06/2022

import Foundation
import MaisonKit
import SwiftUI

extension MultiValueBarStatBlockView.Data {
    
    init(abstractComponent data: IDashboardAbstractComponent) {
        let section = MultiValueBarStatBlockView.CategoriesSection(
            title: nil,
            numberOfColumns: 2,
            items: data.data.enumerated().map { index, item in
                let subtitle = String(format: "%@ %@", item.value?.toString(formatter: .short) ?? "0", data.metricLabel ?? "")
                return MultiValueBarStatBlockView.Value(
                    value: item.value ?? 0,
                    color: .getDashboardColor(for: index),
                    title: subtitle,
                    subtitle: item.componentTitle
                )
            })
        self.init(
            title: MKLocalizedString(data.subtitle ?? "", comment: "Abstract Component title"),
            value: "",
            categoriesSection: section
        )
    }
    
    init(multiAbstractComponent data: IDashboardMultiAbstractComponent) {
        let sections = data.data.map { abstractData in
            MultiValueBarStatBlockView.CategoriesSection(
                title: MKLocalizedString(abstractData.label, comment: "Abstract Component subtitle").capitalized,
                numberOfColumns: 2,
                items: abstractData.data.enumerated().map({ index, item in
                    let value = Double(item.value) ?? 0
                    let subtitle = value.toString(formatter: .short) ?? "N/A"
                    
                    return MultiValueBarStatBlockView.Value(
                        value: value,
                        color: .getDashboardColor(for: index),
                        title: item.label,
                        subtitle: subtitle
                    )
                }))
        }
        
        self.init(
            title: MKLocalizedString(data.componentTitle, comment: "Abstract Component title"),
            value: "",
            subtitle: data.subtitle,
            categoriesSections: sections
        )
    }
}

extension SimpleStatBlockView.Data {
    
    init(simpleComponent data: IDashboardSimpleComponent) {
        self.init(
            title: MKLocalizedString(data.subtitle ?? "", comment: "SingleValueBarStatBlockView title"),
            value: data.valueDescription,
            subtitle: data.componentTitle
        )
    }
    init(abstractComponent component: IDashboardAbstractComponent) {
        var valueDescription = "N/A"
        if let value = component.data.first?.value,
           value != NetworkAdapter.NO_DATA_FLAG {
            valueDescription = "\(value.toString(formatter: .short) ?? "0") \(component.metricLabel ?? "")"
        }
        self.init(
            title: MKLocalizedString(component.subtitle ?? "", comment: "SingleValueBarStatBlockView subtitle"),
            value: valueDescription,
            subtitle: MKLocalizedString(component.componentTitle, comment: "SingleValueBarStatBlockView title")
        )
    }
}

extension IDashboardSimpleComponent {
    var valueDescription: String {
        if let value = value,
           value != NetworkAdapter.NO_DATA_FLAG {
            return "\(value.toString(formatter: .short) ?? "0") \(label ?? "")"
        }
        return "N/A"
    }
}

extension CircularProgressStatBlockView.Data {
    
    init(_ component: IDashboardAbstractComponent) {
        self.init(
            title: component.componentTitle,
            value: component.data.compactMap(\.value).reduce(0, +).toString(formatter: .short) ?? "0",
            subtitle: component.subtitle ?? "",
            categories: component.data.enumerated().map { index, item in
                CircularProgressStatBlockView.Value(
                    value: item.value ?? 0,
                    color: .getDashboardColor(for: index),
                    title: item.componentTitle ,
                    subtitle: ""
                )
            }
        )
    }
}

extension MultiCircularStatBlockView.Data {
    
    init(abstractComponent component: IDashboardAbstractComponent) {
        let total = component.data.compactMap(\.value).reduce(0, +)
        self.init(
            title: MKLocalizedString(component.componentTitle, comment: "Component Title"),
            items: component.data.enumerated().map({ index, item in
                let percentage = ((item.value ?? 0) / total)
                return MultiCircularStatBlockView.Value(
                    value: CGFloat(percentage),
                    color: .getDashboardColor(for: index),
                    title: item.componentTitle,
                    body: "\(Int(percentage * 100))%"
                )
            })
        )
    }
}

extension HorizontalGraphView.Data {
    init(abstractComponent data: IDashboardAbstractComponent) {
        self.init(
            title: MKLocalizedString(data.componentTitle, comment: "Abstract Component title"),
            value: "",
            categoriesSection: .init(
                items: data.data.map {
                    let value = ($0.value == nil || $0.value == NetworkAdapter.NO_DATA_FLAG) ? 0 : $0.value!
                    return .init(value: value, title: $0.componentTitle, subtitle: value.toString(formatter: .short) ?? "0")
                }
            )
        )
    }
    
    init(multiAbstractComponent data: IDashboardMultiAbstractComponent) {
        self.init(
            title: data.componentTitle,
            value: data.subtitle ?? "",
            categoriesSections: data.data.map({ component in
                    .init(title: component.label,
                          items: component.data.map({ item in
                            .init(value: Double(item.value) ?? 0, title: item.label, subtitle: item.value)
                    }))
            })
        )
    }
}
extension MultiHorizontalGraphView.Data {
    init(component: IDashboardMultiAbstractComponent, style: MultiHorizontalGraphView.Style = .outOf) {
    
        let colors: [Color] = [
            .init(hex: "#0fa15e"),
            .init(hex: "#ffbbd9")
        ]

        // The bars are unlimited, but each bar can represent up to 2 values!
        self.init(
            title: component.componentTitle,
            value: "123",
            bars: component.data.map({ item in
                return .init(
                    title: item.label,
                    items: item.data.enumerated().map { index, data in
                        let value = Double(data.value) ?? 0
                        return .init(
                            value: value,
                            color: colors[index],
                            title: data.label,
                            subtitle: value.toString(formatter: .short) ?? "0"
                        )
                    }
                )
            })
        )
    }
}

extension GaugeView.Data {
    init(component: IDashboardAbstractComponent) {
        let total = component.data.compactMap(\.value).reduce(0, +)
        self.init(
            title: component.subtitle ?? "",
            value: NumberFormatter.short.string(from: total as NSNumber),
            subtitle: component.componentTitle ,
            categories: component.data.enumerated().map { index, item in
                let subtitle = item.value?.toString(formatter: .short) ?? "0"
                return .init(
                    value: item.value ?? 0,
                    color: .getDashboardColor(for: index),
                    title: item.componentTitle,
                    subtitle: subtitle
                )
            })
    }
}
fileprivate extension Color {
    static private let dashboardGraphColors: [String] = [
        "#e6194B", "#3cb44b", "#ffe119", "#4363d8", "#f58231",
        "#911eb4", "#42d4f4", "#f032e6", "#bfef45", "#fabed4",
        "#469990", "#dcbeff", "#9A6324", "#fffac8", "#800000", "#aaffc3",
        "#808000", "#ffd8b1", "#000075", "#a9a9a9", "#ffffff", "#000000"
    ]
    static func getDashboardColor(for index: Int) -> Color {
        guard index >= 0 else { return .blue }
        return Color(hex: dashboardGraphColors[index % dashboardGraphColors.count])
    }
}
extension Double {
    func toString(formatter: NumberFormatter) -> String? {
        formatter.string(from: self as NSNumber)
    }
}
