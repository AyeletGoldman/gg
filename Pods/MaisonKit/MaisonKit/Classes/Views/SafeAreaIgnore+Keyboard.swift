// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

// swiftlint:disable:next type_name
struct IgnoresSafeAreaFromKeyboardAppearanceViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        GeometryReader { _ in
            content
        }
    }
}

public extension View {
    /// Will wrap content in a geometry reader to add an extra layer.
    /// Doing that will permit us to avoid our content to be affected by the keyboard appearance
    /// and thus by the safe area change associated.
    /// This modifier will be useful in case the content does not have a flexible height.
    /// - Returns: a view modified to ignore the sale area affected by the keyboard's appearance.
    func ignoresSafeAreaFromKeyboardAppearance() -> some View {
        return self.modifier(IgnoresSafeAreaFromKeyboardAppearanceViewModifier())
    }
}
