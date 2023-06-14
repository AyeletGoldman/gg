// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A dictionary to hold the row with the possible values items base on the product attribute ID.
public typealias ProductAttributeRows = [ProductAttributeID: ProductAttributeRow]

/// Product attribute protocol for building the attributes in the product detail
public protocol ProductAttributeRow {

    /// The attribute items
    var items: [ProductAttributeItem] { get }

    /// Whether this row is shown in collapsed mode or not. This mode is used in the product stock scene where we want to
    /// be able to allow the user to quickly check the stock information of different attributes. Some attributes are considered "primary"
    /// and should be always displayed. Others are "secondary" and should be hidden to start with. Use this value to hide the secondary
    /// attributes.
    var isShownInCollapsedMode: Bool { get }

    /// A view builder for building the row
    /// - Parameters:
    ///   - attribute: The assosiated attribute
    ///   - selectedAttributes: Binded selected attributes dictionary. an attribute ID to its selected value.
    ///   - presentAttributeItemsSelection: A closure for presenting the attribute items selection scene
    ///   - isLoading: Whether the parent view loads the attributes or not
    /// - Note: The implemented function should use `selectedAttributes` or `presentAttributeItemsSelection`.
    /// - Returns: The row view with binding the selected attributes or or using `presentAttributeItemsSelection` to change the selection.
    @ViewBuilder func makeBody(attribute: ProductAttributes.Attribute,
                               selectedAttributes: Binding<SelectedProductAttributes>,
                               presentAttributeItemsSelection: @escaping (ProductAttributes.Attribute) -> Void,
                               isLoading: Bool) -> any View
}

extension ProductAttributeRow {
    public var isShownInCollapsedMode: Bool { return true }
}
