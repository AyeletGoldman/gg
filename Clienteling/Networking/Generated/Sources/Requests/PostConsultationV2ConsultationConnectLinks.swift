/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create a new link for a one to one consultation.
/// @description Create a new link for a one to one consultation using Bambuser.
struct PostConsultationV2ConsultationConnectLinks: TargetType {
    let createConnectLinkBody: CreateConnectLinkBody

    init(createConnectLinkBody: CreateConnectLinkBody) {
        self.createConnectLinkBody = createConnectLinkBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/consultation/v2/consultation/connectLinks"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.createConnectLinkBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Post/consultation/v2/consultation/connectLinks").url
    }
}

extension PostConsultationV2ConsultationConnectLinks: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

