// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// A router for the product details scene
public protocol ProductDetailsRouter: CuratorPresenterRouter, ActionScenePresenterRouter {

    /// Presents the stock details scene
    /// - Parameter context: The context for the product details. This informs the view model what type of product it expects to receive when it makes a request for details.
    /// - Parameter datasource: the datasource that will produce the data for the stock details scene
    func presentStockDetails(context: ProductDetailsInitialisationContext, datasource: ProductStockDatasource)

    // swiftlint:disable function_parameter_count
    /// Presents the product attributes scene
    /// - Parameters:
    ///   - masterId: The product's master ID for which to fetch available attributes
    ///   - attribute: The selected attribute to display the selection for
    ///   - otherSelectedAttributes: The list of attributes that already have values selected
    ///   - initiallySelectedItemID: Optional. An initially-selected value (the ID) for the attribute
    ///   - onDone: A closure to invoke when the user taps the done button
    ///   - onSelectedAttributeRemoved: A closure to invoke if the user dismisses a previously-selected attribute.
    func presentProductAttributes(masterId: String,
                                  attribute: ProductAttributes.Attribute,
                                  otherSelectedAttributes: SelectedProductAttributes,
                                  initiallySelectedItemID: String?,
                                  onDone: @escaping (ProductAttributeItem.ID?) -> Void,
                                  onSelectedAttributeRemoved: @escaping ((ProductAttributes.Attribute.ID) -> Void))
    // swiftlint:enable function_parameter_count

    /// Presents the similar products scene
    /// - Parameter productId: the product id for getting the similar products
    func presentSimilarProducts(_ productId: String)
}

final class DefaultProductDetailsRouter: Router<ProductDetailsViewController>, ProductDetailsRouter,
                                         DefaultCuratorPresenterRouter, DefaultActionScenePresenterRouter {
    func presentStockDetails(context: ProductDetailsInitialisationContext, datasource: ProductStockDatasource) {
        let scene = self.factory.retrieveScene(with: ProductStockRouteDescriptor(
            context: context,
            datasource: datasource,
            onDismiss: { controllerToDismiss in
                controllerToDismiss.dismiss(animated: true, completion: nil)
            }
        ))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    // swiftlint:disable function_parameter_count
    func presentProductAttributes(masterId: String,
                                  attribute: ProductAttributes.Attribute,
                                  otherSelectedAttributes: SelectedProductAttributes,
                                  initiallySelectedItemID: String?,
                                  onDone: @escaping (ProductAttributeItem.ID?) -> Void,
                                  onSelectedAttributeRemoved: @escaping ((ProductAttributes.Attribute.ID) -> Void)) {
        let descriptor = ProductAttributeSelectionRouteDescriptor(masterId: masterId,
                                                                  attribute: attribute,
                                                                  otherSelectedAttributes: otherSelectedAttributes,
                                                                  initiallySelectedItemID: initiallySelectedItemID,
                                                                  onCancel: { controller in
            controller.dismiss(animated: true, completion: nil)
        }, onDone: { newAttributeId, controller in
            onDone(newAttributeId)
            controller.dismiss(animated: true, completion: nil)
        }, onSelectedAttributeRemoved: onSelectedAttributeRemoved)
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
    // swiftlint:enable function_parameter_count

    func presentSimilarProducts(_ productId: String) {
        let descriptor = SimilarProductsRouteDescriptor(productId: productId)
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
