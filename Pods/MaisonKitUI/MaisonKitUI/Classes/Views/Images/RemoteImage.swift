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

#if DEBUG
struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: URL(string: "https://picsum.photos/200")!)
        .frame(width: 200, height: 200)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
