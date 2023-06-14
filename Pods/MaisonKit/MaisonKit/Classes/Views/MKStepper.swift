// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct MKStepper: View {

    @Binding var value: Int
    var range: ClosedRange<Int>

    private var isAtLowerBound: Bool {
        self.value == self.range.lowerBound
    }

    private var isAtUpperBound: Bool {
        self.value == self.range.upperBound
    }

    var body: some View {
        StylableGroup("stepper") {
            HStack {
                Button {
                    self.value -= 1
                } label: {
                    StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-icon-left", variant: self.isAtLowerBound ? "disabled" : nil)) {
                        MaisonKitImage(source: .styledImage(identifier: "icon-minus"))
                    }
                }.frame(width: 20, height: 20)
                .disabled(self.isAtLowerBound)
                StyledDivider(variant: "full", orientation: .vertical)
                Button {
                    self.value += 1
                } label: {
                    StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-icon-right", variant: self.isAtUpperBound ? "disabled" : nil)) {
                        MaisonKitImage(source: .styledImage(identifier: "icon-add"))
                    }
                }.frame(width: 20, height: 20)
                .disabled(self.isAtUpperBound)
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 15)
            .style("background")
        }
    }
}
