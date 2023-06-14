// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A closure that takes a UIViewController and returns nothing
public typealias OnDoneClosure = ((UIViewController) -> Void)?

/// A representation of the available actions to be performed by a `ContextualAction`.
public enum ActionType {
    /// An action that will provide a `RouteDescriptor`.
    /// - Parameters:
    ///   - routeDescriptorFactory: Takes a closure to be invoked when the scene has finished doing its job.
    ///   - preferredPresentationStyle: A preferred presentation style for the this action.
    ///     Note: Setting the preferred presentation style is not a guarantee that the action will be presented in that manner
    case routeDescriptorProvider(routeDescriptorFactory: (OnDoneClosure) -> RouteDescriptor,
                                 preferredPresentationStyle: PresentationStyle = .push)

    /// An action that will provide a type-erased `Scene`.
    /// - Parameters:
    ///   - sceneFactory: Takes a closure to be invoked when the scene has finished doing its job.
    ///   - preferredPresentationStyle: A preferred presentation style for the this action.
    ///     Note: Setting the preferred presentation style is not a guarantee that the action will be presented in that manner
    case sceneProvider(sceneFactory: (OnDoneClosure) -> AnyScene,
                       preferredPresentationStyle: PresentationStyle = .push)

    /// An action that will perform an arbitrary closure.
    case actionExecutor(action: () -> Void)
}
