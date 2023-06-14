// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

extension View {
    @ViewBuilder
    func addSwipeToDelete(if condition: Bool, standardSwipe: Bool = true, action: @escaping () -> Void) -> some View {
        if condition {
            self.addSwipeToDelete(standardSwipe: standardSwipe, action: action)
        } else {
            self
        }
    }

    @ViewBuilder
    func addSwipeToDelete(standardSwipe: Bool = true, action: @escaping () -> Void) -> some View {
        // The standard swipe actions on a list row has a spacing problems in iOS 16
        // The custom swipe has the advantage of having the swipe also for not a full row (like horizontal spacing)
        // Because of that we always use custom swipe for iOS 16. For iOS 15 we use the both, depends on the design.
        if #available(iOS 16, *) {
            self.withSwipeToDeleteModifier(action: action)
        } else {
            // Since we decided to use the custom `List` also in iOS 15, we should use also the custom swipe.
            self.withSwipeToDeleteModifier(action: action)
        }
    }

    private func standardSwipeToDeleteAction(action: @escaping () -> Void) -> some View {
        Button(role: .destructive, action: {
            withAnimation {
                action()
            }
        }, label: {
            self.deleteLabel
        })
    }

    private func withSwipeToDeleteModifier(action: @escaping () -> Void) -> some View {
        let data = SwipeActionModifier.SwipeActionButtonData(action: action, label: {
            self.deleteLabel
        }, variant: "alert")
        return self.modifier(SwipeActionModifier(buttonData: data))
    }

    private var deleteLabel: some View {
        MaisonKitImage(source: .styledImage(identifier: "icon-trash"))
            .frame(width: 20, height: 20)
    }
}
