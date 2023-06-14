// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct StyledDivider: View {

    enum Orientation {
        case vertical
        case horizontal
    }

    var variant: String?
    var orientation: Orientation

    init(variant: String? = nil, orientation: Orientation = .horizontal) {
        self.variant = variant
        self.orientation = orientation
    }

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "divider", variant: self.variant)) {
            // We used to use a `Divider` here, but it is difficult to style
            // with the stylist (the background property didn't seem to work very well with clear backgrounds)
            // So instead we use a `Rectangle` of height 1 and set the foreground and accent colors to `.clear`.
            self.divider
                .accentColor(.clear)
                .foregroundColor(.clear)
                .style("background")
        }
    }

    @ViewBuilder
    private var divider: some View {
        switch orientation {
        case .horizontal:
            Rectangle().frame(maxWidth: .infinity,
                              minHeight: 1,
                              idealHeight: 1,
                              maxHeight: 1)
        case .vertical:
            Rectangle().frame(minWidth: 1,
                              idealWidth: 1,
                              maxWidth: 1,
                              maxHeight: .infinity)
        }
    }
}

private struct StyledRowDividerViewModifier: ViewModifier {

    let showDivider: Bool
    let position: DividerPosition
    let dividerVariant: String?

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if self.showDivider && self.position == .top {
                StyledDivider(variant: self.dividerVariant)
            }
            content
            if self.showDivider && self.position == .bottom {
                StyledDivider(variant: self.dividerVariant)
            }
        }
    }
}

/// The styled divider position
public enum DividerPosition {
    /// Above of the view
    case top
    /// Under to the view
    case bottom
}

extension View {

    /// Styled divider wrapped with stylist
    /// - Parameters:
    ///   - showDivider: whether show the divider or not
    ///   - position: the divider position
    ///   - dividerVariant: the stylist divider variant
    /// - Returns: A view with a divider in the position specified in the `position` parameter.
    public func addStyledRowDivider(if showDivider: Bool = true,
                                    position: DividerPosition = .bottom,
                                    dividerVariant: String? = nil) -> some View {
        return self.modifier(StyledRowDividerViewModifier(showDivider: showDivider,
                                                          position: position,
                                                          dividerVariant: dividerVariant))
    }
}

struct StyledDivider_Previews: PreviewProvider {
    static var previews: some View {
        StyledDivider()
    }
}
