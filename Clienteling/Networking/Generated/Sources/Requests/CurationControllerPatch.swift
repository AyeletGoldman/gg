/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Update a single field of a curation by its id.
struct CurationControllerPatch: TargetType {
    ///Curation ID to update curation information
    let curationId: String
    let patchCurationBody: PatchCurationBody

    init(curationId: String, patchCurationBody: PatchCurationBody) {
        self.curationId = curationId
        self.patchCurationBody = patchCurationBody
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
        return .patch
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.patchCurationBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerPatch").url
    }
}

extension CurationControllerPatch: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

