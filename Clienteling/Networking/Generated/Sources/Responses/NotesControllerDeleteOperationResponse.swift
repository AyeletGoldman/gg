/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum NotesControllerDeleteResponses {
    case status200(EmptyJSONJSendSuccess)
    case jSendBadRequestError(JSendFail)
    case unauthorizedError(JSON)
    case jSendNotFoundError(JSendFail)
    case jSendInternalServerError(JSendError)
}

extension Publisher where Output == NotesControllerDeleteResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, EmptyJSONJSendSuccess> {
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