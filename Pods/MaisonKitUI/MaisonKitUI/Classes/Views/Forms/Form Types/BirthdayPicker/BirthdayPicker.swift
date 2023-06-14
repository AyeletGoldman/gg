// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// Birthday picker
public struct BirthdayPicker: View {

    /// Binded selected date
    @Binding public var selection: Birthday

    /// Creates a new instanse of `BirthdayPicker`
    /// - Parameter selection: Binded selected date
    public init(selection: Binding<Birthday>) {
        self._selection = selection
    }

    public var body: some View {
        BirthdayPickerRepresentable(selection: self.$selection)
    }
}
