// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension AvailabilityVariant {
    var color: Color {
        switch self.context {
        case .color(let hex):
            return Color(hex: hex)
        default:
            return .clear
        }
    }

    var stylistVariant: String? {
        switch self.context {
        case .identifier(let variant):
            return variant
        case .color:
            return nil
        }
    }
}
