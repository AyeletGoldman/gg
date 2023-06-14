// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension ProductAttributeRow where Self == CarouselAttributeRow {

    /// Build inline carousel row with product attributes options
    /// - Parameter items: The attribute items
    /// - Parameter isShownInCollapsedMode: A boolean value to decide if this view should be shown in "collapsed" mode or not. Defaults to `true`.
    /// - Returns: An instanse of `ProductAttributeRow`
    static func carousel(items: [ProductAttributeCarouselItem], isShownInCollapsedMode: Bool = true) -> ProductAttributeRow {
        return CarouselAttributeRow(carouselItems: items, isShownInCollapsedMode: isShownInCollapsedMode)
    }
}

/// An implementation of `ProductAttributeRow` that displays attributes with inline carousel
public struct CarouselAttributeRow: ProductAttributeRow {

    private let carouselItems: [ProductAttributeCarouselItem]

    init(carouselItems: [ProductAttributeCarouselItem], isShownInCollapsedMode: Bool = true) {
        self.carouselItems = carouselItems
        self.isShownInCollapsedMode = isShownInCollapsedMode
        self.items = carouselItems.map { ProductAttributeItem(id: $0.id, title: $0.title) }
    }

    public var items: [ProductAttributeItem]
    public var isShownInCollapsedMode: Bool

    public func makeBody(attribute: ProductAttributes.Attribute,
                         selectedAttributes: Binding<SelectedProductAttributes>,
                         presentAttributeItemsSelection: @escaping (ProductAttributes.Attribute) -> Void,
                         isLoading: Bool) -> any View {
        return ProductAttributeCarousel(attribute: attribute,
                                        items: self.carouselItems,
                                        selectedAttributes: selectedAttributes,
                                        isLoading: isLoading)
    }
}
