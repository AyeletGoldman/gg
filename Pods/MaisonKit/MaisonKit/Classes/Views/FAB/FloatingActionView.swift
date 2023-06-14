// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct FloatingActionView<Content: View, Value: Equatable>: View {

    /// A binding to the size of the FAB
    @Binding var size: CGSize
    /// A value to observe and re-calculate the size of the FAB when this value changes
    var value: Value

    @ViewBuilder var content: () -> Content
    var variant: String?

    var body: some View {
        GeometryReader { proxy in
            StylableGroup(StylistIdentifier.buildFullIdentifier(for: "fab", variant: self.variant)) {
                VStack(spacing: 0) {
                    Spacer()
                    self.content()
                        .overlay(Color.clear.modifier(GeometryGetterMod(size: self.$size, value: self.value)))
                        .padding(.bottom, proxy.safeAreaInsets.bottom)
                        .style("background")
                        .addStyledRowDivider(position: .top, dividerVariant: "full")
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

private struct GeometryGetterMod<Value: Equatable>: ViewModifier {

    @Binding var size: CGSize
    var value: Value

    @ViewBuilder
    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content.onAppear {
                self.size = self.calculateSize(in: proxy)
            }.onChange(of: self.value) { _ in
                self.size = self.calculateSize(in: proxy)
            }
        }
    }

    private func calculateSize(in proxy: GeometryProxy) -> CGSize {
        return proxy.frame(in: .global).size
    }
}
