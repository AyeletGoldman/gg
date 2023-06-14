// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The display options for product list
public enum ProductListDisplayMode {

    /// A product list that is based on a product category
    case productCategory(productCategory: ProductCategory?)

    /// A product list that is based on similar products to a given product
    case similarProducts(productId: String)

    /// A product list that is based on a global search text and filters
    case globalSearch

}
