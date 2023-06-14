// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

extension View {
    func asImageBackground(variant: String? = nil) -> some View {
        self.style(StylistIdentifier(StylistIdentifier.buildFullIdentifier(for: "image", variant: variant).appending("/background")))
            .unredacted()
    }
}
