// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public struct DeliveryCreateOrderRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "DeliveryCreateOrderRouteDescriptor"

    /// The initial delivery method value to be selected, if any. This ID must match the ID of one of the `availableDeliveryMethods` property.
    public let selectedDeliveryMethodId: String?
    /// The list of available delivery methods.
    public let availableDeliveryMethods: [SelectionListItem]
    /// The title of the scene. Usually shown in the navigation bar.
    public let title: String
    /// The title of the done button.
    public let doneButtonTitle: String
    /// A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public let onClose: (UIViewController) -> Void
    /// A closure to invoke with the newly selected delivery methos.
    public let onDone: (UIViewController, String?) -> Void

    /// Creates a new `DeliveryCreateOrderRouteDescriptor`
    /// - Parameters:
    ///   - selectedDeliveryMethodId: _optional_ The initial delivery method value to be selected, if any.
    ///   - availableDeliveryMethods: The list of available delivery methods.
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - doneButtonTitle: The title of the done button.
    ///   - onClose: A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    ///   - onDone: A closure to invoke with the newly selected delivery methos.
    public init(selectedDeliveryMethodId: String?,
                availableDeliveryMethods: [SelectionListItem],
                title: String,
                doneButtonTitle: String,
                onClose: @escaping (UIViewController) -> Void,
                onDone: @escaping (UIViewController, String?) -> Void) {
        self.selectedDeliveryMethodId = selectedDeliveryMethodId
        self.availableDeliveryMethods = availableDeliveryMethods
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onClose = onClose
        self.onDone = onDone
    }
}
