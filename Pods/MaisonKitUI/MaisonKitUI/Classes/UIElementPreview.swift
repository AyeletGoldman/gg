// Copyright © 2020 LVMH. All rights reserved.
#if DEBUG

import SwiftUI
import StylableSwiftUI

struct UIElementPreview<Value: View>: View {

    private let dynamicTypeSizes: [ContentSizeCategory] = [.extraSmall, .extraExtraExtraLarge]

    private let viewToPreview: Value

    private let stylist: Stylist
    private let darkModeStylist: Stylist

    init(_ viewToPreview: Value, stylist: Stylist, darkModeStylist: Stylist) {
        self.viewToPreview = viewToPreview
        self.stylist = stylist
        self.darkModeStylist = darkModeStylist
    }

    var body: some View {
        Group {
            self.viewToPreview
                .previewDisplayName("Default preview")
                .environmentObject(self.stylist)

            self.viewToPreview
                .environment(\.colorScheme, .dark)
                .environmentObject(self.darkModeStylist)
                .previewDisplayName("Dark mode preview")

            self.viewToPreview
                .redacted(reason: .placeholder)
                .environmentObject(self.stylist)
                .previewDisplayName("Placeholder")

            ForEach(dynamicTypeSizes, id: \.self) { sizeCategory in
                self.viewToPreview
                    .environment(\.sizeCategory, sizeCategory)
                    .environmentObject(self.stylist)
                    .previewDisplayName("\(sizeCategory)")
            }
        }.previewLayout(.sizeThatFits)
    }
}

extension View {
    @ViewBuilder func inAllModes(stylist: Stylist = .unstyled, darkModeStylist: Stylist = .unstyled) -> some View {
        UIElementPreview(self, stylist: stylist, darkModeStylist: darkModeStylist)
    }
}
#endif
