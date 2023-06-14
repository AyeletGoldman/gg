// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public struct TimelineClientEventRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "TimelineClientEventRouteDescriptor"

    /// The usage mode of the scene (create / edit / read).
    public let mode: TimelineClientEventSceneMode
    /// The event type this event belong to.
    public let eventType: TimelineClientEventType
    /// A closure to call when this descriptor has been presented modally and the user taps the "Cancel" button or on after saving successfully.
    public let onDismiss: ((UIViewController) -> Void)?

    /// Creates a new `TimelineClientEventRouteDescriptor`
    /// - Parameters:
    ///   - mode: The usage mode of the scene (create / edit / read).
    ///   - eventType: The event type this event belong to.
    ///   - onDismiss: A closure to call when this descriptor has been presented modally and the user taps the "Cancel" button.
    public init(mode: TimelineClientEventSceneMode,
                eventType: TimelineClientEventType,
                onDismiss: ((UIViewController) -> Void)? = nil) {
        self.mode = mode
        self.eventType = eventType
        self.onDismiss = onDismiss
    }
}
