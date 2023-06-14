// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

private struct PlaceHolder<T: View>: ViewModifier {
    var placeHolder: T
    var show: Bool

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if self.show { self.placeHolder }
            content
        }
    }
}

public extension View {

    /// View modifier to define the view placeholder
    /// - Parameters:
    ///   - placeholder: the placeholder view
    ///   - shouldShow: whether to show the placeholder view or not
    /// - Returns: A view modified with the `PlaceHolder` `ViewModifier` to show the given view as a placeholder 
    func placeHolder<T: View>(_ placeholder: T, shouldShow: Bool) -> some View {
        self.modifier(PlaceHolder(placeHolder: placeholder, show: shouldShow))
    }
}

extension TextField where Label == Text {
    init(_ text: Binding<String>) {
        self.init("", text: text)
    }

    init(_ text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void, onCommit: @escaping () -> Void) {
        self.init("",
                  text: text,
                  onEditingChanged: onEditingChanged,
                  onCommit: onCommit)
    }
}
