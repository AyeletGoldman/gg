// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

struct SMSComposeViewModel {
    let onDone: (UIViewController, CancellableResult) -> Void

    init(onDone: @escaping (UIViewController, CancellableResult) -> Void) {
        self.onDone = onDone
    }

    func didFinish(with result: MessageComposeResult, for controller: MFMessageComposeViewController) {
        let cancellableResult = result.toCancellableResult()
        HapticGenerator.resultOccurred(cancellableResult)
        self.onDone(controller, cancellableResult)
    }
}

extension MessageComposeResult {
    func toCancellableResult() -> CancellableResult {
        switch self {
        case .cancelled:
            return .cancelled
        case .sent:
            return .success
        case .failed:
            return .failure(nil)
        @unknown default:
            return .cancelled
        }
    }
}
