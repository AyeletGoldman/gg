// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// Regular generic form field view design could wrap regular desined fields with title and value
public struct GFFieldView<Content: View, Accessory: View>: View {

    private let title: String
    private let tag: BadgeViewData?
    private let isRequired: Bool
    private let axis: Axis
    private let content: Content
    private let accessory: Accessory?

    /// Creates a new GFFieldView with a view for the content and any accessories.
    /// Accessories are meant to display a single icon, and any views placed in this closure are stacked on a ZStack.
    /// - Parameters:
    ///   - title: The field title
    ///   - isRequired: Whether to show required indicator or not
    ///   - axis: The axis of how to place the title and the content.
    ///   - content: The field contet view to show below the title
    ///   - accessory: The accessory views to display next to the content
    public init(title: String,
                isRequired: Bool = false,
                axis: Axis = .vertical,
                tag: BadgeViewData? = nil,
                @ViewBuilder content: () -> Content,
                @ViewBuilder accessory: () -> Accessory) {
        self.title = title
        self.isRequired = isRequired
        self.axis = axis
        self.tag = tag
        self.content = content()
        self.accessory = accessory()
    }

    public var body: some View {
        Group {
            if self.axis == .vertical {
                VStack(alignment: .leading, spacing: 5) {
                    self.buildMain()
                }
            } else {
                HStack(alignment: .center, spacing: 5) {
                    self.buildMain()
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    private func buildMain() -> some View {
        HStack(alignment: .top, spacing: 0) {
            Text(verbatim: self.title)
                .style(self.axis == .horizontal ? "title" : "subtitle")
            if self.isRequired {
                RequiredFieldIndicator()
            }
            if self.axis == .vertical, let tag {
                Spacer()
                BadgeView(title: tag.title).badgeViewStyle(SecondaryBadgeViewStyle(variant: tag.variant))
            }
        }
        self.buildContentAndAccessory()
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    private func buildContentAndAccessory() -> some View {
        HStack(alignment: self.axis == .vertical ? .top : .center) {
            self.content
            Spacer(minLength: 0)
            if let accessory {
                ZStack {
                    accessory
                }
            }
        }
    }
}

public extension GFFieldView where Accessory == Never {

    /// Creates a new GFFieldView
    /// - Parameters:
    ///   - title: The field title
    ///   - isRequired: Whether to show required indicator or not
    ///   - axis: The axis of how to place the title and the content.
    ///   - content: The field contet view to show below the title
    init(title: String, isRequired: Bool = false, tag: BadgeViewData? = nil, axis: Axis = .vertical, @ViewBuilder content: () -> Content) {
        self.title = title
        self.isRequired = isRequired
        self.axis = axis
        self.tag = tag
        self.content = content()
        self.accessory = nil
    }
}

public extension View {

    /// Style regular generic form field
    /// - Parameters:
    ///   - variant: The input identifier variant
    /// - Returns: this view wrapped in the necessary stylist identifiers for a field and padded to match the rest of input views.
    @ViewBuilder
    func wrapToGFField(variant: GFInputVariant?) -> some View {
        self.wrapToGFField(variant: variant?.rawValue)
    }

    /// Style regular generic form field
    /// - Parameters:
    ///   - variant: The input identifier variant
    /// - Returns: this view wrapped in the necessary stylist identifiers for a field and padded to match the rest of input views.
    @ViewBuilder
    func wrapToGFField(variant: String? = nil) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "input", variant: variant)) {
            self
                .padding(.top, 13)
                .padding(.bottom, 11)
                .padding(.horizontal, 12)
                .addStyledRowDivider()
                .padding(.horizontal)
                .style("background")
        }
    }
}

/// Enum for the input identifier variant
public enum GFInputVariant: String {
    /// Blurred variant for no value/ placeholder status
    case blurred
    /// Disabled variant
    case disabled
    /// Error variant for marking the field with error style
    case error
}
