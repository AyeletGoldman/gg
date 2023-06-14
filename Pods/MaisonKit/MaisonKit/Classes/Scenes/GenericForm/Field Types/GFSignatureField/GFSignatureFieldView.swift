// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFSignatureFieldView: View {
    @Binding var signatureImage: UIImage?
    @State private var strokes = [GFStroke]()

    private let config: GFFieldConfiguration

    private var signatureView: GFSignatureView {
        GFSignatureView(image: $signatureImage, strokes: $strokes, readOnly: self.config.isReadOnly)
    }

    init(config: GFFieldConfiguration, signatureImage: Binding<UIImage?>) {
        self.config = config
        self._signatureImage = signatureImage
    }

    var body: some View {
        StylableGroup("signature") {
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    Text(self.config.title)
                        .style("subtitle")

                    if self.config.showRequiredSymbol {
                        RequiredFieldIndicator()
                    }
                }

                Text(MKLocalizedString("form.signature.subtitle", comment: "The subtitle clearing out the aim of the signature"))
                    .style("body")
                    .padding(.top, 8)

                self.signatureView
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .padding(.horizontal, 8)

                if self.config.isEditable {
                    self.action
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 5)
        }
    }

    private var action: some View {
        let buttonData = ButtonData(label: MKLocalizedString("form.signature.clear.button.title", comment: "Title of the button to clear the signature"),
                                    icon: "icon-trash",
                                    iconPosition: .leading,
                                    isEnabled: !self.signatureView.isEmpty,
                                    action: {
                                        self.signatureImage = nil
                                        self.strokes = []
                                    })

        return TertiaryButton(buttonData: buttonData, variant: .error)
    }
}
