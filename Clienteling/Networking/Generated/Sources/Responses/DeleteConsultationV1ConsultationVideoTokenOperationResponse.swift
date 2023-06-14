/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum DeleteConsultationV1ConsultationVideoTokenResponses {
    case status204(Void)
    case unauthorizedError(JSON)
    case notFoundError(JSON)
}

extension Publisher where Output == DeleteConsultationV1ConsultationVideoTokenResponses {
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
