// MH Private Clienteling
// 22/06/2022

import MaisonKit
import SwiftUI
import StylableSwiftUI

struct HorizontalGraphView: View {
    struct Value: Identifiable {
        let id = UUID()
        let value: Double // no restrictions on range
        let title: String
        let subtitle: String
        
        init(value: Double, title: String, subtitle: String) {
            self.value = value
            self.title = title
            self.subtitle = subtitle
        }
    }
    
    struct CategoriesSection: Identifiable {
        let id = UUID()
        let title: String?
        let items: [Value]
        
        init(title: String? = nil, items: [Value]) {
            self.title = title
            self.items = items
        }
        
        var maxBarValue: Double {
            self.items.map(\.value).max() ?? 0
        }
        
    }
    
    struct Data {
        let title: String
        let value: String
        let subtitle: String?
        let categoriesSections: [CategoriesSection]
        
        init(title: String,
             value: String,
             subtitle: String? = nil,
             categoriesSections: [CategoriesSection]) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.categoriesSections = categoriesSections
        }
        
        init(title: String,
             value: String,
             subtitle: String? = nil,
             categoriesSection: CategoriesSection) {
            self.init(title: title,
                      value: value,
                      subtitle: subtitle,
                      categoriesSections: [categoriesSection])
        }
        
        var maxValue: Double {
            return categoriesSections.map(\.maxBarValue).max() ?? 0
        }
    }
    
    let data: Data
    
    var body: some View {
        StylableGroup("block-stats[custom1]") {
            VStack(alignment: .leading) {
                TitleStatView(text: data.title)
                ForEach(data.categoriesSections) { section in
                    makeGraph(section: section)
                }
            }
            .padding()
            .style("background")
        }
    }
    
    @ViewBuilder
    private func makeGraph(section: CategoriesSection) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title = section.title {
                SubtitleStatView(text: title)
                    .padding(.vertical, 5)
            }
            ForEach(section.items) { value in
                makeBar(value: value)
            }
        }
    }
    
    @ViewBuilder
    private func makeBar(value: Value) -> some View {
        HStack {
            Text(value.title)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .style("title")
                .frame(maxWidth: 80, alignment: .leading)
            let maxValue = data.maxValue
            let barValue: CGFloat = maxValue == 0 ? 0 : CGFloat(value.value / maxValue)
            let valueDescription = value.value.toString(formatter: .short) ?? ""
            ProgressBar(style: .single(barValue))
                .frame(height: 6)
            SubtitleStatView(text: valueDescription)
                .frame(maxWidth: 60, alignment: .trailing)
            
        }
    }
}

// MARK: - Connecting HorizontalGraphView to AnyStatItemDisplayView
struct HorizontalGraphDisplayView: StatItemDisplayView {
    let data: HorizontalGraphView.Data
    var isSmallItem: Bool = false
    func makeBody() -> some View {
        HorizontalGraphView(data: data)
    }
}

// MARK: - Preview
struct HorizontalGraphView_Previews: PreviewProvider {
    
    static var previews: some View {
        let items: [HorizontalGraphView.Value] = [
            HorizontalGraphView.Value(value: 3, title: "Active Accounts", subtitle: ""),
            HorizontalGraphView.Value(value: 22, title: "All accounts", subtitle: ""),
            HorizontalGraphView.Value(value: 23146, title: "Sleeper", subtitle: ""),
            HorizontalGraphView.Value(value: 3900, title: "None", subtitle: ""),
            HorizontalGraphView.Value(value: 24, title: "Beginner", subtitle: "24"),
            HorizontalGraphView.Value(value: 1231, title: "Top VIC", subtitle: "1231")
        ]
        VStack(spacing: 20) {
            HorizontalGraphView(data: .init(title: "CLIENT SEGMENTATION", value: "123.2K", subtitle: "Total Sales - Last 12 Months", categoriesSection: .init(items: items)))
            let categories: [HorizontalGraphView.CategoriesSection] = [
                .init(title: "First Category", items: items),
                .init(title: "Second Category", items: items)
            ]
            HorizontalGraphView(data: .init(title: "CLIENT SEGMENTATION", value: "123.2K", subtitle: "Total Sales - Last 12 Months", categoriesSections: categories))
        }
        .environmentObject(Stylist.create())
    }
}
