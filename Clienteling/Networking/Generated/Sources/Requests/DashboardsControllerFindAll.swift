/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Return dashboard information, by user ID.
/// @description Get dashboards by user Id.
struct DashboardsControllerFindAll: TargetType {
    ///The user ID to get data of
    let userId: String
    ///Filtering preferences. The following example will be translated to `filters[key]=value,value2...`
    /// 
    /// ```
    /// {
    ///   "key": ["value1", "value2", ...]
    /// }
    /// ```
    let filters: JSON?

    init(userId: String, filters: JSON?) {
        self.userId = userId
        self.filters = filters
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/dashboards/v1/v1/dashboards/{userId}"
        let formatter = PathFormatter()
        let userIdSafe = formatter.format(value: self.userId)
        path = path.replacingOccurrences(of: "{userId}", with: userIdSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.filters,
                            forKey: "filters",
                            explode: true,
                            isDeepObject: true)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("DashboardsControllerFindAll").url
    }
}

extension DashboardsControllerFindAll: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

