// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var pairedInformationStyle: AnyPairedInformationViewStyle {
        get { self[PairedInformationViewStyleKey.self] }
        set { self[PairedInformationViewStyleKey.self] = newValue }
    }
}

struct PairedInformationViewStyleKey: EnvironmentKey {
    static var defaultValue = AnyPairedInformationViewStyle(style: BlockInformationViewStyle())
}
