// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// An adapter for timeline client events.
public protocol TimelineClientEventAdapter {

    /// Requests the fields for the timeline client event form. The result of this function returns a publisher that contains a dictionary of dynamic data.
    /// - Parameters:
    ///   - mode: The type of the requested fields.
    ///   - eventTypeID: The ID of the event type this event belong to.
    /// - Returns: a publisher that on success, will return a result containing either a displayable with `AnyFormDisplayable` or an error.
    func getTimelineClientEventFields(mode: TimelineClientEventSceneMode,
                                      eventTypeID: String) -> AnyPublisher<Result<TimelineClientEventDisplayable, ErrorDisplayable>, Error>

    /// Asks the implementing app to create a new timeline event.
    /// - Parameters:
    ///   - clientID: The ID of the client whose data we want to save.
    ///   - eventTypeID: The ID of the event type whose data we want to save.
    ///   - data: The data we want to save. This is a class that wraps a dictionary so that dynamic data can be used.
    /// - Returns: A publisher to notifiy when finish the saving. On success it's recommended to reload the client timeline on implementation side.
    func createTimelineClientEvent(clientID: String, eventTypeID: String, data: AnyFormData) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>

    /// Asks the implementing app to update a timeline event.
    /// - Parameters:
    ///   - eventID: The ID of the event whose data we want to save.
    ///   - eventTypeID: The ID of the event type this event belong to.
    ///   - clientID: The ID of the client this event belong to.
    ///   - data: The data we want to save. This is a class that wraps a dictionary so that dynamic data can be used.
    /// - Returns: A publisher to notifiy when finish the saving. On success it's recommended to reload the client timeline on implementation side.
    func updateTimelineClientEvent(eventID: String, eventTypeID: String, clientID: String, data: AnyFormData) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>

    /// Asks the implementing app to delete a timeline event.
    /// - Parameters:
    ///   - eventID: The ID of the event whose data we want to delete.
    ///   - eventTypeID: The ID of the event type this event belong to.
    ///   - clientID: The ID of the client this event belong to.
    /// - Returns: A publisher to notifiy when finish the deletion. On success it's recommended to reload the client timeline on implementation side.
    func deleteTimelineClientEvent(eventID: String, eventTypeID: String, clientID: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
}
