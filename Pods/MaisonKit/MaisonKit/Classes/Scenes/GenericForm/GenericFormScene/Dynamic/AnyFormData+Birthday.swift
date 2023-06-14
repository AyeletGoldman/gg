// Copyright © 2023 LVMH. All rights reserved.

import Foundation

public extension AnyFormData {
    subscript(dynamicMember member: String) -> Birthday? {
        get { self.data[member] as? Birthday }
        set { self.updateValue(newValue, forKey: member) }
    }
}
