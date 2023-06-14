// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import Combine

private enum Constants {
    static let iconSize = CGSize(width: 20, height: 20)
}

/// Styled list item view
public struct ListItemView: View {

    private let title: String
    private let subtitle: String?
    private let icon: StylistIdentifier?
    private let axis: Axis

    /// Creates a new `ListItemView`
    /// - Parameters:
    ///   - title: The item title.
    ///   - subtitle: Optional. The item subtitle.
    ///   - icon: Optional. The item icon to present in the trailing side of the view.
    ///   - axis: The axis of how to place the title and the subtitle.
    public init(title: String,
                subtitle: String? = nil,
                icon: StylistIdentifier? = nil,
                axis: Axis = .vertical) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.axis = axis
    }

    public var body: some View {
        Group {
            if let subtitle = self.subtitle {
                if self.axis == .vertical {
                    self.buildItemWithVerticalSubtitle(subtitle: subtitle)
                } else {
                    self.buildItemWithHorizontalSubtitle(subtitle: subtitle)
                }
            } else {
                self.buildItemWithoutSubtitle()
            }
        }
        .padding(.vertical, 15)
    }

    @ViewBuilder
    private func buildItemWithVerticalSubtitle(subtitle: String) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                self.buildTitle()
                self.buildSubtitle(subtitle: subtitle)
                    .padding(.trailing, 30)
            }
            Spacer()
            self.buildIcon()
        }
    }

    @ViewBuilder
    private func buildItemWithHorizontalSubtitle(subtitle: String) -> some View {
        HStack(spacing: 0) {
            self.buildTitle()
            Spacer()
            self.buildSubtitle(subtitle: subtitle)
            self.buildIcon()
        }
    }

    @ViewBuilder
    private func buildItemWithoutSubtitle() -> some View {
        HStack {
            self.buildTitle()
            Spacer()
            self.buildIcon()
        }
    }

    @ViewBuilder
    private func buildTitle() -> some View {
        Text(verbatim: self.title)
            .style("title")
            // So we don't have a change in row size when switching to edit mode
            .frame(minHeight: self.subtitle == nil ? Constants.iconSize.height : 0)
    }

    @ViewBuilder
    private func buildSubtitle(subtitle: String) -> some View {
        Text(verbatim: subtitle)
            .fixedSize(horizontal: false, vertical: true)
            .style("body")
    }

    @ViewBuilder
    private func buildIcon() -> some View {
        if let icon = self.icon {
            MaisonKitImage(source: .styledImage(identifier: icon))
                .frame(width: Constants.iconSize.width, height: Constants.iconSize.height)
        }
    }
}

extension View {
    func stackWithDeleteButton(if isDeletable: Bool, onEditingPress: @escaping () -> Void) -> some View {
        HStack {
            if isDeletable {
                MaisonKitImage(source: .styledImage(identifier: "icon-trash"))
                    .frame(width: Constants.iconSize.width, height: Constants.iconSize.height)
                    .onTapGesture(perform: onEditingPress)
                    .transition(.asymmetric(insertion: .opacity, removal: .identity))
            }
            self
        }
    }
}
