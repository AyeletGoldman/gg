// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

struct MailComposeViewModel {
    let onDone: (UIViewController, CancellableResult) -> Void

    init(onDone: @escaping (UIViewController, CancellableResult) -> Void) {
        self.onDone = onDone
    }

    func didFinish(with result: MFMailComposeResult, for controller: MFMailComposeViewController, error: Error?) {
        let cancellableResult = result.toCancellableResult(with: error)
        HapticGenerator.resultOccurred(cancellableResult)
        self.onDone(controller, cancellableResult)
    }
}

extension MFMailComposeResult {
    func toCancellableResult(with error: Error?) -> CancellableResult {
        switch self {
        case .cancelled, .saved:
            return .cancelled
        case .sent:
            return .success
        case .failed:
            return .failure(error)
        @unknown default:
            return .cancelled
        }
    }
}
