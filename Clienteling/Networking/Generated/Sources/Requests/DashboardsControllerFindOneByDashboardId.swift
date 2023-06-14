/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Return dashboard information
/// @description Get dashboards by User Id, with an optional parameter for running user
struct DashboardsControllerFindOneByDashboardId: TargetType {
    ///The dashboard ID to get data of
    let userId: String
    ///The running user to get data of
    let runningUser: String?
    ///pram to detrmine if to refresh the dashboard
    let refreshDashboard: Bool?

    init(userId: String, runningUser: String?, refreshDashboard: Bool?) {
        self.userId = userId
        self.runningUser = runningUser
        self.refreshDashboard = refreshDashboard
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/dashboards/v1/dashboards/{userId}"
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
        queryEncoder.encode(self.runningUser,
                            forKey: "runningUser",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.refreshDashboard,
                            forKey: "refreshDashboard",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("DashboardsControllerFindOneByDashboardId").url
    }
}

extension DashboardsControllerFindOneByDashboardId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

