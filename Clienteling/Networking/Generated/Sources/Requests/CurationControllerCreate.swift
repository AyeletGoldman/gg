/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create a curation.
/// @description Create a curation.
struct CurationControllerCreate: TargetType {
    let createOrUpdateCurationBody: CreateOrUpdateCurationBody

    init(createOrUpdateCurationBody: CreateOrUpdateCurationBody) {
        self.createOrUpdateCurationBody = createOrUpdateCurationBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/curations/v1/curations"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.createOrUpdateCurationBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerCreate").url
    }
}

extension CurationControllerCreate: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

