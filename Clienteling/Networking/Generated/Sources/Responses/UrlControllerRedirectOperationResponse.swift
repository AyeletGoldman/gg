/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Combine

enum UrlControllerRedirectResponses {
    case status302(Void)
    case jSendBadRequestError(JSendFail)
    case unauthorizedError(JSON)
    case jSendNotFoundError(JSendFail)
    case jSendInternalServerError(JSendError)
}
