// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used for presenting stock details
    /// - Parameters:
    ///   - isProduct: if it's a product action. in case of a product master action the action will be disabled.
    /// - Returns: an instance of `MenuAction` that will return the action for presenting stock details.
    static func checkStockDetailsMenuAction(isProduct: Bool) -> MenuAction {
        self.checkStockDetailsAction(isProduct: isProduct, iconIdentifier: Self.buildIdentifier(withToken: "icon-store"))
    }
}

public extension ButtonAction {
    /// Creates a new `AnyButtonAction` that will be used for presenting stock details
    /// - Parameters:
    ///   - isProduct: if it's a product action. in case of a product master action the action will be disabled.
    /// - Returns: an instance of `AnyButtonAction` that will return the action for presenting stock details.
    static func primaryStockDetailsAction(isProduct: Bool) -> ButtonAction {
        return ButtonAction(action: ContextualAction.checkStockDetailsAction(isProduct: isProduct))
    }
}

private extension ContextualAction {
    static func checkStockDetailsAction(isProduct: Bool, iconIdentifier: StylistIdentifier? = nil) -> ContextualAction {
        let title = MKLocalizedString("product-details.actions.check-stock-details",
                                      comment: "The title of check stock details action in the product actions")

        let action = ContextualAction(localizedTitle: title,
                                      imageIdentifier: iconIdentifier,
                                      isEnabled: isProduct,
                                      action: {
            NotificationCenter.default.post(name: .presentStockNotification, object: nil)
        })
        return action
    }
}
