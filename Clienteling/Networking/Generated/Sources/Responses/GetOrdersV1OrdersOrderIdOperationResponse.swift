/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetOrdersV1OrdersOrderIdResponses {
    case getOrderByIdResponse(Order)
    case badRequestError(JSON)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
    case status500(JSON)
}

extension Publisher where Output == GetOrdersV1OrdersOrderIdResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, Order> {
        self.tryMap { response in
            switch response {
            case .getOrderByIdResponse(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
