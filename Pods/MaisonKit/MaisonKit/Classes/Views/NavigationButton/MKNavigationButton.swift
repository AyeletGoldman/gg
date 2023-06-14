// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A fully-styled navigation button with several different configuration options.
public struct MKNavigationButton<Label: View>: View {

    /// The edge at which this button is at, which will apply different stylist group
    public enum EdgeStyle: String {
        /// A leading button, on the leading screen edge (left for LTR languages and right for RTL languages)
        case leading = "button-icon-left"
        /// A trailing button, on the trailing screen edge (right for LTR languages and left for RTL languages)
        case trailing = "button-icon-right"
    }

    private let edge: EdgeStyle
    private let label: () -> Label
    private let isDisabled: Bool
    private let action: () -> Void
    private let badgeTitle: String?

    public var body: some View {
        Button(action: self.action, label: self.buildLabel)
            .disabled(self.isDisabled)
            .buttonStyle(PlainButtonStyle())
    }

    private func buildLabel() -> some View {
        StylableGroup("navbar") {
            StylableGroup(StylistIdentifier.buildFullIdentifier(for: self.edge.rawValue, variant: self.isDisabled ? "disabled" : nil)) {
                HStack {
                    if self.edge == .trailing {
                        Spacer().frame(width: 6)
                    }
                    ZStack(alignment: .center) {
                        self.label()
                            .aspectRatio(contentMode: .fit)
                            .style("background")
                        if let title = self.badgeTitle {
                            BadgeView(title: title)
                                .badgeViewStyle(SimpleBadgeViewStyle())
                                .clipShape(Capsule())
                                .offset(x: 10, y: -10)
                        }
                    }
                    if self.edge == .leading {
                        Spacer().frame(width: 6)
                    }
                }
            }
            .frame(minHeight: 20)
            .contentShape(Rectangle())
        }
    }
}

public extension MKNavigationButton {
    /// Constructor to inisialize navigation button using an action and a closure for the label
    /// - Parameters:
    ///   - edge: the edge at which this button is in, leading or trailing
    ///   - label: a closure to create a view to use as the label
    ///   - isDisabled: whether the button is disabled or not
    ///   - badgeTitle: the optional title of a badge to overlay on the button
    ///   - action: a closure to invoke when the button is tapped
    init(edge: EdgeStyle, label: @escaping () -> Label, isDisabled: Bool = false, badgeTitle: String? = nil, action: @escaping () -> Void) {
        self.edge = edge
        self.label = label
        self.isDisabled = isDisabled
        self.action = action
        self.badgeTitle = badgeTitle
    }
}

public extension MKNavigationButton where Label == AnyView {

    /// Constructor to initialize navigation button using an action and a text label
    /// - Parameters:
    ///   - edge: the edge at which this button is in, leading or trailing
    ///   - label: a `String` to use as the title
    ///   - isDisabled: whether the button is disabled or not
    ///   - badgeTitle: the optional title of a badge to overlay on the button
    ///   - action: a closure to invoke when the button is tapped
    init(edge: EdgeStyle, label: String, isDisabled: Bool = false, badgeTitle: String? = nil, action: @escaping () -> Void) {
        self.edge = edge
        self.label = { Text(verbatim: label).style("title").eraseToAnyView() }
        self.isDisabled = isDisabled
        self.action = action
        self.badgeTitle = badgeTitle
    }
}

public extension MKNavigationButton where Label == AnyView {

    /// Constructor to initialize navigation button using an action and an icon source
    /// - Parameters:
    ///   - edge: the edge at which this button is in, leading or trailing
    ///   - iconSource: a  source for an icon to use as the title view
    ///   - isDisabled: whether the button is disabled or not
    ///   - badgeTitle: the optional title of a badge to overlay on the button
    ///   - action: a closure to invoke when the button is tapped
    init(edge: EdgeStyle, iconSource: ImageSource, isDisabled: Bool = false, badgeTitle: String? = nil, action: @escaping () -> Void) {
        self.edge = edge
        self.label = { MaisonKitImage(source: iconSource).eraseToAnyView() }
        self.isDisabled = isDisabled
        self.action = action
        self.badgeTitle = badgeTitle
    }
}

public extension MKNavigationButton where Label == AnyView {

    /// Constructor to initialize navigation button using an action and an icon label
    /// - Parameters:
    ///   - edge: the edge at which this button is in, leading or trailing
    ///   - icon: an identifier to get the source for the image view that will be the button label
    ///   - isDisabled: whether the button is disabled or not
    ///   - badgeTitle: the optional title of a badge to overlay on the button
    ///   - action: a closure to invoke when the button is tapped
    init(edge: EdgeStyle, icon: StylistIdentifier, isDisabled: Bool = false, badgeTitle: String? = nil, action: @escaping () -> Void) {
        let source = ImageSource.styledImage(identifier: icon)
        self.init(edge: edge, iconSource: source, isDisabled: isDisabled, badgeTitle: badgeTitle, action: action)
    }
}
