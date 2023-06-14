//
//  GFTextWithCopyFieldView.swift
//  Zenith Clienteling
//

import SwiftUI
import StylableSwiftUI
import MaisonKit

struct GFTextWithCopyFieldView: View {

    @Binding private var value: String
    private let config: GFFieldConfiguration
    private let isCopyable: Bool

    init(value: Binding<String>, config: GFFieldConfiguration, isCopyable: Bool) {
        self._value = value
        self.config = config
        self.isCopyable = isCopyable
    }

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, content: {
            MultilineTextField("", minimumHeight: 24, text: self.$value)
                        .placeHolder(Text(self.config.placeholder), shouldShow: self.value.isEmpty)
                        .style("title")
                        .disabled(!self.config.isEditable)
                        .padding(.top, 4)
        }, accessory: {
            // If the field is locked, we show the lock indicator
            if self.config.shouldShowLockIcon {
                AccessoryViewFactory.lockIcon(isHidden: false)
            }
            if self.config.isReadOnly && self.isCopyable {
                self.buildCopyButton()
            }
        })
        .wrapToGFField(variant: self.config.getInputVariant(isEmpty: self.value.isEmpty))
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
        UIPasteboard.general.copyToPasteboard(self.value, toastMessage: UIPasteboard.Labels.valueCopiedGenericString)
    }
}
