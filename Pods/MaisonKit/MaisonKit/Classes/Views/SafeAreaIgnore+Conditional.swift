// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

extension View {
    @ViewBuilder
    func edgesIgnoringSafeArea(_ edges: Edge.Set, if condition: Bool) -> some View {
        if condition {
            self.edgesIgnoringSafeArea(edges)
        } else {
            self
        }
    }
}
