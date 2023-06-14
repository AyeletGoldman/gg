// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension ProductAttributeRow where Self == NestedProductAttributeRow {

    /// Build nested list row with product attributes options
    /// - Parameter items: The attribute items
    /// - Parameter isShownInCollapsedMode: A boolean value to decide if this view should be shown in "collapsed" mode or not.
    /// - Returns: An instance of `ProductAttributeRow`
    static func nestedList(items: [ProductAttributeItem], isShownInCollapsedMode: Bool) -> ProductAttributeRow {
        return NestedProductAttributeRow(items: items, isShownInCollapsedMode: isShownInCollapsedMode)
    }
}

/// An implementation of `ProductAttributeRow` that shows the current attribute's title and the title of the selected option.
/// When tapped, the system will present a detailed list of product attribute options that can then be selected.
public struct NestedProductAttributeRow: ProductAttributeRow {

    private enum Labels {
        static let emptyAttributeItemsValueTitle = MKLocalizedString("product-details.attributes.value-no-items.title",
                                                                     comment: "The text to show for attribute value when attribute items is empty in product details")
    }

    public var items: [ProductAttributeItem]
    public var isShownInCollapsedMode: Bool

    public func makeBody(attribute: ProductAttributes.Attribute,
                         selectedAttributes: Binding<SelectedProductAttributes>,
                         presentAttributeItemsSelection: @escaping (ProductAttributes.Attribute) -> Void,
                         isLoading: Bool) -> any View {
        return NestedProductAttributeRowView(attributeTitle: attribute.title,
                                             attributeValueTitle: self.getAttributeValueTitle(attribute: attribute,
                                                                                              selectedAttributes: selectedAttributes.wrappedValue),
                                             presentAttributeItemsSelection: { presentAttributeItemsSelection(attribute) },
                                             isLoading: isLoading)
    }

    private func getAttributeValueTitle(attribute: ProductAttributes.Attribute, selectedAttributes: SelectedProductAttributes) -> String? {
        var valueTitle = selectedAttributes[attribute.id]?.title
        if valueTitle == nil, self.items.isEmpty {
            valueTitle = Labels.emptyAttributeItemsValueTitle
        }
        return valueTitle
    }
}
