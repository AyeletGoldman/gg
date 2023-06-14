/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get one to one consultation links for given ids
/// @description Get one to one consultation links for given ids
struct GetConsultationV2ConsultationConnectLinksExternalIds: TargetType {
    ///Ids for which the links were created.
    let externalIds: [String]

    init(externalIds: [String]) {
        self.externalIds = externalIds
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/consultation/v2/consultation/connectLinks/{externalIds}"
        let formatter = PathFormatter()
        let externalIdsSafe = formatter.format(value: self.externalIds)
        path = path.replacingOccurrences(of: "{externalIds}", with: externalIdsSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/consultation/v2/consultation/connectLinks/{externalIds}").url
    }
}

extension GetConsultationV2ConsultationConnectLinksExternalIds: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

