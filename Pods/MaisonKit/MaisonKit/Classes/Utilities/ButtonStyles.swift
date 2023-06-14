// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct NoAnimationButtonStyle: ButtonStyle {
    private let removeAnimation: Bool

    init(if removeAnimation: Bool = true) {
        self.removeAnimation = removeAnimation
    }

    private var pressedOverlay: AnyView {
        return Color.clear.style("background").opacity(0.5).eraseToAnyView()
    }

    private var regularOverlay: AnyView {
        return Color.clear.eraseToAnyView()
    }

    private func overlay(for configuration: Configuration) -> some View {
        configuration.isPressed && !self.removeAnimation ? self.pressedOverlay : self.regularOverlay
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .contentShape(Rectangle()) // So the full button will be tappable in case of the configuration label includes `VStack` or `HStack`.
            .overlay(self.overlay(for: configuration))
    }
}
