// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFClearFieldButton: View {

    let action: () -> Void

    var body: some View {
        Button(action: self.action, label: {
            MaisonKitImage(source: .styledImage(identifier: "icon-clear"))
                .frame(width: 20, height: 20)
        }).padding(.leading, 6)
    }
}
