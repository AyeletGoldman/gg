// Copyright © 2022 LVMH. All rights reserved.

import Foundation

extension UIPasteboard {

    enum Labels {
        static let valueCopiedGenericString = MKLocalizedString("general.value-copied.success.title",
                                                                comment: "A default message to show in a toast view when a value is copied to the pasteboard")
    }

    func copyToPasteboard(_ stringToCopy: String, toastMessage: String? = nil) {
        self.string = stringToCopy
        if let toastMessage = toastMessage {
            ToastView.show(text: toastMessage, style: .success)
        }
    }
}
