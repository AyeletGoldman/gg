// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

private struct BackgroundScrollViewModifier: ViewModifier {

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16, *) {
            content.scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

extension View {
    func clearScrollBackground() -> some View {
        self.modifier(BackgroundScrollViewModifier())
    }
}
