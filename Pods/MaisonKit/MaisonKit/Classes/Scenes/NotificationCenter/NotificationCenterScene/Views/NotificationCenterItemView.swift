// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct NotificationCenterItemView: View {

    let notification: NotificationCenterItem

    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            HStack(alignment: .top, spacing: 0) {
                MaisonKitImage(source: self.notification.icon)
                    .frame(width: 20, height: 20)
                Text(self.notification.title)
                    .style("title")
                    .padding(.leading, 8)
                Spacer()
                HStack(spacing: 4) {
                    Color.clear
                        .overlay(Color.clear.style("underlay"))
                        .style("underlay")
                        .frame(width: self.notification.isRead ? 0 : 12, height: 12)
                        .hidden(self.notification.isRead)

                    MaisonKitImage(source: .styledImage(identifier: ViewStackIdentifierConstants.defaultDisclosureIndicator))
                        .frame(width: self.notification.action == nil ? 0 : 20, height: 20)
                        .hidden(self.notification.action == nil)
                }
            }
            HStack(alignment: .bottom) {
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "info", variant: "label")) {
                    LabeledValueView(values: self.notification.subtitles)
                    Spacer()
                    Text(self.notification.date.toString(with: DateFormatter.pastDateFormatter))
                        .style("subtitle")
                }
            }

        }
        .padding(EdgeInsets(top: 13, leading: 12, bottom: 10, trailing: 10))
        .style("background")
    }
}
