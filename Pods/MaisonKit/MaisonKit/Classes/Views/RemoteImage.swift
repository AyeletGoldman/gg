// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import Kingfisher
import StylableSwiftUI

struct RemoteImage: SwiftUI.View {

    var url: URL

    var body: some SwiftUI.View {
        KFImage(self.url)
            .placeholder({ Color.clear.style("image[loading]/background") })
            .resizable()
    }
}
