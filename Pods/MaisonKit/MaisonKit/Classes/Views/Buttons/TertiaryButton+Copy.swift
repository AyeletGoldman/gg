// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension TertiaryButton {

    @ViewBuilder
    static func copyableText(textToCopy: String, toastMessage: String? = nil) -> some View {
        TertiaryButton(buttonData: ButtonData(label: textToCopy,
                                              icon: "icon-copy",
                                              iconPosition: .trailing,
                                              action: {
            UIPasteboard.general.copyToPasteboard(textToCopy, toastMessage: toastMessage)
        }))
    }
}
