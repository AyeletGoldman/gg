// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

public extension Tag {

    /// A convenience to create a `Tag` for with the 'icon-mine' image identifier.
    static var mine: some View {
        Tag(icon: .styledImage(identifier: "icon-mine")).tagStyle(.primaryIcon)
    }
}
