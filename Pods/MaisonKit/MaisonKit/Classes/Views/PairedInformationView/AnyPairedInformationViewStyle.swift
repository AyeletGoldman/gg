// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct AnyPairedInformationViewStyle: PairedInformationViewStyle {
    private var _makeBody: (Configuration) -> AnyView

    init<S: PairedInformationViewStyle>(style: S) {
        _makeBody = { configuration in
            style.makeBody(configuration: configuration).eraseToAnyView()
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
