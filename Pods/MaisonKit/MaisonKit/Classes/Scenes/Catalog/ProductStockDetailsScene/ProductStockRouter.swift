//  Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

public protocol ProductStockRouter {
    /// Presents the product attributes scene
    /// - Parameters:
    ///   - masterId: The product's master ID for which to fetch available attributes
    ///   - attribute: The selected attribute to display the selection for
    ///   - otherSelectedAttributes: The list of attributes that already have values selected
    ///   - initiallySelectedItemID: Optional. An initially-selected value (the ID) for the attribute
    ///   - onDone: A closure to invoke when the user taps the done button
    func presentProductAttributes(masterId: String,
                                  attribute: ProductAttributes.Attribute,
                                  otherSelectedAttributes: SelectedProductAttributes,
                                  initiallySelectedItemID: String?,
                                  onDone: @escaping (ProductAttributeItem.ID?) -> Void)
}

final class DefaultProductStockRouter: Router<ProductStockViewController>, ProductStockRouter {

    func presentProductAttributes(masterId: String,
                                  attribute: ProductAttributes.Attribute,
                                  otherSelectedAttributes: SelectedProductAttributes,
                                  initiallySelectedItemID: String?,
                                  onDone: @escaping (ProductAttributeItem.ID?) -> Void) {
        let descriptor = ProductAttributeSelectionRouteDescriptor(masterId: masterId,
                                                                  attribute: attribute,
                                                                  otherSelectedAttributes: otherSelectedAttributes,
                                                                  initiallySelectedItemID: initiallySelectedItemID,
                                                                  shouldShowToolbar: false,
                                                                  onCancel: { controller in
            controller.dismiss(animated: true, completion: nil)
        }, onDone: { newAttributeId, controller in
            onDone(newAttributeId)
            controller.dismiss(animated: true, completion: nil)
        }, onSelectedAttributeRemoved: nil)
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
