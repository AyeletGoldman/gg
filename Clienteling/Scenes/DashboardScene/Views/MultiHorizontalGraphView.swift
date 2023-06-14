// MH Private Clienteling
// 27/06/2022

import SwiftUI

// MH Private Clienteling
// 22/06/2022

import MaisonKit
import StylableSwiftUI

struct MultiHorizontalGraphView: View {
    
    struct Value: Identifiable, Comparable {
        static func < (lhs: MultiHorizontalGraphView.Value, rhs: MultiHorizontalGraphView.Value) -> Bool {
            lhs.value < rhs.value
        }
        
        let id = UUID()
        let value: Double // no restrictions on range
        let color: Color
        let title: String
        let subtitle: String
        var progressBarValue: ProgressBar.Value {
            .init(value: value, color: color)
        }
    }
    
    struct BarValue: Identifiable {
        let id = UUID()
        let items: [Value]
        let title: String
        
        init(title: String, items: [Value]) {
            self.title = title
            self.items = items
        }
        
        func progressValues(style: Style = .outOf) -> [ProgressBar.Value] {
            if items.count > 1, style == .outOf {
                let sorted = Array(items.sorted().reversed())
                var bars = sorted.suffix(from: 1).map(\.progressBarValue)
                let accumulated = sorted.suffix(from: 1).map(\.value).reduce(0, +)
                if let first = sorted.first {
                    bars.append(ProgressBar.Value(value: first.value - accumulated, color: first.color))
                }
                return bars
            }
            return items.map(\.progressBarValue)
        }
        var total: Double {
            items.map(\.value).max() ?? 0
        }
    }
    
    enum Style {
        case comparison
        case outOf
    }
    
    enum Variant {
        case graph1
        case graph2
    }
    
    struct Data {
        let title: String
        let value: String
        let subtitle: String?
        let bars: [BarValue]
        
        init(title: String,
             value: String,
             subtitle: String? = nil,
             bars: [BarValue]) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.bars = bars
        }
        
        var categories: [CategoryDetailStatView.Data]? {
            var components = [CategoryDetailStatView.Data]()
            for bar in bars {
                for item in bar.items {
                    if !components.contains(where: { $0.title == item.title }),
                       !item.title.isEmpty {
                        components.append(.init(color: item.color, title: item.title, subtitle: ""))
                    }
                }
            }
            return components
        }
        
        var totalValue: Double {
            return bars.map(\.items).reduce(into: 0) { $0 += $1.map(\.value).max() ?? 0 }
        }
    }
    
    private let style: Style
    private let variant: Variant
    private let data: Data
    
    init(data: Data, style: Style = .outOf, variant: Variant = .graph1) {
        self.data = data
        self.style = style
        self.variant = variant
    }
    
    private var componentSubtitle: String? {
        if style == .outOf {
            return data.bars.first?.items.max()?.title
        }
        return MKLocalizedString("In Total", comment: "")
    }
    
    var body: some View {
        StylableGroup("block-stats") {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .bottom) {
                    let total = data.totalValue.toString(formatter: .short) ?? ""
                    TitleValueAndSubtitleStatView(data: .init(
                        title: data.title,
                        value: total,
                        subtitle: componentSubtitle
                    ))
                    .frame(alignment: .leading)
                    .layoutPriority(1)
                    Spacer()
                        .frame(maxWidth: 50)
                        .layoutPriority(0)
                    if let categories = data.categories {
                        CategoriesStatView(data: .init(categories: categories))
                    }
                }
                switch variant {
                case .graph1:
                    buildGraph()
                case .graph2:
                    buildGraph2()
                }
            }
            .padding()
            .style("background")
        }
    }
    
    @ViewBuilder func buildGraph() -> some View {
        StylableGroup("block-stats[custom5]") {
            VStack(spacing: 0) {
                ForEach(data.bars) { bar in
                    self.makeGraph(for: bar, style: style)
                        .padding(.vertical, 10)
                }
            }
        }
    }
    @ViewBuilder func buildGraph2() -> some View {
        StylableGroup("block-stats[combinedbar]") {
            ForEach(data.bars) { bar in
                self.makeGraph2(for: bar, style: style)
            }
        }
    }
    
    @ViewBuilder
    private func makeGraph(for bar: BarValue, style: Style) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            TitleStatView(text: bar.title)
                .frame(alignment: .center)
                .padding(.horizontal, 2)
            HStack {
                if let value = bar.items.first?.subtitle {
                    SubtitleStatView(text: value)
                        .frame(maxWidth: 50, alignment: .leading)
                }
                
                ProgressBar(style: .multiValue(bar.progressValues(style: style)))
                    .frame(height: 6)
                
                if let subtitle = bar.items.last?.subtitle {
                    SubtitleStatView(text: subtitle)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
            }
        }
    }
    
    @ViewBuilder
    private func makeGraph2(for bar: BarValue, style: Style) -> some View {
        HStack {
            Text(verbatim: bar.title)
                .style("title")
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .frame(maxWidth: 60, alignment: .leading)
            ProgressBar(style: .multiValue(bar.progressValues(style: style)))
                .frame(height: 6)
            let barItems = bar.items.sorted()
            let subtitle = String(format: "%@/%@",
                                  barItems.first?.subtitle ?? "",
                                  barItems.last?.subtitle ?? "")
            SubtitleStatView(text: subtitle)
                .frame(maxWidth: 60, alignment: .trailing)
        }
    }
}

struct LeftTextView: View {
    let text: String
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .style("subtitle")
        }
        .frame(alignment: .leading)
    }
}

// MARK: - Connecting MultiHorizontalGraphView to AnyStatItemDisplayView

struct MultiHorizontalGraphDisplayView: StatItemDisplayView {
    let data: MultiHorizontalGraphView.Data
    var isSmallItem: Bool = false
    func makeBody() -> some View {
        MultiHorizontalGraphView(data: data)
    }
}

// MARK: - Previews
struct MultiHorizontalGraphView_Previews: PreviewProvider {
    
    static var previews: some View {
        let bars: [MultiHorizontalGraphView.BarValue] = [
            .init(title: "EUROPE", items: [
                .init(value: 34, color: .green, title: "Active Accounts", subtitle: Double(34).toString(formatter: .short)!),
                .init(value: 156, color: .purple, title: "All Accounts", subtitle: Double(156).toString(formatter: .short)!)
            ]),
            .init(title: "EUROPE", items: [
                .init(value: 34, color: .green, title: "Active Accounts", subtitle: Double(34).toString(formatter: .short)!),
                .init(value: 156, color: .purple, title: "All Accounts", subtitle: Double(156).toString(formatter: .short)!)
            ]),
            .init(title: "EUROPE", items: [
                .init(value: 12320, color: .green, title: "Active Accounts", subtitle: 1432.toString(formatter: .short)!),
                .init(value: 22222.0, color: .purple, title: "All Accounts", subtitle: 2311.toString(formatter: .short)!)
            ])
        ]
        
        let data: MultiHorizontalGraphView.Data = .init(
            title: "CLIENT SEGMENTATION",
            value: "24.2 K",
            subtitle: nil,
            bars: bars
        )
        
        VStack {
            MultiHorizontalGraphView(
                data: data,
                style: .outOf,
                variant: .graph1
            )
            MultiHorizontalGraphView(
                data: data,
                style: .outOf,
                variant: .graph2
            )
        }
        .environmentObject(Stylist.create())
    }
}
