// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI

public extension View {

    @ViewBuilder
    /// A convenience to add a loader at the end of the view that will perform the given closure when it appears
    /// - Parameter execute: the closure to execute when the loader appears on screen
    /// - Returns: a modified `View` that, if a closure is passed in, will add a `LoadingView` after this view and will execute the given closure `onAppear`
    func onEndReached(_ execute: (() -> Void)?) -> some View {
        self.modifier(OnEndReachedViewModifier(onEndReached: execute))
    }
}

struct OnEndReachedViewModifier: ViewModifier {

    private let onEndReached: (() -> Void)?

    init(onEndReached: (() -> Void)?) {
        self.onEndReached = onEndReached
    }

    func body(content: Content) -> some View {
        content
        if let onEndReached {
            LoadingView()
            // SwiftUI animates the view from its original position,
            // so we set a random ID so animations are re-started when the LoadingView changes position
                .id(UUID())
                .onAppear {
                    onEndReached()
                }
                .padding(.vertical)
        }
    }
}
