/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum CurationControllerFreezeResponses {
    case status204(Void)
    case badRequestError(JSON)
    case notFoundError(JSON)
    case internalServerError(JSON)
}

extension Publisher where Output == CurationControllerFreezeResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, Void> {
        self.tryMap { response in
            switch response {
            case .status204(let value):
                return value
            default:
                throw DefaultAPIError()
            }
        }
    }
}