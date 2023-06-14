// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension View {
    func asUIBarButtonItem() -> UIBarButtonItem? {
        guard let view = UIHostingController(rootView: self).view else { return nil }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        let button = UIBarButtonItem(customView: view)
        return button
    }
}
