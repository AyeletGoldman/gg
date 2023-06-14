//  Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// Router for product attribute selection in pay by link.
public protocol PBLAttributeSelectionRouter {

    // swiftlint:disable function_parameter_count
    /// Presents the product attributes scene
    /// - Parameters:
    ///   - masterId: The product's master ID for which to fetch available attributes
    ///   - attribute: The attribute we are using to select
    ///   - otherSelectedAttributes: A set of other selected attributes for this product
    ///   - initiallySelectedItemID: Optional. An initially-selected value (the ID) for the attribute
    ///   - onUpdate: A closure to invoke every time the value selected changes.
    ///   - onSelectedAttributeRemoved: A closure to invoke if the user dismisses a previously-selected attribute.
    func presentProductAttributes(masterId: String,
                                  attribute: ProductAttributes.Attribute,
                                  otherSelectedAttributes: SelectedProductAttributes,
                                  initiallySelectedItemID: String?,
                                  onUpdate: @escaping (ProductAttributeItem.ID?) -> Void,
                                  onSelectedAttributeRemoved: @escaping ((ProductAttributes.Attribute.ID) -> Void))
    // swiftlint:enable function_parameter_count
}

final class DefaultPBLAttributeSelectionRouter: Router<PBLAttributeSelectionViewController>, PBLAttributeSelectionRouter {

    // swiftlint:disable function_parameter_count
    func presentProductAttributes(masterId: String,
                                  attribute: ProductAttributes.Attribute,
                                  otherSelectedAttributes: SelectedProductAttributes,
                                  initiallySelectedItemID: String?,
                                  onUpdate: @escaping (ProductAttributeItem.ID?) -> Void,
                                  onSelectedAttributeRemoved: @escaping ((ProductAttributes.Attribute.ID) -> Void)) {
        let scene = self.factory.retrieveScene(with: ProductAttributeSelectionRouteDescriptor(masterId: masterId,
                                                                                              attribute: attribute,
                                                                                              otherSelectedAttributes: otherSelectedAttributes,
                                                                                              initiallySelectedItemID: initiallySelectedItemID,
                                                                                              onSelectedAttributeRemoved: onSelectedAttributeRemoved,
                                                                                              onUpdate: onUpdate))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
    // swiftlint:enable function_parameter_count

}
