// Copyright © 2020 LVMH. All rights reserved.

import Foundation

private class BundleHelper { }

extension Bundle {
    static let maisonKit: Bundle = {
        return Bundle(for: BundleHelper.self)
    }()
}
