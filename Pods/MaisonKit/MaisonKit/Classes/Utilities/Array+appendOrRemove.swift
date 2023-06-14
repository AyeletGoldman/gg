// Copyright © 2020 LVMH. All rights reserved.

import Foundation

extension Array where Element: Equatable {
    mutating func appendOrRemove(element: Element) {
        if let index = self.firstIndex(of: element) {
            self.remove(at: index)
        } else {
            self.append(element)
        }
    }
}
