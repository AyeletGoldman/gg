/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get current user subscription.
/// @description Get current user subscription.
struct SubscriptionControllerFind: TargetType {

    init() {
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/notifications/v1/subscriptions"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("SubscriptionControllerFind").url
    }
}

extension SubscriptionControllerFind: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

