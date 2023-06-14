// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used for presenting the find similar products view
    /// - Parameters:
    ///   - productId: the product ID to use to search for similar products
    ///   - shouldPresentFiltersAutomatically: Whether or not the filters menu should be presented when opening the similar products screen
    /// - Returns: an instance of `MenuAction` that will return the action for presenting the find similar products view
    static func findSimilarProductsMenuAction(productId: String, shouldPresentFiltersAutomatically: Bool = true) -> MenuAction {
        let title = MKLocalizedString("product-details.actions.menu.similar-products",
                                      comment: "The title of the similar products action in the product actions")
        return self.findSimilarProductsAction(productId: productId,
                                              title: title,
                                              shouldPresentFiltersAutomatically: shouldPresentFiltersAutomatically,
                                              iconIdentifier: Self.buildIdentifier(withToken: "icon-search"))
    }
}

public extension ContextualAction {
    /// Creates a new `ContextualAction` that will be used for presenting the find similar products view
    /// - Parameters:
    ///   - productId: the product ID to use to search for similar products
    ///   - shouldPresentFiltersAutomatically: Whether or not the filters menu should be presented when opening the similar products screen
    /// - Returns: an instance of `ContextualAction` that will return the action for presenting the find similar products view
    static func secondaryFindSimilarProductsAction(productId: String, shouldPresentFiltersAutomatically: Bool = true) -> ContextualAction {
        let title = MKLocalizedString("product-details.actions.similar-products",
                                      comment: "The title of the similar products action in the product actions")
        return self.findSimilarProductsAction(productId: productId,
                                              title: title,
                                              shouldPresentFiltersAutomatically: shouldPresentFiltersAutomatically)
    }
}

private extension MenuAction {
    static func findSimilarProductsAction(productId: String,
                                          title: String,
                                          shouldPresentFiltersAutomatically: Bool,
                                          iconIdentifier: StylistIdentifier = "icon-search") -> MenuAction {
        return MenuAction(
            localizedTitle: title,
            imageIdentifier: iconIdentifier,
            preferredPresentationStyle: .push,
            routeDescriptorFactory: { _ in
                return SimilarProductsRouteDescriptor(productId: productId, shouldPresentFiltersAutomatically: shouldPresentFiltersAutomatically)
            })
    }
}
