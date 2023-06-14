// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct ProductCatagoryViewedEvent: EventType {
    let categoryId: String?

    func name(for provider: ProviderType) -> String? {
        return "categoryScreenViewed"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        if let categoryId = self.categoryId {
            return ["categoryId": categoryId]
        }
        return nil
    }
}

struct SearchProductViewedEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "searchProductScreenViewed"
    }
}

struct ProductListViewedEvent: EventType {
    let productListId: String?

    func name(for provider: ProviderType) -> String? {
        return "productListScreenViewed"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["productListId": self.productListId]
    }
}

struct ProductDetailsViewedEvent: EventType {
    let productId: String

    func name(for provider: ProviderType) -> String? {
        return "productDetailsScreenViewed"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["productId": self.productId]
    }
}

struct SimilarProductsViewedEvent: EventType {
    let productId: String

    func name(for provider: ProviderType) -> String? {
        return "similarProductsScreenViewed"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["productId": self.productId]
    }
}
