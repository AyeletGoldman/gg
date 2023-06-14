// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

extension View {
    func inverseMask<M: View>(_ mask: M) -> some View {
        let inversed = mask
            .foregroundColor(.black)  // hide foreground
            .background(Color.white)  // let the background stand out
            .compositingGroup()
            .luminanceToAlpha()
        return self.mask(inversed)
    }
}
