/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get the device tokens of an advisor.
/// @description Get the device tokens of an advisor. By default, returns the device tokens of the connected user. If `advisorId` query parameter is supplied, returns his device tokens.
struct GetNotificationsRegistrationsTokens: TargetType {
    ///The ID of the advisor you'd like to receive device tokens for, instead of the connected user.
    let advisorId: String?

    init(advisorId: String?) {
        self.advisorId = advisorId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/users/v1/users/notifications/registrations"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.advisorId,
                            forKey: "advisorId",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("GetNotificationsRegistrationsTokens").url
    }
}

extension GetNotificationsRegistrationsTokens: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

