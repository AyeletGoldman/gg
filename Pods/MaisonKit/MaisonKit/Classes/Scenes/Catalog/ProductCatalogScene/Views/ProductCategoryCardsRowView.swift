// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

public struct ProductCategoryCardsRowView: View {

    private let rowType: ProductCategoryCardsRow.RowType
    private let geoWidth: CGFloat
    private let cardSpacingWidth: CGFloat = 19
    private let onSelectCategory: CategorySelectionClosure

    public init(rowType: ProductCategoryCardsRow.RowType, geoWidth: CGFloat, onSelectCategory: @escaping CategorySelectionClosure) {
        self.rowType = rowType
        self.geoWidth = geoWidth
        self.onSelectCategory = onSelectCategory
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            switch self.rowType {
            case .large(let item):
                self.buildCard(item: item, itemWidth: self.geoWidth)
            case .mediumSmall(let item1, let item2):
                self.buildCard(item: item1, itemWidth: self.getMediumItemWidth())
                Spacer()
                if let item2 = item2 {
                    self.buildCard(item: item2, itemWidth: self.getSmallItemWidth())
                }
            case .smallMedium(let item1, let item2):
                self.buildCard(item: item1, itemWidth: self.getSmallItemWidth())
                Spacer()
                self.buildCard(item: item2, itemWidth: self.getMediumItemWidth())

            case .threeSmall(let item1, let item2, let item3):
                self.buildCard(item: item1, itemWidth: self.getSmallItemWidth())
                Spacer()
                if let item2 = item2 {
                    self.buildCard(item: item2, itemWidth: self.getSmallItemWidth())
                }
                Spacer()
                if let item3 = item3 {
                    self.buildCard(item: item3, itemWidth: self.getSmallItemWidth())
                } else {
                    Spacer(minLength: self.getSmallItemWidth())
                }
            }
        }
    }

    private func buildCard(item: ProductCategoryCardsRow.Item, itemWidth: CGFloat) -> some View {
        Button(action: {
            self.onSelectCategory(item)
        }, label: {
            CardView(
                viewModel: .init(
                    id: item.id,
                    imageSource: item.imageURL.flatMap { ImageSource.url($0) } ?? .styledImage(identifier: ""),
                    title: item.title),
                width: itemWidth
            )
        }).buttonStyle(PlainButtonStyle())
    }

    private func getSmallItemWidth() -> CGFloat {
        return ((self.geoWidth - self.cardSpacingWidth * 2) / 3)
    }

    private func getMediumItemWidth() -> CGFloat {
        return self.getSmallItemWidth() * 2 + self.cardSpacingWidth
    }
}
