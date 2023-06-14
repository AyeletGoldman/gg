// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Logs the user out.
public func logout() {
    NotificationCenter.default.post(name: .userDidLogoutNotificationName, object: nil)
}
