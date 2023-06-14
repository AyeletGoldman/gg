// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TimelineItemCellInlineActionsView: View {

    private enum Labels {
        static let questionTitle = MKLocalizedString("client360.timeline-item.confirmation-buttons.question.title",
                                               comment: "The question if the timeline item has happened or not")
        static let noTitle = MKLocalizedString("client360.timeline-item.confirmation-buttons.no.title",
                                               comment: "The button title to deny the timeline item")
        static let yesTitle = MKLocalizedString("client360.timeline-item.confirmation-buttons.yes.title",
                                               comment: "The button title to confirm the timeline item")
    }

    let confirmClosure: () -> Void
    let denyClosure: () -> Void

    var body: some View {
        StylableGroup("timeline-actions") {
            HStack {
                Text(Labels.questionTitle)
                    .style("title")
                    .padding(.leading, 14)
                Spacer()
                HStack {
                    TertiaryButton(buttonData: ButtonData(label: Labels.noTitle,
                                                          icon: "icon-fail",
                                                          action: self.denyClosure),
                                   variant: .error)
                    TertiaryButton(buttonData: ButtonData(label: Labels.yesTitle,
                                                          icon: "icon-success",
                                                          action: self.confirmClosure))
                }
                .padding(.vertical, 6)
                .padding(.trailing, 8)
            }.style("background")
        }
    }
}
