// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

final class MailComposeViewController: MFMailComposeViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

    var viewModel: MailComposeViewModel!

    // For some reason, setting the delegate in `viewDidLoad` gets reset at some point.
    // Set it here and the delegatet methods work.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.mailComposeDelegate = self
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.viewModel.didFinish(with: result, for: controller, error: error)
    }
}
