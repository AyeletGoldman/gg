// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct AppVersionView: View {

    var textStyle: StylistIdentifier?

    var body: some View {
        Text(verbatim: AppDetails.marketingVersion)
            .style(self.textStyle)
    }
}
