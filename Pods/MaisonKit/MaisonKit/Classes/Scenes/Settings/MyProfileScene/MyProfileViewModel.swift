// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import MessageUI

/// View model for the `MyProfileView`
/// Is responsible of the data displayed and the contact action handling
final class MyProfileViewModel: ObservableObject {

    private enum Labels {
        static let mailUnavailableTitle = MKLocalizedString("settings.toast.error.mail-unavailable.title",
                                                            comment: "The text to show on a toast message in Settings when mail is unavailable on your device")
        static let mailSentSuccessfully = MKLocalizedString("settings.toast.success.mail-sent.title",
                                                            comment: "The text to show when an email was sent successfuly to the CRM team")
        static let mailSendFailed = MKLocalizedString("settings.toast.error.mail-send-failed.title",
                                                            comment: "The text to show on a toast message in Settings when mail failed to send")
    }

    @Published var items: [TypedField]
    @Published var crmEmail: String?
    @Published var crmTextDetails: String?

    private let router: MyProfileRouter

    /// Creates a new `MyProfileViewModel` given a router
    /// - Parameters:
    ///   - router: `MyProfileRouter` instance used for the routing handling of the scene
    init(router: MyProfileRouter) {
        self.router = router
        let user = MaisonKitUser.currentLoggedInUser!

        self.items = user.displayFields ?? []
        if let email = user.contact?.email, let information = user.contact?.information {
            self.crmEmail = email
            self.crmTextDetails = information
        }
    }

    func didTapCRMContactButton() {
        if Mail.canSendMail {
            let emailData = EmailData(emails: self.crmEmail.map { [$0] } ?? [])
            self.router.presentMailComposer(emailData: emailData) { result in
                switch result {
                case .success:
                    ToastView.show(text: Labels.mailSentSuccessfully,
                                   style: .success)
                case .failure:
                    ToastView.show(text: Labels.mailSendFailed,
                                   style: .error)
                case .cancelled:
                    break
                }
            }
        } else {
            ToastView.show(text: Labels.mailUnavailableTitle,
                           style: .error)
        }
    }
}
