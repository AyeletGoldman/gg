/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum PostOrdersV1PaymentsLinksCallbackResponses {
    case status201(String)
    case unauthorizedError(JSON)
    case status500(String)
}

extension Publisher where Output == PostOrdersV1PaymentsLinksCallbackResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, String> {
        self.tryMap { response in
            switch response {
            case .status201(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}
