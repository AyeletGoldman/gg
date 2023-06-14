// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used to display the product share scene
    /// - Parameters:
    ///   - productShareData: the product data to share
    /// - Returns: an instance of `MenuAction` that will return the product share scene.
    static func productShareMenuAction(productShareData: ProductShareData) -> MenuAction {
        let title = MKLocalizedString("product-details.actions.menu.share-product",
                                      comment: "The title of the product share action in the action sheet")
        return self.productShareAction(productShareData: [productShareData],
                                       title: title,
                                       iconIdentifier: Self.buildIdentifier(withToken: "icon-share"))
    }
}

public extension ContextualAction {
    /// Creates a new `ContextualAction` that will be used to display the product share scene
    /// - Parameters:
    ///   - productShareData: the product data to share
    /// - Returns: an instance of `ContextualAction` that will return the product share scene.
    static func secondaryProductShareAction(productShareData: ProductShareData) -> ContextualAction {
        let title = MKLocalizedString("product-details.actions.share-product",
                                      comment: "The title of the product share action in the action sheet")
        return self.productShareAction(productShareData: [productShareData], title: title)
    }
}

public extension ContextualAction {

    /// Creates a new `ContextualAction` that will be used to display the product share scene
    /// - Parameters:
    ///   - productShareData: the product data to share
    ///   - title: the title of the button if it is displayed
    ///   - iconIdentifier: an icon identifier to display an icon, if it is appropriate. Defaults to `"icon-share"`
    ///   - presentationStyle: the presentation style to present the product share scene. Defaults to `.modal`.
    /// - Returns: an instance of `ContextualAction` that will return the product share scene.
    static func productShareAction(productShareData: [ProductShareData],
                                   title: String,
                                   iconIdentifier: StylistIdentifier? = "icon-share",
                                   presentationStyle: PresentationStyle = .modal) -> ContextualAction {
        return ContextualAction(localizedTitle: title,
                                imageIdentifier: iconIdentifier,
                                preferredPresentationStyle: presentationStyle,
                                routeDescriptorFactory: { onClose in
            let navBarTitle = MKLocalizedString("product-share.navigationBar.title",
                                                comment: "The title of the product share navigation bar")
            return ShareDataRouteDescriptor(title: navBarTitle,
                                            assets: productShareData.map { $0.productImageURLs }.reduce([], +),
                                            adapter: ProductShareViewModel(productIds: productShareData.map { $0.productId }),
                                            onClose: onClose)
        })
    }
}
