/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get a payment link by id
/// @description Get a payment link by id.
struct GetOrdersV1PaymentsLinksLinkId: TargetType {
    ///Payment link ID
    let linkId: String

    init(linkId: String) {
        self.linkId = linkId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/orders/v1/payments/links/{linkId}"
        let formatter = PathFormatter()
        let linkIdSafe = formatter.format(value: self.linkId)
        path = path.replacingOccurrences(of: "{linkId}", with: linkIdSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/orders/v1/payments/links/{linkId}").url
    }
}

extension GetOrdersV1PaymentsLinksLinkId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

