// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct MultiValueBarStatBlockView: View {

    public struct Value: Identifiable {
        public let id = UUID()
        let value: Double // no restrictions on range
        let color: Color
        let title: String
        let subtitle: String

        public init(value: Double, color: Color, title: String, subtitle: String) {
            self.value = value
            self.color = color
            self.title = title
            self.subtitle = subtitle
        }

        var category: CategoryDetailStatView.Data {
            return CategoryDetailStatView.Data(color: self.color, title: self.title, subtitle: self.subtitle)
        }

        var barValue: ProgressBar.Value {
            return ProgressBar.Value(value: self.value, color: self.color)
        }
    }

    public struct CategoriesSection: Identifiable {
        public let id = UUID()
        let title: String?
        let numberOfColumns: Int
        let items: [Value]

        public init(title: String? = nil, numberOfColumns: Int, items: [Value]) {
            self.title = title
            self.numberOfColumns = numberOfColumns
            self.items = items
        }
    }

    public struct Data {
        let title: String
        let value: String
        let subtitle: String?
        let categoriesSections: [CategoriesSection]

        public init(title: String,
                    value: String,
                    subtitle: String? = nil,
                    categoriesSections: [CategoriesSection]) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.categoriesSections = categoriesSections
        }

        public init(title: String,
                    value: String,
                    subtitle: String? = nil,
                    categoriesSection: CategoriesSection) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.categoriesSections = [categoriesSection]
        }
    }

    public let data: Data

    public var body: some View {
        Group {
            TitleValueAndSubtitleStatView(data: .init(
                                        title: self.data.title,
                                        value: self.data.value,
                                        subtitle: self.data.subtitle))
            VStack(alignment: .leading, spacing: 6) {
                ForEach(self.data.categoriesSections) { categoriesSection in
                    self.buildCategoriesSection(categoriesSection: categoriesSection)
                }
            }
        }.wrappedInStatView()
    }

    @ViewBuilder
    private func buildCategoriesSection(categoriesSection: CategoriesSection) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if let title = categoriesSection.title {
                Spacer().frame(height: 7)
                Text(title)
                    .style("subtitle")
                Spacer().frame(height: 7)
            } else {
                Spacer().frame(height: 12)
            }
            ProgressBar(style: .multiValue(categoriesSection.items.map(\.barValue)))
                .frame(height: 5)
            Spacer().frame(height: 11)
            CategoriesStatView(data: .init(
                            numberOfColumns: categoriesSection.numberOfColumns,
                            categories: categoriesSection.items.map(\.category)))
        }
    }
}

struct MultiValueBarStatBlockView_Previews: PreviewProvider {
    static var previews: some View {
        let items: [MultiValueBarStatBlockView.Value] = [
            .init(value: 0.5, color: .blue, title: "Jewellery", subtitle: "12.800€"),
            .init(value: 0.25, color: .yellow, title: "Watches", subtitle: "15.532€"),
            .init(value: 0.25, color: .orange, title: "Accessories", subtitle: "3.436€")
        ]
        Group {
            MultiValueBarStatBlockView(
                data: .init(
                    title: "TURNOVER",
                    value: "87.300€",
                    subtitle: "in 6 categories",
                    categoriesSection: .init(title: nil, numberOfColumns: 2, items: items)))
            MultiValueBarStatBlockView(
                data: .init(
                    title: "TURNOVER",
                    value: "87.300€",
                    categoriesSections: [
                        .init(title: "Turnover by category", numberOfColumns: 2, items: items + items),
                        .init(title: "Turnover by nationality", numberOfColumns: 2, items: items)
                    ]
                ))
        }.previewLayout(.fixed(width: 343, height: 300))
        .environmentObject(Stylist.unstyled)
    }
}
