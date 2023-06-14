// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

extension UINavigationItem {
    func setCustomViewNavigationBarTitle(_ title: String, stylistGroup: String, stylist: Stylist) {
        let titleView: some View = StylableGroup(stylistGroup) {
            Text(title)
                .style("title")
                .fixedSize()
        }.environmentObject(stylist)
        let view = UIHostingController(rootView: titleView).view
        view?.backgroundColor = .clear
        self.titleView = view
    }
}
