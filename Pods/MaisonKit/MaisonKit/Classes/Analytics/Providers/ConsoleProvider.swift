// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// An analytics `ProviderType` that prints out to the console only in debug mode.
public struct ConsoleProvider: ProviderType {
    /// Initializes the ConsoleProvider
    public init() { }

    // Logs the event name and parameters to the console if the app is running in DEBUG mode.
    public func log(_ eventName: String, parameters: [String: Any]? = nil) {
        #if DEBUG
        print("Analytics event: \(eventName) received with parameters: \(parameters ?? [:])")
        #endif
    }

    public func valueForSegment(_ segment: AnalyticsSegment) -> String? {
        return nil
    }

    public func setupLifetimePropertyTracking(_ property: AnalyticsLifetimeProperty) {
        // NO-OP
    }
}
