// Copyright © 2021 LVMH. All rights reserved.

import Foundation

protocol OutreachExternalAction {
    func perform(withMessage outreachMessage: OutreachMessage)
    static var isAvailable: Bool { get }
    static func openAppStoreLink()
}
