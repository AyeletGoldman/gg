// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct MailComposerScene: Scene {

    private let emailData: EmailData
    private let onDone: (UIViewController, CancellableResult) -> Void

    init(emailData: EmailData, onDone: @escaping (UIViewController, CancellableResult) -> Void) {
        self.emailData = emailData
        self.onDone = onDone
    }

    func createViewController() -> MailComposeViewController {
        return MailComposeViewController()
    }

    func configure(controller: MailComposeViewController,
                   using factory: SceneFactory) {

        controller.setToRecipients(self.emailData.emails)
        if let subject = self.emailData.subject {
            controller.setSubject(subject)
        }
        if let body = self.emailData.body {
            controller.setMessageBody(body, isHTML: self.emailData.isBodyHtml)
        }

        controller.viewModel = MailComposeViewModel(onDone: self.onDone)
    }
}
