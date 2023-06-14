/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get an order by id
/// @description Get an order by id. Deprecation: use `/v2/transactions/{transactionId}` instead.
struct GetOrdersV2OrdersOrderId: TargetType {
    ///Order ID
    let orderId: String

    init(orderId: String) {
        self.orderId = orderId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/orders/v2/orders/{orderId}"
        let formatter = PathFormatter()
        let orderIdSafe = formatter.format(value: self.orderId)
        path = path.replacingOccurrences(of: "{orderId}", with: orderIdSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/orders/v2/orders/{orderId}").url
    }
}

extension GetOrdersV2OrdersOrderId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

