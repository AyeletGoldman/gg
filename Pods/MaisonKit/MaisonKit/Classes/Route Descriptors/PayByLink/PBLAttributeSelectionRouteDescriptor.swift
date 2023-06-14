//  Copyright © 2021 LVMH. All rights reserved.

/// The descriptor for the PBL attribute selection.
/// Override this descriptor to present a different scene than the default scene presented when a user is
/// selecting attributes for a product in pay by link
public struct PBLAttributeSelectionRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "PBLAttributeSelectionRouteDescriptor"

    /// The ID of the product to get the attribute selection for
    public let productMasterID: String
    /// The initially-selected list of product attributes
    public let initiallySelectedAttributes: SelectedProductAttributes
    /// A closure to invoke when the user wants to finish selecting the attributes for the product
    public let onDone: (UIViewController, String) -> Void
    /// A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public let onCancel: (UIViewController) -> Void

    public init(productMasterID: String,
                initiallySelectedAttributes: SelectedProductAttributes,
                onDone: @escaping (UIViewController, String) -> Void,
                onCancel: @escaping (UIViewController) -> Void) {
        self.productMasterID = productMasterID
        self.initiallySelectedAttributes = initiallySelectedAttributes
        self.onDone = onDone
        self.onCancel = onCancel
    }
}
