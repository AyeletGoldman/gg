// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension Array where Element == Flag {
    func asDictionary() -> [FlagName: Bool] {
        return self.reduce([:]) { acc, next in
            var res = acc
            res[next.name] = next.isEnabled
            return res
        }
    }
}
