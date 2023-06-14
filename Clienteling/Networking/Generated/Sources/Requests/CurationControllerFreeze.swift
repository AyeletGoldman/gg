/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Mark a curation a read only.
struct CurationControllerFreeze: TargetType {
    ///Curation ID to freeze
    let curationId: String

    init(curationId: String) {
        self.curationId = curationId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/curations/v1/curations/{curationId}/freeze"
        let formatter = PathFormatter()
        let curationIdSafe = formatter.format(value: self.curationId)
        path = path.replacingOccurrences(of: "{curationId}", with: curationIdSafe)
        return path
    }

    var method: Moya.Method {
        return .put
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerFreeze").url
    }
}

extension CurationControllerFreeze: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

