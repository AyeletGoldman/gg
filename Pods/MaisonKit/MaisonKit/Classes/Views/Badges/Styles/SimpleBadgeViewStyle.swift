// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A style for `BadgeView` that only shows the title with a `badge` stylable group
struct SimpleBadgeViewStyle: BadgeViewStyle {

    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        StylableGroup("badge") {
            configuration.title?
                .style("title")
                .padding(.horizontal, 4.5)
                .style("background")
        }
    }
}
