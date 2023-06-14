/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetOrdersV2OrdersOrderIdResponses {
    case getOrderByIdResponseV2(TransactionV2)
    case badRequestError(JSON)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
    case internalServerError(JSON)
}

extension Publisher where Output == GetOrdersV2OrdersOrderIdResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, TransactionV2> {
        self.tryMap { response in
            switch response {
            case .getOrderByIdResponseV2(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
