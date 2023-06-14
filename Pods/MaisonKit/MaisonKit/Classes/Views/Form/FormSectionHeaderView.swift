// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct FormSectionHeaderView: View {

    let title: String

    init(title: String) {
        self.title = title
    }

    var body: some View {
        StylableGroup("heading") {
            Text(verbatim: self.title)
                .style("title")
                .padding(.vertical, 18)
        }
    }
}
