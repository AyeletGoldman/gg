// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

final class SMSComposeViewController: MFMessageComposeViewController, MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate {

    var viewModel: SMSComposeViewModel!

    // For some reason, setting the delegate in `viewDidLoad` gets reset at some point.
    // Set it here and the delegate methods work.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.messageComposeDelegate = self
    }

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.viewModel.didFinish(with: result, for: controller)
    }
}
