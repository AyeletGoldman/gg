// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

enum ViewStackIdentifierConstants {
    static let defaultDisclosureIndicator: StylistIdentifier = "icon-right"
}

extension View {

    @ViewBuilder
    func stackWithAccessory(accessoryIdentifier: StylistIdentifier = ViewStackIdentifierConstants.defaultDisclosureIndicator,
                            if condition: Bool) -> some View {
        HStack {
            self
            if condition {
                Spacer()
                MaisonKitImage(source: .styledImage(identifier: accessoryIdentifier))
                    .frame(width: 20, height: 20)
            }
        }
    }

    @ViewBuilder
    func stackWithAccessory(accessoryIdentifier: StylistIdentifier = ViewStackIdentifierConstants.defaultDisclosureIndicator,
                            editMode: EditMode = .inactive) -> some View {
        // We don't show the accessory indicator if we're in edit mode
        self.stackWithAccessory(accessoryIdentifier: accessoryIdentifier, if: editMode == .inactive)
    }
}
