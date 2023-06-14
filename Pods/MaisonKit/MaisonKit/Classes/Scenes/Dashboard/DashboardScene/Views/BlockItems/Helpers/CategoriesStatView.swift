// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view to show an array of categories
public struct CategoriesStatView: View {

    /// The object holding the data for the categories and how to display them.
    public struct Data {
        /// The number of columns to create for displaying the categories. The default value for this is `1`.
        public let numberOfColumns: Int
        /// An array of detail view data. Each element represents a category to display in the chart.
        public let categories: [CategoryDetailStatView.Data]

        /// Creates a new `CategoriesStatView.Data`.
        /// - Parameters:
        ///   - numberOfColumns: The number of columns to create for displaying the categories. The default value for this is `1`.
        ///   - categories: An array of detail view data. Each element represents a category to display in the chart.
        public init(numberOfColumns: Int = 1,
                    categories: [CategoryDetailStatView.Data]) {
            self.numberOfColumns = numberOfColumns
            self.categories = categories
        }
    }

    private let data: Data

    /// Creates a new `CategoriesStatView`.
    /// - Parameter data: The object holding the data for the categories and how to display them.
    public init(data: Data) {
        self.data = data
    }

    private var itemsPerColumn: Int {
        return Int(ceil(
            Double(self.data.categories.count) / Double(self.data.numberOfColumns)
        ))
    }

    private func columnRange(for column: Int) -> Range<Int> {
        let start = column * self.itemsPerColumn
        let end = min(start + self.itemsPerColumn, self.data.categories.count)
        return start..<end
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 25) {
            ForEach(0..<self.data.numberOfColumns, id: \.self) { column in
                VStack(spacing: 6) {
                    ForEach(self.columnRange(for: column), id: \.self) { index in
                        CategoryDetailStatView(data: self.data.categories[index])
                    }
                }
            }
        }
    }
}

struct CategoriesStatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoriesStatView(
                data: .init(
                    categories: [
                        .init(color: .blue, title: "Test", subtitle: "12.213€")
                    ]))
            CategoriesStatView(
                data: CategoriesStatView.Data(
                    numberOfColumns: 2,
                    categories: [
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€")
                    ]))
            CategoriesStatView(
                data: CategoriesStatView.Data(
                    numberOfColumns: 3,
                    categories: [
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€"),
                        .init(color: .blue, title: "Test", subtitle: "12.213€")
                    ]))
        }.environmentObject(Stylist.unstyled)
        .previewLayout(.sizeThatFits)
    }
}
