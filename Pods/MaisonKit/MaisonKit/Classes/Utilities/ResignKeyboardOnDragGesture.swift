// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        if #available(iOS 16, *) {
            return self.scrollDismissesKeyboard(.immediately)
        } else {
            return self.modifier(ResignKeyboardOnDragGesture())
        }
    }
}
