// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct UIElementPreview<Value: View>: View {

    private let dynamicTypeSizes: [ContentSizeCategory] = [.extraSmall, .large, .extraExtraExtraLarge]

    /// Filter out "base" to prevent a duplicate preview.
    private let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }

    private let viewToPreview: Value

    init(_ viewToPreview: Value) {
        self.viewToPreview = viewToPreview
    }

    var body: some View {
        Group {
            self.viewToPreview
                .previewDisplayName("Default preview")

            self.viewToPreview
                .redacted(reason: .placeholder)
                .previewDisplayName("Placeholder")

            ForEach(localizations, id: \.identifier) { locale in
                self.viewToPreview
                    .environment(\.locale, locale)
                    .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
            }

            ForEach(dynamicTypeSizes, id: \.self) { sizeCategory in
                self.viewToPreview
                    .environment(\.sizeCategory, sizeCategory)
                    .previewDisplayName("\(sizeCategory)")
            }
        }.previewLayout(PreviewLayout.sizeThatFits)
    }
}

extension View {
    @ViewBuilder func inAllModes(stylist: Stylist = Stylist.unstyled) -> some View {
        UIElementPreview(self).environmentObject(stylist)
    }
}
