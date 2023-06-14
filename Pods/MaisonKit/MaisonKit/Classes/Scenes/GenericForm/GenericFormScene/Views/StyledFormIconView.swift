// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct StyledFormIconView: View {

    var identifier: StylistIdentifier

    var body: some View {
        MaisonKitImage(source: .styledImage(identifier: self.identifier))
            .frame(width: 20, height: 20)
    }
}
