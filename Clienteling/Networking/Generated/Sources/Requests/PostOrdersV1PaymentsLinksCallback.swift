/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Process payment service provider payment response
/// @description Process the response of the payment service provider (PSP) regarding a payment.
/// The process might include updating an Order Management System (OMS) and notifying clients about the status of the payment.
/// ```
struct PostOrdersV1PaymentsLinksCallback: TargetType {
    ///**(ADYEN v67)** The webhook's body structure. This is being designed by the payment service provider.
    let paymentNotificationWebhookBody: PaymentNotificationWebhookBody?

    init(paymentNotificationWebhookBody: PaymentNotificationWebhookBody?) {
        self.paymentNotificationWebhookBody = paymentNotificationWebhookBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/orders/v1/payments/links/callback"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.paymentNotificationWebhookBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Post/orders/v1/payments/links/callback").url
    }
}

extension PostOrdersV1PaymentsLinksCallback: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

