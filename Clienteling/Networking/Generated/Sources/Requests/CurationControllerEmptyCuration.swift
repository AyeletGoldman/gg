/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Empty products list of the given curation.
struct CurationControllerEmptyCuration: TargetType {
    ///Curation ID to empty product list
    let curationId: String

    init(curationId: String) {
        self.curationId = curationId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/curations/v1/curations/{curationId}/products"
        let formatter = PathFormatter()
        let curationIdSafe = formatter.format(value: self.curationId)
        path = path.replacingOccurrences(of: "{curationId}", with: curationIdSafe)
        return path
    }

    var method: Moya.Method {
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerEmptyCuration").url
    }
}

extension CurationControllerEmptyCuration: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

