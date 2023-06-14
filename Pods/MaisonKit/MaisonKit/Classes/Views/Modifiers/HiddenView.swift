// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

private struct HiddenViewModifier: ViewModifier {
    var isHidden: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        content.opacity(self.isHidden ? 0 : 1)
    }
}

extension View {
    func hidden(_ isHidden: Bool) -> some View {
        self.modifier(HiddenViewModifier(isHidden: isHidden))
    }
}
