// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI
import Biodag
import Combine

/// The data required for an action that adds a product to the curator
public struct CuratorActionProduct {
    let productReference: ProductReference
    let productName: String
    let imageSource: ImageSource?

    /// Creates a new `CuratorActionProduct` instance
    /// - Parameters:
    ///   - productReference: the product reference. This is either the product ID or the master ID.
    ///   - productName: the name of the product, localized.
    ///   - imageSource: optional. The source of an image to be displayed in the UI.
    public init(productReference: ProductReference,
                productName: String,
                imageSource: ImageSource?) {
        self.productReference = productReference
        self.productName = productName
        self.imageSource = imageSource
    }
}

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used for adding a product to the curator
    /// - Parameters:
    ///   - product: the product data
    ///   - isEnabled: whether the button should be enabled or not
    /// - Returns: an instance of `MenuAction` that will return the action for adding a product to the curator.
    static func addToCuratorMenuAction(_ product: CuratorActionProduct, isEnabled: Bool = true) -> MenuAction {
        return self.addToCuratorAction(product,
                                       isEnabled: isEnabled,
                                       iconIdentifier: { Self.buildIdentifier(withToken: $0.description) })
    }
}

public extension ButtonAction {
    /// Creates a new `AnyButtonAction` that will be used for adding a product to the curator
    /// - Parameters:
    ///   - product: the product data
    ///   - isEnabled: whether the button should be enabled or not
    /// - Returns: an instance of `AnyButtonAction` that will return the action for adding a product to the curator.
    static func primaryAddToCuratorAction(_ product: CuratorActionProduct, isEnabled: Bool = true) -> ButtonAction {
        let action = ContextualAction.addToCuratorAction(product, isEnabled: isEnabled)
        return ButtonAction(buttonIdentifier: .secondary, action: action)
    }
}

private extension ContextualAction {

    typealias CuratorAction = (ProductReference,
                               @escaping () -> Void, // A closure to invoke when the action has completed
                               @escaping () -> Void // A closure to invoke when the action completes with an error
    ) -> Void

    static func addToCuratorAction(_ product: CuratorActionProduct,
                                   isEnabled: Bool,
                                   iconIdentifier: ((StylistIdentifier) -> StylistIdentifier) = { $0 }) -> ContextualAction {

        // When an action on the screen is replaced, it kills the view model.
        // Because of this, we use a Singleton so the add and remove product may finish running.
        let addToCuratorViewModel = AddToCuratorViewModel.default
        let isExistsInCurator = addToCuratorViewModel.contains(reference: product.productReference)

        if isExistsInCurator {
            let actionTitle = MKLocalizedString("product-details.actions.remove-from-curator",
                                                comment: "The title of remove from curator action in the action sheet")
            let errorTitle = MKLocalizedString("product-details.actions.remove-from-curator.error.title",
                                               comment: "The toaster error of remove from curator action in the action sheet")
            let notificationTitle = MKLocalizedString("product-details.actions.remove-from-curator.notification.title",
                                                      comment: "The title for the notification that shows a product has been removed from the curator.")

            return addToCuratorAction(product,
                                      isEnabled: isEnabled,
                                      iconIdentifier: iconIdentifier("icon-remove-cart"),
                                      actionTitle: actionTitle,
                                      errorTitle: errorTitle,
                                      notificationTitle: notificationTitle,
                                      actionPublisher: addToCuratorViewModel.removeProduct)
        } else {
            let actionTitle = MKLocalizedString("product-details.actions.add-to-curator",
                                                comment: "The title of add to curator action in the action sheet")
            let errorTitle = MKLocalizedString("product-details.actions.add-to-curator.error.title",
                                               comment: "The toaster error of add to curator action in the action sheet")
            let notificationTitle = MKLocalizedString("product-details.actions.add-to-curator.notification.title",
                                                      comment: "The title for the notification that shows a product has been added to the curator.")

            return addToCuratorAction(product,
                                      isEnabled: isEnabled,
                                      iconIdentifier: iconIdentifier("icon-add-cart"),
                                      actionTitle: actionTitle,
                                      errorTitle: errorTitle,
                                      notificationTitle: notificationTitle,
                                      actionPublisher: addToCuratorViewModel.addProduct)
        }
    }

    // swiftlint:disable:next function_parameter_count
    static func addToCuratorAction(_ product: CuratorActionProduct,
                                   isEnabled: Bool,
                                   iconIdentifier: StylistIdentifier,
                                   actionTitle: String,
                                   errorTitle: String,
                                   notificationTitle: String,
                                   actionPublisher: @escaping CuratorAction) -> ContextualAction {

        let onTapNotificationAction: ActionType = .routeDescriptorProvider(routeDescriptorFactory: {
            return ProductCuratorRouteDescriptor(onClose: $0 ?? { _ in })
        })

        let action = MenuAction(localizedTitle: actionTitle,
                                imageIdentifier: iconIdentifier,
                                isEnabled: isEnabled,
                                action: {
            // A subject for the title of the toast view
            let subject = CurrentValueSubject<String, Never>(MKLocalizedString("product-details.actions.add-to-curator.loading",
                                                                               comment: "The loading message to show when we're adding a product to the curator"))
            // A subject to close the toast view after the action has completed
            let closeSubject = PassthroughSubject<DispatchTime, Never>()
            let onSuccess = {
                // Change the notification title
                subject.send(String(format: notificationTitle, product.productName))
                // Dismiss the notification 3 seconds later
                closeSubject.send(.now() + 3)
            }
            let onError = {
                // Dismiss the notification now
                closeSubject.send(.now())
                // Show a toast with the error
                ToastView.show(text: errorTitle, style: .error)
            }
            // Perform the action
            actionPublisher(product.productReference, onSuccess, onError)

            ToastView.show(subject: subject,
                           imageSource: product.imageSource,
                           onTap: onTapNotificationAction,
                           style: .notification,
                           edge: .top,
                           closeSubject: closeSubject)
        })

        return action
    }
}

private class AddToCuratorViewModel {

    static let `default` = AddToCuratorViewModel()

    @Inject private var curatorAdapter: ProductCuratorAdapter

    func contains(reference: ProductReference) -> Bool {
        self.curatorAdapter.contains(reference: reference)
    }

    func addProduct(reference: ProductReference, onDone: @escaping () -> Void, onError: @escaping () -> Void) {
        let publisher = self.curatorAdapter.addProduct(reference: reference)
        self.performOperation(for: publisher, onDone: onDone, onError: onError)
    }

    func removeProduct(reference: ProductReference, onDone: @escaping () -> Void, onError: @escaping () -> Void) {
        let publisher = self.curatorAdapter.removeProduct(reference: reference)
        self.performOperation(for: publisher, onDone: onDone, onError: onError)
    }

    private func performOperation<Operation: Publisher>(for publisher: Operation,
                                                        onDone: @escaping () -> Void,
                                                        onError: @escaping () -> Void) where Operation.Output == Result<Void, ErrorDisplayable>, Operation.Failure == Error {
        let wrappedPublisher = publisher.catch { error in
            return Just(.failure(ErrorDisplayable(error)))
        }
        ProductCuratorQueue.shared.addOperation(wrappedPublisher, receiveValue: { result in
            switch result {
            case .success:
                onDone()
            case .failure:
                onError()
            }
        })
    }
}
