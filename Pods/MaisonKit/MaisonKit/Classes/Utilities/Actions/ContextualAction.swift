// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// A representation of an action that the user can perform.
/// Contextual actions are usually used to represent acitons in ActionSheets and Menus
/// ContextualAction has a title and an action type, which can be either for presenting a scene or to perform an arbitrary action via a closure.
public struct ContextualAction {

    /// The type of action to perform. Usually this will be to either present a scene or performan arbitrary action via a closure.
    public let type: ActionType

    /// The title of the action.
    public let localizedTitle: String

    /// A stylist identifier that will load an icon to show on the action, if possible
    public let imageIdentifier: StylistIdentifier?

    /// If the action should be enabled or not.
    public let isEnabled: Bool

    /// Creates a new `ContextualAction`
    /// - Parameters:
    ///   - localizedTitle: the title to show on the UI
    ///   - imageIdentifier: a stylist identifier that will load an icon to show on the action, if possible
    ///   - preferredPresentationStyle: A preferred presentation style for the this action.
    ///     Note: Setting the preferred presentation style is not a guarantee that the action will be presented in that manner
    ///   - isEnabled: the action should be enabled or not.
    ///   - routeDescriptorFactory: a closure that will return a `RouteDescriptor`
    public init(localizedTitle: String,
                imageIdentifier: StylistIdentifier? = nil,
                preferredPresentationStyle: PresentationStyle = .push,
                isEnabled: Bool = true,
                routeDescriptorFactory: @escaping (OnDoneClosure) -> RouteDescriptor) {
        self.localizedTitle = localizedTitle
        self.type = .routeDescriptorProvider(routeDescriptorFactory: routeDescriptorFactory,
                                             preferredPresentationStyle: preferredPresentationStyle)
        self.imageIdentifier = imageIdentifier
        self.isEnabled = isEnabled
    }
}

public extension ContextualAction {

    /// Creates a new `ActionSheetAction` with the given title and action
    /// This initializer is used when we don't want to
    /// - Parameters:
    ///   - localizedTitle: the title of the action item
    ///   - imageIdentifier: a stylist identifier that will load an icon to show on the action, if possible
    ///   - isEnabled: the action should be enabled or not.
    ///   - action: an action to perform when the user taps on the action
    init(localizedTitle: String,
         imageIdentifier: StylistIdentifier? = nil,
         isEnabled: Bool = true,
         action: @escaping () -> Void) {
        self.localizedTitle = localizedTitle
        self.type = .actionExecutor(action: action)
        self.imageIdentifier = imageIdentifier
        self.isEnabled = isEnabled
    }
}

public extension ContextualAction {
    /// Creates a new `ContextualAction`
    /// - Parameters:
    ///   - localizedTitle: the title to show on the UI
    ///   - imageIdentifier: a stylist identifier that will load an icon to show on the action, if possible
    ///   - preferredPresentationStyle: A preferred presentation style for the this action.
    ///     Note: Setting the preferred presentation style is not a guarantee that the action will be presented in that manner
    ///   - isEnabled: the action should be enabled or not.
    ///   - sceneFactory: a closure that will return a `Scene`
    init<S: Scene>(localizedTitle: String,
                   imageIdentifier: StylistIdentifier? = nil,
                   preferredPresentationStyle: PresentationStyle = .push,
                   isEnabled: Bool = true,
                   sceneFactory: @escaping (OnDoneClosure) -> S) {
        self.localizedTitle = localizedTitle
        self.type = .sceneProvider(sceneFactory: { return AnyScene(scene: sceneFactory($0)) },
                                   preferredPresentationStyle: preferredPresentationStyle)
        self.imageIdentifier = imageIdentifier
        self.isEnabled = isEnabled
    }
}
