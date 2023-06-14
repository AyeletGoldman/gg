// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI

/// A view to show when a field is required
public struct RequiredFieldIndicator: View {

    /// Creates a new `RequiredFieldIndicator`
    public init() { }

    public var body: some View {
        MaisonKitImage(source: .styledImage(identifier: "icon-required"))
            .frame(width: 12, height: 12)
    }
}

#if DEBUG
struct RequiredFieldIndicator_Previews: PreviewProvider {
    static var previews: some View {
        RequiredFieldIndicator()
            .fixedSize()
            .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
