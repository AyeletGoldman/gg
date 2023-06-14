// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct OutreachSelectionItemView: View {

    let item: OutreachSelectionItemDisplayable

    @ViewBuilder
    private var title: some View {
        Text(self.item.title)
            .frame(minHeight: 30) // minimum height so that the text is at least as large as the icon
            .style("title")
    }

    @ViewBuilder
    private var tag: some View {
        if let tag = self.item.tag {
            BadgeView(title: tag, icon: nil)
                .badgeViewStyle(SecondaryBadgeViewStyle())
        }
    }

    @ViewBuilder
    private var icon: some View {
        Group {
            if let icon = self.item.icon {
                MaisonKitImage(source: icon)
            } else {
                Spacer()
            }
        }.frame(width: 30, height: 30)
    }

    @ViewBuilder
    private var itemBody: some View {
        if let body = self.item.body {
            Text(body).style("body")
        }
    }

    @ViewBuilder
    private var trailingIcon: some View {
        if let trailingIcon = self.item.trailingIcon {
            MaisonKitImage(source: trailingIcon)
                .frame(width: 20, height: 20)
        }
    }

    var body: some View {
        HStack {
            self.icon
            self.title
            self.tag
            Spacer()
            self.itemBody
            self.trailingIcon
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}
