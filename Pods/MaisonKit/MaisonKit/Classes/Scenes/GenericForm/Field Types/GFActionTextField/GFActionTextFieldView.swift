// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFActionTextFieldView: View {

    private var value: String
    private let config: GFFieldConfiguration
    private let performAction: () -> Void

    init(value: String, config: GFFieldConfiguration, performAction: @escaping () -> Void) {
        self.value = value
        self.config = config
        self.performAction = performAction
    }

    var body: some View {
        Button(action: self.performAction, label: {
            GFFieldView(title: self.config.title, content: {
                Text(self.value)
                    .placeHolder(Text(self.config.placeholder), shouldShow: self.value.isEmpty)
                    .style("title")
            }, accessory: {
                AccessoryViewFactory.disclosureIndicator(isHidden: false)
            })
        })
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.value.isEmpty))
    }
}
