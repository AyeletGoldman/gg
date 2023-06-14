// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// A protocol to conform to to be able to retrieve outreach items
public protocol ProductShareAdapter {
    /// Asks the adapter to retrieve the available channels for a given client ID.
    /// - Parameter clientID: the client ID whose available channels should be fetched
    /// - Returns: a publisher that, on success, will return a result containing either the required `OutreachSelectionDisplayable` or an error.
    func getProductShareClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error>

    /// Asks the adapter to retrieve the templates available for given products to share and a client
    /// - Parameters:
    ///   - productIds: the IDs of products to share
    ///   - clientId: the client ID to get the templates
    /// - Returns: A publisher that will return either a result with some template data or an error
    func getTemplates(productIds: [String], clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error>

    /// Tells the adapter to create an interaction with the given interaction creation data
    /// - Parameters:
    ///   - interaction: the data to use to create an interaction
    ///   - productIds: the IDs of the shared products
    /// - Returns: A publisher that will return either a result with not data to indicate success or an error
    func createInteraction(interaction: OutreachInteractionCreation, productIds: [String]) -> VoidResultPublisher
}
