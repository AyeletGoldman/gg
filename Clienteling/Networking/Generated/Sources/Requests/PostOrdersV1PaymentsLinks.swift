/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create a payment link
/// @description Create a payment link.
struct PostOrdersV1PaymentsLinks: TargetType {
    ///Order creation body
    let paymentCreationBody: PaymentCreationBody

    init(paymentCreationBody: PaymentCreationBody) {
        self.paymentCreationBody = paymentCreationBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/orders/v1/payments/links"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.paymentCreationBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Post/orders/v1/payments/links").url
    }
}

extension PostOrdersV1PaymentsLinks: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

