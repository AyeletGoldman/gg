// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct FloatingActionViewModifier<FABContent: View, Value: Equatable>: ViewModifier {

    @State private var fabSize: CGSize = .zero
    /// The content that will be shown on the FAB
    var fabContent: () -> FABContent
    /// Any stylist variant that should be applied to the FAB
    var fabVariant: String?
    /// A value to observe and reload the size of the FAB when it changes
    var value: Value

    func body(content: Content) -> some View {
        ZStack {
            ScrollView(.vertical) {
                content
                Color.clear
                    .frame(height: 0)
                    .padding(.bottom, self.fabSize.height) // This to move the inset up
            }
            FloatingActionView(size: self.$fabSize,
                               value: self.value,
                               content: {
                                self.fabContent()
                               },
                               variant: self.fabVariant)
        }.style("background")
    }
}

extension View {
    func withFloatingActionView<FABContent: View, Value: Equatable>(value: Value,
                                                                    fabVariant: String? = nil,
                                                                    @ViewBuilder fabContent: @escaping () -> FABContent) -> some View {
        self.modifier(FloatingActionViewModifier(fabContent: fabContent, fabVariant: fabVariant, value: value))
    }

    func withFloatingActionView<FABContent: View>(fabVariant: String? = nil,
                                                  @ViewBuilder fabContent: @escaping () -> FABContent) -> some View {
        self.modifier(FloatingActionViewModifier(fabContent: fabContent, fabVariant: fabVariant, value: true))
    }
}
