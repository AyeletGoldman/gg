// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func addSwipeToRead(isRead: Bool, action: @escaping () -> Void) -> some View {
        let data = SwipeActionModifier.SwipeActionButtonData(action: action, label: {
            self.getLabel(isRead: isRead)
        })
        self.modifier(SwipeActionModifier(buttonData: data))
    }

    private func getLabel(isRead: Bool) -> some View {
        MaisonKitImage(source: .styledImage(identifier: isRead ? "icon-eye-open" : "icon-eye-closed"))
            .frame(width: 20, height: 20)
    }
}
