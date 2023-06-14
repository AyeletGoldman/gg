// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

private struct NoticeMessageView: View {

    let text: String

    var body: some View {
        return Text(verbatim: self.text)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 5)
            .style("title")
    }
}

extension View {
    func withNoticeText(text: String?, variant: String? = nil) -> some View {
        VStack(spacing: 0) {
            if let text = text {
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "banners", variant: variant)) {
                    NoticeMessageView(text: text)
                        .style("background")
                }
                .transition(.move(edge: .top))
                .animation(.easeOut, value: text)
            }
            self
        }
    }
}
