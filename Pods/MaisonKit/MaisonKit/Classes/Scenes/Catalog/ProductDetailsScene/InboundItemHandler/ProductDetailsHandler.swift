// Copyright © 2021 LVMH. All rights reserved.

import Foundation

@objc final class ProductDetailsInboundItemRegister: NSObject, NotificationsRegistering {
    static func registerNotificationsHandler() {
        InboundItemHandler.default.register(CoreSpotlightProductDetailsItemHandler())
    }
}
