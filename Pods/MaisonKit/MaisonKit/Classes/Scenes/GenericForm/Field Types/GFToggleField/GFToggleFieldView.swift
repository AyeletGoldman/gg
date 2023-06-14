// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFToggleFieldView: View {

    @Binding private var value: Bool
    private let config: GFFieldConfiguration

    init(value: Binding<Bool>, config: GFFieldConfiguration) {
        self._value = value
        self.config = config
    }

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, axis: .horizontal, content: {
            Toggle("", isOn: self.$value)
                .disabled(!self.config.isEditable)
        }, accessory: {
            // If the field is locked, we show the lock indicator
            if self.config.shouldShowLockIcon {
                AccessoryViewFactory.lockIcon(isHidden: false)
            }
        })
        .wrapToGFField(variant: "toggle")
    }
}
