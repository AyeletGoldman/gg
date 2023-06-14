// Copyright © 2023 LVMH. All rights reserved.

import Foundation

public extension FormTypeState {

    /// A convenience function to return a form type's state based on whether it is enabled and/or selected
    /// - Parameters:
    ///   - isEnabled: whether the field is enabled; if the field is not enabled we immediately return `.disabled`
    ///   - isSelected: whether the field is selected or not.
    /// - Returns: the `FormTypeState` that should be applied based on the input given.
    static func state(isEnabled: Bool, isSelected: Bool) -> FormTypeState? {
        if !isEnabled {
            return .disabled
        }

        return isSelected ? .selected : nil
    }
}
