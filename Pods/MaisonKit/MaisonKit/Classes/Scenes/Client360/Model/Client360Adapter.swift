// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// An adapter for client details related actions.
public protocol Client360Adapter {

    /// Requests the header information for a given client ID
    /// - Parameter clientId: the ID of the client for which the header information is requested
    /// - Returns: a publisher that, on success, will return a result containing either the a `Client360Displayable.Header` or an error.
    func getClientHeader(clientId: String) -> AnyPublisher<Result<Client360Displayable.Header, ErrorDisplayable>, Error>

    /// Requests the timeline information for a given client ID
    /// - Parameter clientId: the ID of the client for which the timeline information is requested
    /// - Returns: a publisher that, on success, will return a result containing either a `TimelineDisplayable` or an error.
    func getTimeline(clientId: String) -> AnyPublisher<Result<TimelineDisplayable, ErrorDisplayable>, Error>

    /// Requests available timeline actions for a given client ID
    /// - Parameter clientId: the ID of the client for which the timeline actions are requested
    /// - Returns: a publisher that, on success, will return a result containing either the array of actions for this client screen (`[ContextualAction]`) or an error.
    func getAvailableTimelineActions(clientId: String) -> AnyPublisher<Result<[ContextualAction], ErrorDisplayable>, Error>

    /// Requests KPI information for a given client ID
    /// - Parameter clientId: the ID of the client for which the KPI information is requested
    /// - Returns: a publisher that, on success, will return a result containing either a `Client360Displayable.KPI` or an error.
    func getKpi(clientId: String) -> AnyPublisher<Result<Client360Displayable.KPI, ErrorDisplayable>, Error>

    /// Requests client details for a given client ID
    /// - Parameter clientId: the ID of the client for which the details are requested
    /// - Returns: a publisher that, on success, will return a result containing either a `Client360Displayable.Details` or an error.
    func getClientDetails(clientId: String) -> AnyPublisher<Result<Client360Displayable.Details, ErrorDisplayable>, Error>

    /// Requests notes for a given client ID
    /// - Parameter clientId: the ID of the client for which the notes are requested
    /// - Returns: a publisher that, on success, will return a result containing either a `Client360Displayable.Notes` or an error.
    func getNotes(clientId: String) -> AnyPublisher<Result<Client360Displayable.Notes, ErrorDisplayable>, Error>

    /// Requests preferences for a given client ID
    /// - Parameter clientId: the ID of the client for which the preferences are requested
    /// - Returns: a publisher that, on success, will return a result containing either a `Client360Displayable.Preferences` or an error.
    func getPreferences(clientId: String) -> AnyPublisher<Result<Client360Displayable.Preferences, ErrorDisplayable>, Error>

    /// Requests the actions to be displayed in the top-right corner of the client 360 view
    /// - Parameter clientId: the ID of the client for which the actions will be shown
    /// - Returns: a publisher that, on success, will return a result containing either the array of actions for the navigation bar in the client's screen or an error.
    func getClientNavigationActions(clientId: String) -> AnyPublisher<[MenuAction], Never>

    /// Requests the host application for a boolean indicating whether or not the given client ID is contactable via outreach
    /// - Parameter clientID: the ID of the client that we want to know if they are contactable or not
    /// - Returns: A publisher that will return whether or not a user is contactable
    func getClientIsContactable(clientID: String) -> AnyPublisher<Bool, Error>

    /// Requests to confirm or deny an interaction item in the timeline
    /// - Parameters:
    ///   - interactionID: the ID of the interaction
    ///   - action: the action type to perform on the interaction
    /// - Returns: A publisher to perform the action
    func confirmTimelineItem(interactionID: String, action: TimelineEntryConfirmationAction) -> VoidResultPublisher
}
