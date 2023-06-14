/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create an interaction.
/// @description Create an interaction.
struct InteractionsControllerCreate: TargetType {
    let body: CreateInteractionV2

    init(body: CreateInteractionV2) {
        self.body = body
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/outreach/v2/interactions"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.body, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("InteractionsControllerCreate").url
    }
}

extension InteractionsControllerCreate: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

