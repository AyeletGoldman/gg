// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension ProductDetailsInitialisationContext {

    var id: String {
        switch self {
        case .master(let productMasterId):
            return productMasterId
        case .product(let productId, _):
            return productId
        }
    }

    var masterId: String? {
        switch self {
        case .master(let productMasterId):
            return productMasterId
        case .product(_, let productMasterId):
            return productMasterId
        }
    }
}
