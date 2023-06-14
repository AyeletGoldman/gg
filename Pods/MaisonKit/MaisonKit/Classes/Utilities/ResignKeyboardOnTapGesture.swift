// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI

struct ResignKeyboardOnTapGesture: ViewModifier {

    private var gesture = TapGesture().onEnded { _ in
        UIApplication.shared.endEditing(true)
    }

    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnTapGesture() -> some View {
        return modifier(ResignKeyboardOnTapGesture())
    }
}
