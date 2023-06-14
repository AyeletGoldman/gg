// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct AnyFilterButtonStyle: FilterButtonStyle {
    private let _makeBody: (FilterButtonStyle.Configuration) -> AnyView

    init<S: FilterButtonStyle>(_ style: S) {
        self._makeBody = {
            style.makeBody(configuration: $0).eraseToAnyView()
        }
    }

    func makeBody(configuration: FilterButtonStyle.Configuration) -> AnyView {
        return self._makeBody(configuration)
    }
}
