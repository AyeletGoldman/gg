/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum DashboardsControllerFindOneByDashboardIdResponses {
    case status200(IDashboardsV2JSendSuccess)
    case jSendBadRequestError(JSendFail)
    case jSendNotFoundError(JSendFail)
    case jSendInternalServerError(JSendError)
}

extension Publisher where Output == DashboardsControllerFindOneByDashboardIdResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, IDashboardsV2JSendSuccess> {
        self.tryMap { response in
            switch response {
            case .status200(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
