// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A view to show when a field is required
public struct RequiredFieldIndicator: View {

    public var body: some View {
        MaisonKitImage(source: .styledImage(identifier: "icon-required"))
            .frame(width: 12, height: 12)
    }
}
