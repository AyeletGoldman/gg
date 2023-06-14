/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Generate a new unique link for current advisor.
/// @description Generate a new unique link for current advisor.
struct UrlControllerBuildUniqueUrl: TargetType {

    init() {
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/clients/v1/dcm/url"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("UrlControllerBuildUniqueUrl").url
    }
}

extension UrlControllerBuildUniqueUrl: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

