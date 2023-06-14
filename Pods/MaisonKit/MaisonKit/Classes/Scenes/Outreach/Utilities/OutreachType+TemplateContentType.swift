// Copyright © 2022 LVMH. All rights reserved.

import Foundation

extension OutreachType {
    var supportedContentTypes: [Template.ContentType] {
        switch self {
        case .call, .facetime:
            return []
        case .sms, .whatsapp, .lineWorks, .line, .wechat, .kakao:
            return [.text]
        case .email:
            return [.text, .html]
        }
    }
}
