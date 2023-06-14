// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// The Form Group is the master component which contains all form elements. It can be used as a single form, or as a means to distinguish sections within a form.
/// It is made up of multiple Form Fields, the topmost of which may also be used as a title.
public struct FormGroup<Content: View>: View {

    private let content: Content

    /// Creates a new `FormGroup` with the given content
    /// - Parameter content: the view to display in the form group
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        StylableGroup("form-group") {
            self.content
        }
    }
}
