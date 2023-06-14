// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A set of properties that MaisonKit requests from the host application to send with events
public enum AnalyticsSegment: CaseIterable {
    /// The name of the maison using MaisonKit
    case maison
    /// The industry for this maison
    case industry

    var name: String {
        switch self {
        case .industry:
            return "industry"
        case .maison:
            return "maison"
        }
    }
}

/// A property that will be sent with each event once it is set
public struct AnalyticsLifetimeProperty {
    /// The name of the property
    public var name: String
    /// The value of the property
    public var value: String
}

/// A provider of analytics for the analytics defined in the app
public protocol ProviderType {

    /// Logs an event with a name and a set of parameters
    /// - Parameters:
    ///   - eventName: the name of the event to log
    ///   - parameters: optional. A dictionary of parameters to log.
    func log(_ eventName: String, parameters: [String: Any]?)

    /// Logs an event with a name
    /// - Parameter eventName: the name of the event to log
    func log(_ eventName: String)

    /// Asks the provider for a value for each of the lifetime properties that are used for reporting
    /// - Parameter segment: the segment to get the analytics for
    /// - Returns: a `String` value that represents the value for the given segment
    func valueForSegment(_ segment: AnalyticsSegment) -> String?

    /// Gives the ProviderType a chance to set up each of the lifetime properties that are used for reporting
    /// - Parameter property: the lifetime property that should be set up in the analytics provider
    func setupLifetimePropertyTracking(_ property: AnalyticsLifetimeProperty)
}

extension ProviderType {
    // Default implementation of the `log` method with no parameters
    public func log(_ eventName: String) {
        self.log(eventName, parameters: nil)
    }
}

/// A protocol events should conform to. Events will usually be enums with associated values
/// if defined by the maisons, or a struct if defined in this library. We use a struct for backwards compatibility.
public protocol EventType {

    /// Retrieves the name of the event for the given provider
    /// - Parameter provider: a provider for logging events
    /// - Returns: an optional `String` that represents the name of the event
    func name(for provider: ProviderType) -> String?

    /// Returns the parameters for a given provider.
    /// - Parameter provider: a provider for logging events
    /// - Returns: an optional dictionary of parameters to be logged with the event.
    func parameters(for provider: ProviderType) -> [String: Any]?
}

public extension EventType {

    /// Default implmenetation of the parameters function that returns `nil`
    /// - Parameter provider: the provider that will receive the event
    /// - Returns: `nil` by default.
    func parameters(for provider: ProviderType) -> [String: Any]? {
        return nil
    }
}

/// The default implementation of the AnalyticsType.
/// Holds a set of analytics providers registered via `register` and iterates
/// through them when logging a new event via `log`.
public class Analytics {
    private static var providers: [ProviderType] = []

    /// Registers a new provider with the analytics framework
    /// - Parameter provider: the provider to register
    public static func register(provider: ProviderType) {
        self.providers.append(provider)
        AnalyticsSegment.allCases
            .compactMap { segment -> (AnalyticsSegment, String)? in
                guard let value = provider.valueForSegment(segment) else {
                    return nil
                }
                return (segment, value)
            }
            .forEach { segment, value in
                provider.setupLifetimePropertyTracking(AnalyticsLifetimeProperty(name: segment.name,
                                                                                 value: value))
            }
    }

    /// Logs the given event to all providers in the array `providers`.
    /// - Parameter event: the event to log
    public static func log(_ event: EventType) {
        for provider in self.providers {
            guard let eventName = event.name(for: provider) else { continue }
            let parameters = event.parameters(for: provider)
            provider.log(eventName, parameters: parameters)
        }
    }
}
