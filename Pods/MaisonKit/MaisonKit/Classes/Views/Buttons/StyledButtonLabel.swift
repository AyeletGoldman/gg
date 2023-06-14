// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct StyledButtonLabel: View {

    private enum Constants {
        static let defaultPadding = EdgeInsets(top: 6, leading: 6, bottom: 5, trailing: 7)
    }

    let text: String
    let icon: StylistIdentifier?
    let iconPosition: IconPosition
    let badge: String?
    let isLoading: Bool
    let iconSize: StyledIconSize
    let padding: EdgeInsets
    let isFullWidth: Bool

    init(text: String,
         icon: StylistIdentifier?,
         iconPosition: IconPosition = .leading,
         badge: String?,
         iconSize: StyledIconSize = .small,
         padding: EdgeInsets? = nil,
         isFullWidth: Bool = false,
         isLoading: Bool = false) {
        self.text = text
        self.icon = icon
        self.iconPosition = iconPosition
        self.badge = badge
        self.isLoading = isLoading
        self.iconSize = iconSize
        self.padding = padding ?? Constants.defaultPadding
        self.isFullWidth = isFullWidth
    }

    var body: some View {
        Label {
            HStack(spacing: 4) {
                Text(verbatim: self.text).style("title")
                    .padding(.vertical, 1)
                if let badge = self.badge {
                    BadgeView(title: badge)
                        .badgeViewStyle(SimpleBadgeViewStyle())
                }
                if self.isLoading {
                    LoadingView()
                        .frame(width: 18, height: 18)
                }
            }
        } icon: {
            if let icon = self.icon {
                MaisonKitImage(source: .styledImage(identifier: icon))
                    .frame(width: self.iconSize.width, height: self.iconSize.height)
            }
        }
        .labelStyle(StyledButtonLabelStyle(iconPosition: self.iconPosition))
        .padding(self.padding)
        .frame(maxWidth: self.isFullWidth ?.infinity : .none)
        .style("background")
    }
}

private struct StyledButtonLabelStyle: LabelStyle {

    private let iconPosition: IconPosition

    init(iconPosition: IconPosition = .leading) {
        self.iconPosition = iconPosition
    }

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 4) {
            if self.iconPosition == .leading {
                configuration.icon
            }
            configuration.title
            if self.iconPosition == .trailing {
                configuration.icon
            }
        }
    }
}
