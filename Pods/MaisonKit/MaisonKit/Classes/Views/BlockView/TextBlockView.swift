// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that displays a centered piece of text over another text, with a small spacing between them.
struct TextBlockView: View {

    let title: String
    let subtitle: String?

    var body: some View {
        BlockView(titleView: {
            Text(verbatim: self.title)
                .frame(maxWidth: .infinity)
                .fixedSize(horizontal: false, vertical: true)
                .style("title")
        }, subtitle: self.subtitle)
    }
}

struct TextBlockView_Previews: PreviewProvider {
    static var previews: some View {
        TextBlockView(title: "Test", subtitle: "This is a subtitle")
    }
}
