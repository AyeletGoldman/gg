/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Redirect to the full link from given link id.
/// @description Redirect to the full link from given link id.
struct UrlControllerRedirect: TargetType {
    ///Unique link Id
    let q: String

    init(q: String) {
        self.q = q
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/clients/v1/dcm"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.q,
                            forKey: "q",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("UrlControllerRedirect").url
    }
}

extension UrlControllerRedirect: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

