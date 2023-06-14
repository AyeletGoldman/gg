// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A style or `BadgeView`s that only shows the icon.
public struct IconBadgeViewStyle: BadgeViewStyle {

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup("tag-primary-icon") {
            configuration.icon
                .frame(width: 12, height: 12)
                .padding(.horizontal, 2)
                .style("background")
        }
    }
}
