// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import UIKit

final class SynchronousValueProvider<Value>: UIActivityItemProvider {
    let value: Value

    init(value: Value) {
        self.value = value
        super.init(placeholderItem: value)
    }

    override var item: Any {
        return self.value
    }
}
