// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

/// Routing protocol for the MyProfile scene
public protocol MyProfileRouter {

    /// Present a mail composer scene with the passed data
    /// - Parameters:
    ///   - emailData: Contains all the informations needed to send a mail
    ///   - onDone: Closure to invoke when the activity is finished. Contains its result.
    func presentMailComposer(emailData: EmailData, onDone: @escaping (CancellableResult) -> Void)
}

/// Default routing implementation for the MyProfile scene
final class DefaultMyProfileRouter: Router<MyProfileViewController>, MyProfileRouter {

    func presentMailComposer(emailData: EmailData, onDone: @escaping (CancellableResult) -> Void) {
        let descriptor = MailComposerRouteDescriptor(emailData: emailData,
                                                     onDone: { controller, result in
                                                        controller.dismiss(animated: true) {
                                                            onDone(result)
                                                        }
                                                     })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.controller?.present(controller, animated: true, completion: nil)
    }
}
