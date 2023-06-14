// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

/// An implementation of `CustomProductCategoryRow` that creates an `ProductCategoryCardsRowView`
public struct ProductCategoryCardsRow: CustomProductCategoryRow {

    /// An enum to define the size of the items in the row
    public enum RowType {
        case large(Item)
        case mediumSmall(Item, Item?)
        case smallMedium(Item, Item)
        case threeSmall(Item, Item?, Item?)
    }

    /// The image product category item definition
    public struct Item: ProductCategory {
        public let id: String
        public let title: String
        public let nextScreen: CatalogScreenType
        let imageURL: URL?

        public init(id: String, title: String, imageURL: String, nextScreen: CatalogScreenType) {
            self.id = id
            self.title = title
            self.imageURL = URL(string: imageURL)
            self.nextScreen = nextScreen
        }
    }

    /// The row type for this row object
    private let rowType: RowType

    /// Creates a new `ProductCategoryCardsRow` with the given row type
    /// - Parameter rowType: The row type for this row object
    public init(rowType: RowType) {
        self.rowType = rowType
    }

    @ViewBuilder
    public func makeBody(geoWidth: CGFloat, onSelectCategory: @escaping CategorySelectionClosure) -> AnyView {
        ProductCategoryCardsRowView(rowType: self.rowType, geoWidth: geoWidth, onSelectCategory: onSelectCategory)
            .eraseToAnyView()
    }
}
