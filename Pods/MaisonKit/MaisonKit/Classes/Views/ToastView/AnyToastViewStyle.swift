// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct AnyToastViewStyle: ToastViewStyle {
    private var _makeBody: (Configuration) -> AnyView

    init<S: ToastViewStyle>(style: S) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
