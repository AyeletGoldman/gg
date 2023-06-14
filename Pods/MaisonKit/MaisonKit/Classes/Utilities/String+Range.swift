// Copyright © 2021 LVMH. All rights reserved.

import Foundation

private enum Labels {
    // swiftlint:disable line_length
    static let rangeFormat = MKLocalizedString("utilities.range",
                                               comment: "A range of two items. The first placeholder is the lower bound and the second is the upper bound. Usually used for time ranges and price ranges.")
    // swiftlint:enable line_length
}

extension String {
    static func range(from low: String, to high: String) -> String {
        return String(format: Labels.rangeFormat, low, high)
    }
}
