// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFTextFieldView: View {

    @Binding private var value: String
    private let config: GFFieldConfiguration
    private let keyboardType: UIKeyboardType

    init(value: Binding<String>, config: GFFieldConfiguration, keyboardType: UIKeyboardType = .default) {
        self._value = value
        self.config = config
        self.keyboardType = keyboardType
    }

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, content: {
            TextField("", text: self.$value)
                .keyboardType(self.keyboardType)
                .placeHolder(Text(self.config.placeholder), shouldShow: self.value.isEmpty)
                .frame(height: 24) // TODO: find a way so the line height won't change when there's no value
                .style("title")
                .disabled(!self.config.isEditable)
        }, accessory: {
            // If the field is locked, we show the lock indicator
            if self.config.shouldShowLockIcon {
                AccessoryViewFactory.lockIcon(isHidden: false)
            }
            if self.config.isEditable && !self.value.isEmpty {
                GFClearFieldButton {
                    self.value = ""
                }
            }
        })
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.value.isEmpty))
    }
}
