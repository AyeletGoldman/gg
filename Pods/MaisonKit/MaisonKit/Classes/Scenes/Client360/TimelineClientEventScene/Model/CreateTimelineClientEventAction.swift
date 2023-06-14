// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used to display the create timeline client event scene.
    /// For using this action you need also to implement `TimelineClientEventAdapter`.
    /// - Parameters:
    ///   - clientID: The ID of the client for creating the timeline event.
    ///   - eventType: The event type for creating the timeline event. Will be in use for getting the form fields and for saving the data and for displaying the action title.
    ///   - iconIdentifier: Optional. An icon identifier to display an icon, if it is appropriate.
    /// - Returns: an instance of `MenuAction` that will return the create timeline client event scene.
    static func createTimelineClientEventAction(clientID: String,
                                                eventType: TimelineClientEventType,
                                                iconIdentifier: StylistIdentifier? = nil) -> MenuAction {
        return MenuAction(localizedTitle: eventType.title,
                          imageIdentifier: iconIdentifier,
                          preferredPresentationStyle: .modal,
                          routeDescriptorFactory: { onClose in
            return TimelineClientEventRouteDescriptor(mode: .create(clientID: clientID),
                                                      eventType: eventType,
                                                      onDismiss: { controller in
                onClose?(controller)
            })
        })
    }
}
