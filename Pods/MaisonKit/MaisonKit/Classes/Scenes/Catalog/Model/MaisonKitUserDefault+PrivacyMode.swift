// Copyright © 2021 LVMH. All rights reserved.

import Foundation

private extension String {
    /// MaisonKit's user defaults privacy mode key
    static let privacyModeUserDefaultsKey = "fr.lvmh.privacyModeUserDefaultsKey"
}

extension UserDefaults {
    @objc dynamic var privacyMode: PrivacyMode {
        get {
            return self.retrieveValue(forKey: .privacyModeUserDefaultsKey) ?? .detail
        }
        set {
            self.saveValue(newValue, forKey: .privacyModeUserDefaultsKey)
        }
    }
}
