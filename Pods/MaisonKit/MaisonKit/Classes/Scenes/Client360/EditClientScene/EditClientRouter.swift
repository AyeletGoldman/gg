//  Copyright © 2022 LVMH. All rights reserved.

public protocol EditClientRouter: GenericFormRouter {

    /// Presents the confirmation screen for the details that are edited from a client
    /// - Parameters:
    ///   - clientID: The ID of the client whose data we are confirming
    ///   - data: The modified data for a client
    ///   - onSuccess: A closure to invoke when the data has been successfully saved
    func presentConfirmation(clientID: String, data: AnyFormData, onSuccess: @escaping () -> Void)
}

final class DefaultEditClientRouter: Router<EditClientViewController>, EditClientRouter, DefaultGenericFormPresenterRouter {
    func presentConfirmation(clientID: String, data: AnyFormData, onSuccess: @escaping () -> Void) {
        let descriptor = EditClientConfirmationRouteDescriptor(clientID: clientID, data: data, onSuccess: onSuccess)
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
