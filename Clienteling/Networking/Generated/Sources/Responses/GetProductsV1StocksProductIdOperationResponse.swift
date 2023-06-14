/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetProductsV1StocksProductIdResponses {
    case status200(ProductStockResult)
    case badRequestError(JSON)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
}

extension Publisher where Output == GetProductsV1StocksProductIdResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, ProductStockResult> {
        self.tryMap { response in
            switch response {
            case .status200(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
