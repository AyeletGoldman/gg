// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that displays a view over  text, with a small spacing between them.
struct BlockView<TitleView: View>: View {

    let titleView: TitleView
    let subtitle: String?

    init(titleView: () -> TitleView, subtitle: String?) {
        self.titleView = titleView()
        self.subtitle = subtitle
    }

    var body: some View {
        VStack(spacing: 5) {
            self.titleView
                .frame(maxHeight: .infinity)
            if let subtitle = subtitle {
                Text(verbatim: subtitle)
                    .frame(maxWidth: .infinity, alignment: .bottom)
                    .style("subtitle")
            }
        }
    }
}
