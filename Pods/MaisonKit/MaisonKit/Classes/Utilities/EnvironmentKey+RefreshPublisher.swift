// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import Combine

struct RefreshPublisher: EnvironmentKey {
    static var defaultValue: PassthroughSubject<Void, Never>?
}

extension EnvironmentValues {
    var refreshPublisher: PassthroughSubject<Void, Never>? {
        get {
            return self[RefreshPublisher.self]
        }
        set {
            self[RefreshPublisher.self] = newValue
        }
    }
}
