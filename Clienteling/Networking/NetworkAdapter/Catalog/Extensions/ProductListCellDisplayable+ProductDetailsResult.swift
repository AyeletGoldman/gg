// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import MaisonKit

extension ProductListCellDisplayable {
    init?(from: ProductsDetailsResult.ProductsDetailsResultProducts) {
        switch from {
        case .masterDetails(let details):
            guard let url = details.images.first, let imageURL = URL(string: url) else { return nil }
            let attributes = details.attributes.list.compactMap { attribute -> ProductSummaryProperty? in
                guard let value = details.attributes.values[attribute.name]?.display else { return nil }
                return ProductSummaryProperty(label: attribute.displayName, value: value)
            }
            self = .master(ProductMasterSummaryDisplayable(id: details.id,
                                                           image: .url(imageURL),
                                                           properties: Array(attributes),
                                                           subtitle: details.category.name,
                                                           price: nil,
                                                           body: nil,
                                                           title: details.name,
                                                           availability: details.availability.map { ProductAvailability($0) }))
        case .productDetails(let product):
            guard let url = product.images.first, let imageURL = URL(string: url) else { return nil }
            let attributes = product.attributes?.list.compactMap { attribute -> ProductSummaryProperty? in
                guard let value = product.attributes?.values[attribute.name]?.display else { return nil }
                return ProductSummaryProperty(label: attribute.displayName, value: value)
            }
            self = .product(ProductSummaryDisplayable(productId: product.id,
                                                      masterId: product.masterId,
                                                      sku: product.sku,
                                                      image: .url(imageURL),
                                                      properties: attributes ?? [],
                                                      subtitle: product.category.name,
                                                      price: nil,
                                                      body: nil,
                                                      title: product.name,
                                                      availability: product.availability.map { ProductAvailability($0)}))
        }
    }
}
