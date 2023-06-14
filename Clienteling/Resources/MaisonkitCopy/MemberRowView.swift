// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import MaisonKit
struct MemberRowView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            MemberRowView(client: MemberRowDisplayable(id: "",
                                                       title: "FirstName12345 LastName12345",
                                                       subtitle: LabeledValue(label: "Last Purchase date", value: Date().formatted(date: .abbreviated, time: .omitted)),
                                                       segments: ["Tourist", "new"]))
            .padding()
            .environmentObject(Stylist.create())
        }
    }
}

struct MemberRowView: View {
    private let title: String
    private let tags: [Tag]
    private let subtitle: AnyView?
    private let isMyCustomer: Bool

    struct Tag: Identifiable {
        let id = UUID()
        let value: String
        let stylistIdentifier: String
    }
    
    init<Subtitle: View>(title: String, subtitle: Subtitle, tags: [Tag], isMyCustomer: Bool) {
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
                    Text(verbatim: self.title)
                        .frame(minHeight: 16, alignment: .leading)
                        .style("title")
                }
                .stackWithAccessory(if: true)
                self.buildTags()
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
    }

    private func buildTags() -> some View {
        HStack(spacing: 5) {
            ForEach(self.tags) { tag in
                BadgeView(title: tag.value)
                    .badgeViewStyle(ClientSegmentBadgeStyle(verticalPadding: 2, stylistIdentifer: tag.stylistIdentifier))
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
        let identifiers = ["tag-primary","tag-secondary"]
        self.tags = client.tags.enumerated().map { Tag(value: $1 , stylistIdentifier: identifiers[safe: $0] ?? "tag-secondary") }
        self.isMyCustomer = false //client.isMyCustomer
        self.subtitle = client.subtitles.isEmpty ? nil : LabeledValueView(values: client.subtitles).eraseToAnyView()
    }
}

struct LabeledValueView: View {

    let values: [LabeledValue]

    init(values: [LabeledValue]) {
        self.values = values
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(zip(self.values.indices, self.values)), id: \.0) { (_, item) in
                HStack(alignment: .top) {
                    Text(verbatim: item.label)
                        .style("subtitle")
                    Text(verbatim: item.value)
                        .style("title")
                }
            }
        }
    }
}

struct ClientSegmentBadgeStyle: BadgeViewStyle {
    /// The padding to apply to the badge before the background is applied.
    /// This means that the badge will appear to grow (e.g. the whitespace of the padding will be the color of the background for the badge).
    let verticalPadding: Double

    let stylistIdentifer: String
    
    /// Creates a new `ClientSegmentBadgeStyle` with a given vertical padding to apply
    /// - Parameter verticalPadding: The padding to apply to the badge before the background is applied.
    /// - Parameter stylistIdentifier: The identifier style the background
    /// This means that the badge will appear to grow (e.g. the whitespace of the padding will be the color of the background for the badge).
    init(verticalPadding: Double = 0, stylistIdentifer: String) {
        self.verticalPadding = verticalPadding
        self.stylistIdentifer = stylistIdentifer
    }

    func makeBody(configuration: Configuration) -> some View {
        StylableGroup(stylistIdentifer) {
            configuration.title
                .truncationMode(.tail)
                .style("title")
                .padding(.horizontal, 7.5)
                .padding(.vertical, verticalPadding)
                .style("background")
        }
    }
}

/// A style or `BadgeView`s that only shows the icon.
struct IconBadgeViewStyle: BadgeViewStyle {
    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        StylableGroup("tag-primary-icon") {
            configuration.icon
                .frame(width: 12, height: 12)
                .padding(.horizontal, 2)
                .style("background")
        }
    }
}

enum ViewStackIdentifierConstants {
    static let defaultDisclosureIndicator: StylistIdentifier = "icon-right"
}

extension View {
    
    @ViewBuilder
    func stackWithAccessory(accessoryIdentifier: StylistIdentifier = ViewStackIdentifierConstants.defaultDisclosureIndicator,
                            if condition: Bool) -> some View {
        HStack {
            self
            if condition {
                Spacer()
                MaisonKitImage(source: .styledImage(identifier: accessoryIdentifier))
                    .frame(width: 20, height: 20)
            }
        }
    }
}

struct CustomMemberView: View {
    let title: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Image(systemName: "chevron")
            }
            Text("last contacted")
        }
    }
    
    init(member: MemberRowDisplayable) {
        self.title = member.title
    }
}

