// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct DateDisplayFieldView<Value>: View {
    let config: GFFieldConfiguration
    let displayValue: (Value?) -> String
    @Binding var isExpanded: Bool
    @Binding var value: Value?

    var body: some View {
        GFFieldView(title: self.config.title, isRequired: self.config.showRequiredSymbol, axis: .horizontal, content: {
            HStack(spacing: 0) {
                Spacer()
                StyledButton(buttonData: ButtonData(label: self.displayValue(self.value),
                                                    action: { withAnimation { self.isExpanded.toggle() } }),
                             style: ButtonIdentifier.secondary,
                             iconSize: CGSize(width: 20, height: 20),
                             padding: EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            }
        }, accessory: {
            if self.value != nil {
                GFClearFieldButton { withAnimation {
                    self.isExpanded = false
                    self.value = nil
                } }
            }
        })
    }
}
