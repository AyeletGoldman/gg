/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create an order
/// @description Create an order.
struct PostOrdersV1Orders: TargetType {
    ///Order creation body
    let orderCreationBody: OrderCreationBody

    init(orderCreationBody: OrderCreationBody) {
        self.orderCreationBody = orderCreationBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/orders/v1/orders"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.orderCreationBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Post/orders/v1/orders").url
    }
}

extension PostOrdersV1Orders: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

