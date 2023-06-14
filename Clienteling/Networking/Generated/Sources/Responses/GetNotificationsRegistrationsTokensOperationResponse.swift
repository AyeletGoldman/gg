/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum GetNotificationsRegistrationsTokensResponses {
    case getNotificationsRegistrationsTokens(GetNotificationsRegistrationsTokensResponse)
    case jSendBadRequestError(JSendFail)
    case unauthorizedError(JSON)
    case jSendInternalServerError(JSendError)
}

extension Publisher where Output == GetNotificationsRegistrationsTokensResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, GetNotificationsRegistrationsTokensResponse> {
        self.tryMap { response in
            switch response {
            case .getNotificationsRegistrationsTokens(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
