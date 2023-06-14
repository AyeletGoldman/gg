// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct AnyBadgeViewStyle: BadgeViewStyle {
    private var _makeBody: (Configuration) -> AnyView

    init<S: BadgeViewStyle>(style: S) {
        _makeBody = { configuration in
            style.makeBody(configuration: configuration).eraseToAnyView()
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
