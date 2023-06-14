// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import FirebaseAnalytics
import MaisonKit

final class FirebaseProvider: ProviderType {

    init() {
        #if DEBUG
        FirebaseAnalytics.Analytics.setUserProperty("true",
                                                    forName: "debug")
        #endif
    }

    func log(_ eventName: String, parameters: [String: Any]?) {
        Analytics.logEvent(eventName, parameters: parameters)
    }

    public func valueForSegment(_ segment: AnalyticsSegment) -> String? {
        switch segment {
        case .maison:
            return "lvmh"
        case .industry:
            return "watches and jewellery"
        }
    }

    public func setupLifetimePropertyTracking(_ property: AnalyticsLifetimeProperty) {
        FirebaseAnalytics.Analytics.setUserProperty(property.value,
                                                    forName: property.name)
    }
}
