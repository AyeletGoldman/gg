// Copyright © 2022 LVMH. All rights reserved.

import MaisonKit

func getProductActions(_ productId: String) -> () -> ProductDetailsActions {
    return {
        let actions = ProductDetailsActions(
            navigationActions: [
                .checkStockDetailsMenuAction(isProduct: false),
                .findSimilarProductsMenuAction(productId: productId),
                .stockDetailsPrivacyModeAction()
            ],
            pageVerticalActions: [
                .primaryStockDetailsAction(isProduct: productId == productIdStr)
            ],
            pageHorizontalActions: [
                .findSimilarProductsMenuAction(productId: productId),
                .stockDetailsPrivacyModeAction()
            ])
        return actions
    }
}
