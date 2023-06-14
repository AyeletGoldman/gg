/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum CurationControllerUploadAssetsResponses {
    case status201(UploadAssetResponse)
    case badRequestError(JSON)
    case unauthorizedError(JSON)
    case internalServerError(JSON)
}

extension Publisher where Output == CurationControllerUploadAssetsResponses {
    func unwrapDefaultSuccessResponse() -> Publishers.TryMap<Self, UploadAssetResponse> {
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
