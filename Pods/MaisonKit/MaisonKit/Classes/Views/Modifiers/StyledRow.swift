// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

extension View {
    @ViewBuilder
    func styleRow(stylistIdentifier: String, variant: String? = nil, includeDivider: Bool = false) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: stylistIdentifier, variant: variant)) {
            self
                .addStyledRowDivider(if: includeDivider, position: .bottom)
                .padding(.horizontal)
                .style("background")
        }
    }

    @ViewBuilder
    func styleAsListRow(variant: String? = nil, includeDivider: Bool = false) -> some View {
        self.styleRow(stylistIdentifier: "list-row", variant: variant, includeDivider: includeDivider)
    }

    @ViewBuilder
    func styleAsInputRow(variant: String? = nil, includeDivider: Bool = false) -> some View {
        self.styleRow(stylistIdentifier: "input", variant: variant, includeDivider: includeDivider)
    }

    @ViewBuilder
    func styleAsInputRow(isBlurred: Bool, includeDivider: Bool = false) -> some View {
        self.styleAsInputRow(variant: isBlurred ? "blurred" : nil, includeDivider: includeDivider)
    }
}
