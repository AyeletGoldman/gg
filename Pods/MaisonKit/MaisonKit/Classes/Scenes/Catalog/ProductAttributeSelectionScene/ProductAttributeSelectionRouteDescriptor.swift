// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// The route descriptor for the product attribute selection scene
public struct ProductAttributeSelectionRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductAttributeSelectionRouteDescriptor"

    /// The product's master ID for which to fetch available attributes
    public let masterId: String
    /// The attribute we are using to select
    public let attribute: ProductAttributes.Attribute
    /// A set of other selected attributes for this product
    public let otherSelectedAttributes: SelectedProductAttributes
    /// Optional. An initially-selected value (the ID) for the attribute
    public let initiallySelectedItemID: String?
    /// Optional. A closure to invoke every time the value selected changes.
    public let onUpdate: ((ProductAttributeItem.ID?) -> Void)?
    /// Optional. A closure to invoke if the user dismisses a previously-selected attribute.
    /// If you do not provide a value for this closure, the other attributes cloud view will not be shown in the default `Scene`.
    public let onSelectedAttributeRemoved: ((ProductAttributes.Attribute.ID) -> Void)?
    /// Optional. A closure to invoke when the user taps the done button. You should provide a value for this closure if you are intending to
    /// present this scene modally. If a value is provided, a `Done` button will appear on the trailing edge of the navigation bar.
    public let onDone: ((ProductAttributeItem.ID?, UIViewController) -> Void)?
    /// Optional. A closure to invoke when the user taps the cancel button. You should provide a value for this closure if you are intending to
    /// present this scene modally. If a value is provided, a `Cancel` button will appear on the leading edge of the navigation bar.
    public let onCancel: ((UIViewController) -> Void)?
    /// A boolean indicating whether or not the toolbar at the bottom of the scene should be shown
    public let shouldShowToolbar: Bool

    /// Creates a new `ProductAttributeSelectionRouteDescriptor`
    /// - Parameters:
    ///   - masterId: The product's master ID for which to fetch available attributes
    ///   - attribute: The attribute we are using to select
    ///   - otherSelectedAttributes: A set of other selected attributes for this product
    ///   - initiallySelectedItemID: Optional. An initially-selected value (the ID) for the attribute
    ///   - shouldShowToolbar: A boolean indicating whether or not the toolbar at the bottom of the scene should be shown
    ///   - onCancel: Optional. A closure to invoke when the user taps the cancel button.
    ///   You should provide a value for this closure if you are intending to present this scene modally.
    ///   If a value is provided, a `Cancel` button will appear on the leading edge of the navigation bar.
    ///   - onDone: Optional. A closure to invoke when the user taps the done button.
    ///   You should provide a value for this closure if you are intending to present this scene modally.
    ///   If a value is provided, a `Done` button will appear on the trailing edge of the navigation bar.
    ///   - onSelectedAttributeRemoved: Optional. A closure to invoke if the user dismisses a previously-selected attribute.
    ///   If you do not provide a value for this closure, the other attributes cloud view will not be shown in the default `Scene`.
    ///   - onUpdate: Optional. A closure to invoke every time the value selected changes.
    public init(masterId: String,
                attribute: ProductAttributes.Attribute,
                otherSelectedAttributes: SelectedProductAttributes,
                initiallySelectedItemID: String? = nil,
                shouldShowToolbar: Bool = true,
                onCancel: ((UIViewController) -> Void)? = nil,
                onDone: ((ProductAttributeItem.ID?, UIViewController) -> Void)? = nil,
                onSelectedAttributeRemoved: ((ProductAttributes.Attribute.ID) -> Void)?,
                onUpdate: ((ProductAttributeItem.ID?) -> Void)? = nil) {
        self.masterId = masterId
        self.attribute = attribute
        self.otherSelectedAttributes = otherSelectedAttributes
        self.initiallySelectedItemID = initiallySelectedItemID
        self.shouldShowToolbar = shouldShowToolbar
        self.onCancel = onCancel
        self.onDone = onDone
        self.onSelectedAttributeRemoved = onSelectedAttributeRemoved
        self.onUpdate = onUpdate
    }
}
