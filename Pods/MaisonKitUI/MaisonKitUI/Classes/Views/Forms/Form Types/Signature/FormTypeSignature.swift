// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A form type for signature.
public struct FormTypeSignature: View {

    @Environment(\.isEnabled) private var isEnabled

    private let title: String
    private let subtitle: String?
    private let showRequiredIndicator: Bool
    private let clearButtonTitle: String
    @Binding var signatureImage: UIImage?
    @State var strokes: [SignatureView.Stroke] = []

    /// Creates a new instance of `FormTypeSignature`
    /// - Parameters:
    ///   - title: the title to show
    ///   - subtitle: optionsl. The subtitle to show
    ///   - showRequiredIndicator: Whether to show the required indicator.
    ///   - clearButtonTitle: the clear signature button title
    ///   - signatureImage: the binding signature image
    public init(title: String,
                subtitle: String? = nil,
                showRequiredIndicator: Bool,
                clearButtonTitle: String,
                signatureImage: Binding<UIImage?>) {
        self.title = title
        self.subtitle = subtitle
        self.showRequiredIndicator = showRequiredIndicator
        self.clearButtonTitle = clearButtonTitle
        self._signatureImage = signatureImage
    }

    public var body: some View {
        StylableGroup("form-type-signature") {
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    Text(self.title)
                        .style("title")

                    if self.isEnabled && self.showRequiredIndicator {
                        RequiredFieldIndicator()
                    }
                }

                if let subtitle {
                    Text(subtitle)
                        .style("subtitle")
                        .padding(.top, 8)
                }

                self.signatureView
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .padding(.horizontal, 8)

                if self.isEnabled {
                    self.action
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 5)
            .style("background")
        }
    }

    private var signatureView: SignatureView {
        SignatureView(image: self.$signatureImage,
                      strokes: self.$strokes,
                      readOnly: !self.isEnabled)
    }

    private var action: some View {
        Button(title: self.clearButtonTitle,
               icon: .styledImage(identifier: "icon-trash"),
               action: {
            self.signatureImage = nil
            self.strokes = []
        })
        .buttonStyle(.tertiary)
        .disabled(self.signatureView.isEmpty)
    }
}

#if DEBUG
struct SignatureField: View {
    @State var image: UIImage?

    var body: some View {
        VStack {
            FormTypeSignature(title: "Signature",
                              subtitle: "Subtitle",
                              showRequiredIndicator: true,
                              clearButtonTitle: "Clear",
                              signatureImage: self.$image)
            if let image {
                Image(uiImage: image)
            }
        }
    }
}

struct FormTypeSignature_Previews: PreviewProvider {
    static var previews: some View {
        SignatureField()
            .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
