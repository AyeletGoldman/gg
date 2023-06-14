// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import Combine

/// A view modifier that takes into account the keyboard's height and then adapts the content
/// inside it to ignore the safe area in the bottom if the keyboard is not presented or pad
/// the content from the bottom by the same amount as the height of the keyboard
struct AdaptsToSoftwareKeyboard: ViewModifier {

    @State private var currentHeight: CGFloat = 0

    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
                .padding(.bottom, self.currentHeight - proxy.safeAreaInsets.bottom)
                .onReceive(Publishers.keyboardHeight) { self.currentHeight = $0 }
                .animation(.default, value: self.currentHeight)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

extension View {
    @ViewBuilder
    func padToAvoidKeyboardIfNeeded() -> some View {
        self.modifier(AdaptsToSoftwareKeyboard())
    }
}
