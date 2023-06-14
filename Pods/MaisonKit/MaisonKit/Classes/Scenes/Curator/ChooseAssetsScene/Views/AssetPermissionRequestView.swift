// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

struct AssetPermissionRequestView: View {

    private enum Labels {
        static let explanationText = MKLocalizedString("choose-assets.permissions.explanation.title",
                                                       comment: "The explanation text above the button that will allow access to the user's photo library and camera")
        static let buttonTitle = MKLocalizedString("choose-assets.permissions.allow-access.button.title",
                                                   comment: "The title of the button that will allow access to the user's photo library and camera")
    }

    let onAllowAccessTapped: () -> Void

    var body: some View {
        VStack {
            Text(verbatim: Labels.explanationText)
                .style("body")
            TertiaryButton(buttonData: ButtonData(label: Labels.buttonTitle,
                                                  icon: "icon-lock",
                                                  action: self.onAllowAccessTapped),
                           variant: nil)
            Spacer()
        }
    }
}
