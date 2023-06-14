// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct FormTextFieldView: View {

    private let typedField: TypedField
    private let styleType: FormView.StyleType

    @available(*, deprecated, message: "Deprecated on version 0.22.0. `FormView` has been deprecated in favor of `GenericFormView`. Use Generic Form instead.")
    init(typedField: TypedField, styleType: FormView.StyleType) {
        self.typedField = typedField
        self.styleType = styleType
    }

    init(typedField: TypedField) {
        self.typedField = typedField
        self.styleType = .normal
    }

    var body: some View {
        StylableGroup("input") {
            FormFieldView(typedField: self.typedField,
                          title: {
                            HStack(alignment: .top) {
                                Text(verbatim: self.typedField.value.toString())
                                Spacer()
                                if self.typedField.isCopyable {
                                    self.buildCopyButton()
                                }
                            }
                          }, styleType: self.styleType)
                .styleInputContent(styleType: self.styleType)
                .style("background")
        }
    }

    private func buildCopyButton() -> some View {
        Button(action: {
            self.copyHandler()
        }, label: {
            MaisonKitImage(source: .styledImage(identifier: "icon-copy"))
                .frame(width: 20, height: 20)
        }).buttonStyle(PlainButtonStyle())
    }

    private func copyHandler() {
        // TODO: How do we get context-aware messaging here?
        UIPasteboard.general.copyToPasteboard(self.typedField.value.toString(), toastMessage: UIPasteboard.Labels.valueCopiedGenericString)
    }
}

struct FormTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormTextFieldView(typedField: TypedField(title: "Advisor", value: .text(lines: ["Shlomo"])))
            .environmentObject(Stylist())
    }
}
