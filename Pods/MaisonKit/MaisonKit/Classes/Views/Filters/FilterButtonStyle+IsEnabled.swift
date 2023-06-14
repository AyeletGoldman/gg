// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension FilterButtonStyle {

    func getVariant(for configuration: Configuration) -> String? {
        guard configuration.isEnabled else { return "disabled" }
        return configuration.isSelected ? "selected" : nil
    }
}
