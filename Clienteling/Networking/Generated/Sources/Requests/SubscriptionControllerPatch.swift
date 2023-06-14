/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Update some fields of current user subscription.
/// @description Update some fields of current user subscription. The subscription is created for current user if none exists.
struct SubscriptionControllerPatch: TargetType {
    let patchSubscriptionBody: PatchSubscriptionBody

    init(patchSubscriptionBody: PatchSubscriptionBody) {
        self.patchSubscriptionBody = patchSubscriptionBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/notifications/v1/subscriptions"
    }

    var method: Moya.Method {
        return .patch
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.patchSubscriptionBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("SubscriptionControllerPatch").url
    }
}

extension SubscriptionControllerPatch: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

