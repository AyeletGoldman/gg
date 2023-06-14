// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// The necessary data to continue to the full outreach flow
public struct OutreachFlowContainer {
    /// The client's ID to share the outreach with
    public let clientID: String
    /// A list of assets to share
    public let assets: [URL]
    /// A closure for getting the outreach templates the user can use
    public let getTemplatesMethod: GetTemplatesMethod
    /// A closure for creating an interaction when the sharing has finished successfully
    public let createInteraction: (OutreachInteractionCreation) -> VoidResultPublisher

    /// Creates a new `OutreachFlowContainer`
    /// - Parameters:
    ///   - clientID: The client's ID to share the outreach with
    ///   - assets: A list of assets to share
    ///   - getTemplatesMethod: A closure for getting the outreach templates the user can use
    ///   - createInteraction: A closure for creating an interaction when the sharing has finished successfully
    public init(clientID: String,
                assets: [URL],
                getTemplatesMethod: @escaping GetTemplatesMethod,
                createInteraction: @escaping (OutreachInteractionCreation) -> VoidResultPublisher) {
        self.clientID = clientID
        self.assets = assets
        self.getTemplatesMethod = getTemplatesMethod
        self.createInteraction = createInteraction
    }
}

/// A closure that returns a publisher that will eventually either return an `OutreachDisplayable` or error
public typealias GetOutreachActionsMethod = () -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error>

/// A route descriptor for a scene that will present a scene for a user to select an outreach channel and recipient (e.g. channel and number/email/username).
public struct OutreachSelectionRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "OutreachSelectionRouteDescriptor"

    /// A closure invoked to get the publisher that will return the result of retrieving the outreach
    /// This is a closure to allow different implementations of outreach interactions like from pay-by-link or product share
    /// where the constraints on the actions that should be retrieved are different (for example, only return text-based interactions)
    public let getOutreachActions: GetOutreachActionsMethod
    /// A closure to invoke when the cancel button is pressed
    public let onCancel: (UIViewController) -> Void
    /// A closure to invoke when an item is selected
    public let onItemSelected: ((OutreachType, String?, UIViewController) -> Void)?
    /// The necessary data to continue to the full outreach flow
    public let outreachFlowContainer: OutreachFlowContainer?

    /// Creates a new `OutreachSelectionRouteDescriptor`
    /// - Parameters:
    ///   - getOutreachActions: A closure invoked to get the publisher that will return the result of retrieving the outreach
    ///   This is a closure to allow different implementations of outreach interactions like from pay-by-link or product share
    ///   where the constraints on the actions that should be retrieved are different (for example, only return text-based interactions)
    ///   - onCancel: A closure to invoke when the cancel button is pressed
    ///   - onItemSelected: A closure to invoke when an item is selected
    public init(getOutreachActions: @escaping GetOutreachActionsMethod,
                onCancel: @escaping (UIViewController) -> Void,
                onItemSelected: @escaping (OutreachType, String?, UIViewController) -> Void) {
        self.getOutreachActions = getOutreachActions
        self.onCancel = onCancel
        self.onItemSelected = onItemSelected
        self.outreachFlowContainer = nil
    }

    /// Creates a new `OutreachSelectionRouteDescriptor`.
    /// This constructor will cause the scene to complete the full outreach flow by pushing the next template scene after choosing the channel.
    /// - Parameters:
    ///   - getOutreachActions: A closure invoked to get the publisher that will return the result of retrieving the outreach
    ///   This is a closure to allow different implementations of outreach interactions like from pay-by-link or product share
    ///   where the constraints on the actions that should be retrieved are different (for example, only return text-based interactions)
    ///   - onCancel: A closure to invoke when the cancel button is pressed
    ///   - outreachFlowContainer: The necessary data to continue to the full outreach flow
    public init(getOutreachActions: @escaping GetOutreachActionsMethod,
                onCancel: @escaping (UIViewController) -> Void,
                outreachFlowContainer: OutreachFlowContainer) {
        self.getOutreachActions = getOutreachActions
        self.onCancel = onCancel
        self.onItemSelected = nil
        self.outreachFlowContainer = outreachFlowContainer
    }
}
