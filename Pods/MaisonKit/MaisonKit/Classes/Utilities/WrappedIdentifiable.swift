// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct WrappedIdentifiable<T>: Identifiable {
    let id = UUID()
    let wrapped: T
}
