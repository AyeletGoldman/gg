// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct MemberRowView: View {
    private let title: String
    private let tags: [String]
    private let subtitle: AnyView?
    private let isMyCustomer: Bool

    @Environment(\.editMode) private var editMode

    private var isInEditMode: Bool {
        guard let isEditing = self.editMode?.wrappedValue.isEditing else { return false }
        return isEditing
    }

    init<Subtitle: View>(title: String, subtitle: Subtitle, tags: [String], isMyCustomer: Bool) {
        self.title = title
        self.subtitle = subtitle.eraseToAnyView()
        self.tags = tags
        self.isMyCustomer = isMyCustomer
    }

    var body: some View {
        self.buildRow()
    }

    @ViewBuilder private func buildRow() -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 5) {
                    Text(verbatim: self.title).style("title")
                        .frame(minHeight: BadgeView.Constants.badgeHeight)
                    self.buildTags()
                    Spacer()
                }.stackWithAccessory(if: !self.isInEditMode)
                if let subtitle = self.subtitle {
                    StylableGroup("info") {
                        subtitle
                    }
                }
            }
            .padding(.vertical, 13)
        }
        .frame(minHeight: 54) // so the view is not too low if there is no subtitle
        .accessibility(identifier: "client-row")
        .contentShape(Rectangle()) // So the full row will be tappable
    }

    private func buildTags() -> some View {
        HStack(spacing: 5) {
            ForEach(self.tags, id: \.self) { tag in
                BadgeView(title: tag)
                    .badgeViewStyle(SecondaryBadgeViewStyle())
            }
            if self.isMyCustomer {
                BadgeView(icon: "icon-mine")
                    .badgeViewStyle(IconBadgeViewStyle())
            }
        }
    }
}

extension MemberRowView {
    init(client: MemberRowDisplayable) {
        self.title = client.title
        self.tags = client.tags
        self.isMyCustomer = client.isMyCustomer
        self.subtitle = client.subtitles.isEmpty ? nil : LabeledValueView(values: client.subtitles).eraseToAnyView()
    }
}
