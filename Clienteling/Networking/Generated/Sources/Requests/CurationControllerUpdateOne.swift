/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Update a curation by Curation id.
struct CurationControllerUpdateOne: TargetType {
    ///Curation ID to update curation information
    let curationId: String
    let createOrUpdateCurationBody: CreateOrUpdateCurationBody

    init(curationId: String, createOrUpdateCurationBody: CreateOrUpdateCurationBody) {
        self.curationId = curationId
        self.createOrUpdateCurationBody = createOrUpdateCurationBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/curations/v1/curations/{curationId}"
        let formatter = PathFormatter()
        let curationIdSafe = formatter.format(value: self.curationId)
        path = path.replacingOccurrences(of: "{curationId}", with: curationIdSafe)
        return path
    }

    var method: Moya.Method {
        return .put
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.createOrUpdateCurationBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerUpdateOne").url
    }
}

extension CurationControllerUpdateOne: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

