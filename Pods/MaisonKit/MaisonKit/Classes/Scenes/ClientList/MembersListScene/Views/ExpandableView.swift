// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ExpandableView: View {

    private enum Labels {
        static let moreButtonTitle = MKLocalizedString("client-lists.info.more-button.title",
                                                       comment: "Title of the 'More' button in client list info section")
    }

    @State private var isExpanded = false

    let text: String
    let lineLimit: Int

    private var tapGesture: some Gesture {
        return TapGesture().onEnded {
            self.isExpanded.toggle()
        }
    }

    init(text: String, lineLimit: Int = 1) {
        self.text = text
        self.lineLimit = lineLimit
    }

    var body: some View {
        StylableGroup("expandable") {
            HStack {
                Text(self.text)
                    .style("body")
                    .lineLimit(self.isExpanded ? nil : self.lineLimit)
                if !self.isExpanded {
                    Text(Labels.moreButtonTitle)
                        .style("title")
                }
            }.padding(.vertical)
            .addStyledRowDivider()
            .padding(.horizontal)
            .gesture(self.tapGesture)
        }.animation(.easeOut, value: self.isExpanded)
    }
}
