/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Update link for a one to one consultation.
/// @description Update a link for a one to one consultation within Bambuser.
struct PutConsultationV2ConsultationConnectLinksExternalId: TargetType {
    ///Id for which the link has been created.
    let externalId: String
    let updateConnectLinkBody: UpdateConnectLinkBody

    init(externalId: String, updateConnectLinkBody: UpdateConnectLinkBody) {
        self.externalId = externalId
        self.updateConnectLinkBody = updateConnectLinkBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/consultation/v2/consultation/connectLinks/{externalId}"
        let formatter = PathFormatter()
        let externalIdSafe = formatter.format(value: self.externalId)
        path = path.replacingOccurrences(of: "{externalId}", with: externalIdSafe)
        return path
    }

    var method: Moya.Method {
        return .put
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.updateConnectLinkBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Put/consultation/v2/consultation/connectLinks/{externalId}").url
    }
}

extension PutConsultationV2ConsultationConnectLinksExternalId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

