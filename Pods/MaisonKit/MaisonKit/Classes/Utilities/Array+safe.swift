// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension Array {
    /// Only accesses an array by index if it's safe, otherwise returns `nil`
    subscript(safe index: Index) -> Element? {
        return 0 <= index && index < count ? self[index] : nil
    }
}
