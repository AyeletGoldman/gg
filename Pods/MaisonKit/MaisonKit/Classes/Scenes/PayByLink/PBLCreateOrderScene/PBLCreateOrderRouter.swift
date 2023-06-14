// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// The router for the PBLCreateOrderViewController
public protocol PBLCreateOrderRouter {

    /// Presents the devliery methods avaialble to the user for the order they are trying to send
    /// - Parameters:
    ///   - deliveryMethods: The available delivery methods that will be shown for the user to select one from
    ///   - selectedDeliveryMethodId: optional. A delivery method ID that should be selected by default when the scene is shown.
    ///   - onDone: a closure to invoke when the user has finished selecting a delivery method.
    ///   The parameter passed to this closure is the selected delivery method's ID.
    func presentDeliveryMethods(deliveryMethods: [SelectionListItem],
                                selectedDeliveryMethodId: String?,
                                onDone: @escaping (String?) -> Void)

    /// Presents the view controller created from the scene returned by the `searchClientListScene` scene registry.
    /// - Parameters:
    ///   - onSelectedClient: a closure to invoke with the newly-selected client
    func presentClientSearch(onSelectedClient: @escaping (SelectedClient?) -> Void)

    /// Presents the confirmation screen for a given order
    /// - Parameter orderId: the ID of the order to show the confirmation for
    /// - Parameter onClose: Executed on share completion
    func presentOrderDetailsPage(orderId: String, onClose: (() -> Void)?)

    /// Presents the attribute selection scene for a given product ID
    /// - Parameter productId: the product ID to present the attribute selection for
    /// - Parameter initiallySelectedAttributes: the list of attributes that are selected and show be pre-populated
    /// - Parameter onDone: A closure that takes a `String` (the newly-selected product ID) to be invoked when the user has finished selecting attributes.
    func presentAttributeSelection(for productId: String, initiallySelectedAttributes: SelectedProductAttributes, onDone: @escaping (String) -> Void)
}

/// Default implementation of the `PBLCreateOrderRouter`
final class DefaultPBLCreateOrderRouter: Router<PBLCreateOrderViewController>, PBLCreateOrderRouter {

    private enum Labels {
        static let deliveryMethodsTitle = MKLocalizedString("pay-by-link.delivery-methods.navigationBar.title",
                                                            comment: "The title for the delivery methods navigation bar when accessed from the pay by link form")
        static let deliveryMethodsDoneTitle = MKLocalizedString("pay-by-link.delivery-methods.navigationBar.button.done",
                                                                comment: "The done button title for choosing delivery methods when accessed from the pay by link form")
        static let selectClientsTitle = MKLocalizedString("pay-by-link.clients.search.form.navigationBar.title",
                                                          comment: "The title for the client search navigation bar when accessed from the pay by link form")
    }

    func presentDeliveryMethods(deliveryMethods: [SelectionListItem],
                                selectedDeliveryMethodId: String?,
                                onDone: @escaping (String?) -> Void) {
        let descriptor = DeliveryCreateOrderRouteDescriptor(selectedDeliveryMethodId: selectedDeliveryMethodId,
                                                            availableDeliveryMethods: deliveryMethods,
                                                            title: Labels.deliveryMethodsTitle,
                                                            doneButtonTitle: Labels.deliveryMethodsDoneTitle,
                                                            onClose: { controller in
            controller.dismiss(animated: true, completion: nil)
        },
                                                            onDone: { controller, selectedSortValue in
            controller.dismiss(animated: true, completion: nil)
            onDone(selectedSortValue)
        })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    func presentClientSearch(onSelectedClient: @escaping (SelectedClient?) -> Void) {
        let scene = self.factory.retrieveScene(with: SelectClientRouteDescriptor(
            title: Labels.selectClientsTitle,
            stylistSection: StylistIdentifier.buildFullIdentifier(for: "products", variant: "pay-by-link"),
            onDismiss: { controller in
                controller.dismiss(animated: true, completion: nil)
            }, onDone: { controller, selectedClient in
                onSelectedClient(selectedClient)
                controller.dismiss(animated: true, completion: nil)
            }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    func presentOrderDetailsPage(orderId: String, onClose: (() -> Void)?) {
        let scene = self.factory.retrieveScene(with: PBLConfirmOrderRouteDescriptor(
            orderId: orderId,
            onClose: { controller in
                controller.dismiss(animated: true, completion: nil)
            },
            onShareCompletion: { controller in
                onClose?()
                controller.dismiss(animated: true, completion: nil)
            }))
        let controller = self.factory.createViewController(scene)
        self.presentFullScreenModally(controller)
    }

    func presentAttributeSelection(for productMasterID: String, initiallySelectedAttributes: SelectedProductAttributes, onDone: @escaping (String) -> Void) {
        let scene = self.factory.retrieveScene(with: PBLAttributeSelectionRouteDescriptor(productMasterID: productMasterID,
                                                                                          initiallySelectedAttributes: initiallySelectedAttributes,
                                                                                          onDone: { controller, productId in
            onDone(productId)
            controller.dismiss(animated: true, completion: nil)
        }, onCancel: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, detents: [.medium(), .large()])
    }
}
