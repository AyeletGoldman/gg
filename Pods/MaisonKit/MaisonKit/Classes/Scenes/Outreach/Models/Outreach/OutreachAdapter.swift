// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// A protocol to conform to to be able to retrieve outreach items
public protocol OutreachAdapter {
    /// Asks the adapter to retrieve the available channels for a given client ID.
    /// - Parameter clientID: the client ID whose available channels should be fetched
    /// - Returns: a publisher that, on success, will return a result containing either the required `OutreachSelectionDisplayable` or an error.
    func getClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error>

    /// Asks the adapter to retrieve the templates available
    /// - Parameter clientId: the client ID to get the templates
    /// - Returns: a publisher that will resolve to a `Result` type with either a `TemplatesDisplayable`
    /// containing the templates to be displayed or an error to be shown to the user.
    func getTemplates(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error>

    /// Tells the adapter to create an interaction with the given interaction creation data
    /// - Parameter interaction: the data to use to create an interaction
    /// - Returns: a publisher that will resolve to a `Result` indicating whether the creation was successful or not.
    func createInteraction(interaction: OutreachInteractionCreation) -> VoidResultPublisher
}
