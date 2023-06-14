// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// There is one scene for timeline client event. This enum helps to define edit mode.
public enum TimelineClientEventSceneMode {
    /// Create a new timeline event item
    /// - Parameter clientID: The ID of the client for to create the even for.
    case create(clientID: String)
    /// Edit timeline event item
    /// - Parameter eventID: The ID of the event to edit.
    /// - Parameter allowDelete: Whether this event should be deletable or not.
    /// - Parameter onEditSuccess: A closure to perform after editing the event.
    /// - Parameter onDeleteSuccess: A closure to perform after deleting the event.
    case edit(eventID: String, allowDelete: Bool, onEditSuccess: () -> Void, onDeleteSuccess: () -> Void)
    /// Read timeline event item
    /// - Parameter eventID: The ID of the event to edit.
    /// - Parameter allowEdit: Whether this event should be editabled or not.
    /// - Parameter allowDelete: Whether this event should be deletable or not.
    case read(eventID: String, allowEdit: Bool, allowDelete: Bool)

    /// The initial event ID if there is one
    public var eventID: String? {
        switch self {
        case .create:
            return nil
        case .edit(let eventID, _, _, _):
            return eventID
        case .read(let eventID, _, _):
            return eventID
        }
    }

    /// Whether the form will be editable in this mode case or not
    public var isEditMode: Bool {
        switch self {
        case .create, .edit:
            return true
        case .read:
            return false
        }
    }
}
