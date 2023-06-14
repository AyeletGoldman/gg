// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFTypedFieldView: View {

    private let field: TypedField
    private let config: GFFieldConfiguration

    init(field: TypedField, config: GFFieldConfiguration) {
        self.field = field
        self.config = config
    }

    private var text: some View {
        Text(verbatim: self.field.value.toString())
            .style("title")
    }

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: false, content: {
            self.text
        }, accessory: {
            if self.field.isCopyable && !self.config.isEditable {
                Button(action: {
                    UIPasteboard.general.copyToPasteboard(self.field.value.toString(),
                                                          toastMessage: UIPasteboard.Labels.valueCopiedGenericString)

                }, label: {
                    MaisonKitImage(source: .styledImage(identifier: "icon-copy"))
                        .frame(width: 20, height: 20)
                }).buttonStyle(PlainButtonStyle())
            }
        })
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.field.value.toString().isEmpty))
    }
}
