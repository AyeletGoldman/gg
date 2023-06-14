// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

extension TagStyle {

    @ViewBuilder
    func buildDefaultLayout(configuration: Configuration,
                            tagPath: String = "tag-primary",
                            variant: TagVariant?,
                            padded: Bool) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: tagPath, variant: variant)) {
            configuration.title
                .padding(.horizontal, 4)
                .padding(.vertical, padded ? 5 : 2)
                .style("background")
        }
    }
}
