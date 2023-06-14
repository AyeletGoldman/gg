// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for the outreach message form scene
public protocol OutreachMessageFormRouter {

    /// Presents the instructions scene
    /// - Parameter instructionsData: Bunch of data needed by the scene
    func presentInstructions(instructionsData: InstructionsData)

    /// Presents the SMS composer screen
    /// - Parameters:
    ///   - messageData: the data to populate the message with
    ///   - onDone: a closure to invoke when the message has been sent
    func presentSMSComposer(messageData: MessageData, onDone: @escaping (CancellableResult) -> Void)

    /// Presents the mail composer screen
    /// - Parameters:
    ///   - emailData: the data to populate the email with
    ///   - onDone: a closure to invoke when the message has been sent
    func presentMailComposer(emailData: EmailData, onDone: @escaping (CancellableResult) -> Void)
}

final class DefaultOutreachMessageFormRouter: Router<OutreachMessageFormViewController>, OutreachMessageFormRouter {

    func presentInstructions(instructionsData: InstructionsData) {
        let descriptor = InstructionsRouteDescriptor(instructionsData: instructionsData)
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentSMSComposer(messageData: MessageData, onDone: @escaping (CancellableResult) -> Void) {
        let descriptor = SMSComposerRouteDescriptor(messageData: messageData) { [weak self] controller, result in
            self?.dismissControllerIfNeeded(controller, result: result)
            onDone(result)
        }
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.controller?.present(controller, animated: true, completion: nil)
    }

    func presentMailComposer(emailData: EmailData, onDone: @escaping (CancellableResult) -> Void) {
        let descriptor = MailComposerRouteDescriptor(emailData: emailData) { [weak self] controller, result in
            self?.dismissControllerIfNeeded(controller, result: result)
            onDone(result)
        }
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.controller?.present(controller, animated: true, completion: nil)
    }

    private func dismissControllerIfNeeded(_ controller: UIViewController, result: CancellableResult) {
        switch result {
        case .cancelled:
            break
        default:
            controller.dismiss(animated: true, completion: nil)
        }
    }
}
