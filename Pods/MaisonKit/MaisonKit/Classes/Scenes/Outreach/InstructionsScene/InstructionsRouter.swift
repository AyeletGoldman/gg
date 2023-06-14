//  Copyright © 2021 LVMH. All rights reserved.

/// A router for the Instructions scene
public protocol InstructionsRouter {

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

final class DefaultInstructionsRouter: Router<InstructionsViewController>, InstructionsRouter {

    func presentSMSComposer(messageData: MessageData, onDone: @escaping (CancellableResult) -> Void) {
        let descriptor = SMSComposerRouteDescriptor(messageData: messageData) { controller, result in
            controller.dismiss(animated: true, completion: nil)
            onDone(result)
        }
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.controller?.present(controller, animated: true, completion: nil)
    }

    func presentMailComposer(emailData: EmailData, onDone: @escaping (CancellableResult) -> Void) {
        let descriptor = MailComposerRouteDescriptor(emailData: emailData) { controller, result in
            controller.dismiss(animated: true, completion: nil)
            onDone(result)
        }
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.controller?.present(controller, animated: true, completion: nil)
    }
}
