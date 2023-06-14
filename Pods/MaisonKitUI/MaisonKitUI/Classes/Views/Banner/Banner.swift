// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A banner provides a quick way to notify the user about something
/// on the screen that may require their attention. 
public struct Banner: View {

    /// The banner's title. This will be styled with a `title` style.
    public let title: String
    /// Optional. A variant to apply to the banner.
    public let variant: BannerVariant?

    /// Creates a new `Banner` with the given title and variant.
    /// - Parameters:
    ///   - title: The banner's title. This will be styled with a `title` style.
    ///   - variant: Optional. A variant to apply to the banner.
    public init(title: String, variant: BannerVariant? = nil) {
        self.title = title
        self.variant = variant
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "banners",
                                                            variant: self.variant)) {
            Text(self.title)
                .style("title")
                .padding(.vertical, 10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .style("background")
        }
        .accessibilityLabel("Banner")
        .accessibilityValue("Banner \(self.title)")
    }
}

#if DEBUG
struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Banner(title: "This is a banner")
            Banner(title: "This is a banner. It spans multiple lines. It should wrap around the view.")
        }
        .frame(width: 300)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}

struct AlertBanner_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Banner(title: "This is an alert banner.", variant: .alert)
            Banner(title: "This is a banner. It spans multiple lines. It should wrap around the view.",
                   variant: .alert)
        }
        .frame(width: 300)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
