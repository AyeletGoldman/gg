// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var isLoading: Bool {
        get { self[Bool.self] }
        set { self[Bool.self] = newValue }
    }
}

extension Bool: EnvironmentKey {
    public static var defaultValue: Bool = false
}

public extension View {

    /// Set the loading view state.
    /// - Parameter isLoading: Whether it's loading or not.
    /// - Returns: The view with the loading state passed as an environment variable
    func loading(_ isLoading: Bool = true) -> some View {
        self.environment(\.isLoading, isLoading)
    }
}
