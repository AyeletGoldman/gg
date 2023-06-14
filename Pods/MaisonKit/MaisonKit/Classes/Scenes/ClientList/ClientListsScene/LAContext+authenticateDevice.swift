// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import LocalAuthentication

extension LAContext {
    private enum Labels {
        static let errorTitle = MKLocalizedString("device-authentication.error.title",
                                           comment: "The error title to present when the device authentication has failed")
        static let defaultErrorDescription = MKLocalizedString("device-authentication.error.description",
                                                        comment: "The error description to present when the device authentication has failed")
    }
    func authenticateDevice(reason: String, onSuccess: @escaping () -> Void, onPolicyFail: @escaping (ErrorDisplayable) -> Void) {
        var error: NSError?

        if self.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            self.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, _ in
                if success {
                    DispatchQueue.main.async {
                        onSuccess()
                    }
                }
            }
        } else {
            onPolicyFail(ErrorDisplayable(
                localizedDescription: error?.localizedDescription ?? Labels.defaultErrorDescription,
                localizedTitle: Labels.errorTitle))
        }
    }
}
