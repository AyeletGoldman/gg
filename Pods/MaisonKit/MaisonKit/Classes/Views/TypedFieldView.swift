// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct TypedFieldView: View {

    let typedField: TypedField

    public init(typedField: TypedField) {
        self.typedField = typedField
    }

    public var body: some View {
        HStack(alignment: .bottom, spacing: 2) {
            if !typedField.title.isEmpty {
                Text(verbatim: "\(typedField.title):")
            }
            if self.typedField.isCopyable {
                self.buildCopyTextButton()
            } else {
                self.buildText()
            }
        }
    }

    private func buildText() -> some View {
        HStack(alignment: .center, spacing: 5) {
            if typedField.icon != nil {
                MaisonKitImage(source: .styledImage(identifier: typedField.icon!))
                    .frame(width: 16, height: 16)
            }
            Text(verbatim: self.typedField.value.toString())
        }
    }

    private func buildCopyTextButton() -> some View {
        Button(action: {
            self.copyHandler()
        }, label: {
            HStack(alignment: .center, spacing: 5) {
                self.buildText()
                MaisonKitImage(source: .styledImage(identifier: "icon-copy"))
                    .frame(width: 14, height: 14, alignment: .center)
            }
        }).buttonStyle(PlainButtonStyle())
    }

    private func copyHandler() {
        // TODO: How do we get context-aware messaging here?
        UIPasteboard.general.copyToPasteboard(self.typedField.value.toString(), toastMessage: UIPasteboard.Labels.valueCopiedGenericString)
    }
}

struct TypedFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TypedFieldView(typedField: TypedField(value: .text(lines: ["Walter White"]), icon: StylistIdentifier("icon-associate")))
    }
}
