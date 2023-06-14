// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TimelineViewCell: View {

    enum Constants {
        static let leadingViewWitdh: CGFloat = 34
    }

    private let leadingView: () -> any View
    private let variant: String?
    private let title: String
    private let subtitle: String?
    private let footer: String?
    private let tag: String?
    private let tagVariant: String?
    private let mediaItems: [MediaType]
    private let detail: TimelineDisplayable.Entry.Detail
    private let showDisclosureIndicator: Bool
    private let confirmationClosure: TimelineEntryConfirmationClosure?

    @State private var itemConfirmed = false
    @State private var itemDenied = false

    init(title: String,
         subtitle: String? = nil,
         variant: String? = nil,
         leadingView: @escaping () -> any View,
         footer: String? = nil,
         tag: String? = nil,
         tagVariant: String? = nil,
         mediaItems: [MediaType] = [],
         detail: TimelineDisplayable.Entry.Detail = .empty,
         showDisclosureIndicator: Bool = false,
         confirmationClosure: TimelineEntryConfirmationClosure? = nil) {
        self.leadingView = leadingView
        self.variant = variant
        self.title = title
        self.subtitle = subtitle
        self.tag = tag
        self.tagVariant = tagVariant
        self.detail = detail
        self.footer = footer
        self.mediaItems = mediaItems
        self.showDisclosureIndicator = showDisclosureIndicator
        self.confirmationClosure = confirmationClosure
    }

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "timeline-row", variant: self.variant)) {
            self.buildCellContent()
        }
        .frame(maxHeight: self.itemDenied ? 0 : .none, alignment: .top)
        .clipped()
    }

    @ViewBuilder
    private func buildCellContent() -> some View {
        ZStack {
            HStack {
                Spacer().frame(width: Constants.leadingViewWitdh/2)
                VerticalLine()
                Spacer()
            }
            VStack(spacing: 5) {
                Spacer().frame(height: 7)
                HStack(spacing: 12) {
                    self.leadingView().eraseToAnyView()
                    VStack(spacing: 0) {
                        self.buildCard()
                        if let confirmationClosure {
                            self.buildItemConfirmation(confirmationClosure: confirmationClosure)
                        }
                    }.style("background")
                }
                if let footer = self.footer {
                    HStack {
                        Spacer().frame(width: Constants.leadingViewWitdh)
                        self.buildFooter(with: footer)
                    }
                }
                Spacer().frame(height: 7)
            }
        }
    }

    @ViewBuilder
    private func buildCard() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                self.buildTitleView()
                if !self.detail.attributes.isEmpty {
                    Spacer().frame(height: 6)
                    StylableGroup("info") {
                        DetailsView(detail: self.detail)
                    }
                }
            }.padding(.leading, 14)
                .padding(.trailing, 12)
            if !self.mediaItems.isEmpty {
                Spacer().frame(height: 12)
                CarouselView(carouselItems: self.mediaItems,
                             scrollInset: 14,
                             isPreviewMode: false)
            }
        }
        .padding(.top, 11)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private func buildFooter(with footerText: String) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "info", variant: "label")) {
            HStack {
                Spacer()
                Text(footerText)
                    .style("subtitle")
            }
        }
    }

    @ViewBuilder
    private func buildTitleView() -> some View {
        HStack(alignment: .top, spacing: 0) {
            HStack(alignment: .firstTextBaseline, spacing: 5) {
                Text(verbatim: self.title)
                    .style("title")
                    .fixedSize(horizontal: false, vertical: true)
                if let tag = self.tag {
                    BadgeView(title: tag)
                        .badgeViewStyle(StockBadgeViewStyle(variant: self.tagVariant.map { AvailabilityVariant($0) }))
                }
            }
            Spacer()
            HStack(spacing: 0) {
                if let subtitle = self.subtitle {
                    Text(verbatim: subtitle)
                        .style("subtitle")
                }
                if self.showDisclosureIndicator {
                    MaisonKitImage(source: .styledImage(identifier: ViewStackIdentifierConstants.defaultDisclosureIndicator))
                        .frame(width: 20, height: 20)
                }
            }.frame(minHeight: 20)
        }
    }

    @ViewBuilder
    private func buildItemConfirmation(confirmationClosure: @escaping TimelineEntryConfirmationClosure) -> some View {
        TimelineItemCellInlineActionsView(confirmClosure: {
            withAnimation { self.itemConfirmed = true }
            confirmationClosure(.confirm)
        }, denyClosure: {
            withAnimation { self.itemDenied = true }
            confirmationClosure(.deny)
        })
        .frame(maxHeight: self.itemConfirmed ? 0 : .none, alignment: .top)
        .clipped()
    }
}

private struct DetailsView: View {

    private let detail: TimelineDisplayable.Entry.Detail

    init(detail: TimelineDisplayable.Entry.Detail) {
        self.detail = detail
    }

    var body: some View {
        self.buildAttributes(for: self.detail.attributes)
    }

    private func buildAttributes(for attributes: [TypedField]) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(attributes, id: \.id) { attribute in
                HStack(alignment: .top, spacing: 7) {
                    if let icon = attribute.icon {
                        MaisonKitImage(source: .styledImage(identifier: icon))
                            .frame(width: 16, height: 16)
                    }
                    Group {
                        if !attribute.title.isEmpty {
                            Text(verbatim: attribute.title)
                                .style("subtitle")
                        }
                        Text(verbatim: attribute.value.toString())
                            .style("title")
                    }
                    .lineLimit(2)
                    .frame(minHeight: 16)
                }
            }.fixedSize(horizontal: false, vertical: true)
        }
    }
}

private struct VerticalLine: View {

    private enum Constants {
        static let defaultWidth: CGFloat = 1
    }

    private let width: CGFloat

    init(width: CGFloat = Constants.defaultWidth) {
        self.width = width
    }

    var body: some View {
        Rectangle()
            .frame(width: self.width)
            .foregroundColor(.clear)
            .style("line")
    }
}
