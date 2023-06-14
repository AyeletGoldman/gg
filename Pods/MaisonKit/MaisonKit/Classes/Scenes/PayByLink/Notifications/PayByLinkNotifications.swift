// Copyright © 2021 LVMH. All rights reserved.

import Foundation

@objc final class PayByLinkNotificationsRegister: NSObject, NotificationsRegistering {
    static func registerNotificationsHandler() {
        if Features.manager.isEnabled(.payByLink, defaultValue: true) {
            InboundItemHandler.default.register(PayByLinkNotificationHandler())
        }
    }
}
