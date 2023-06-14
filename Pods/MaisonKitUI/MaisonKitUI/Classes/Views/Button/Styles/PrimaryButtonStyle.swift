// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

public extension ButtonStyle where Self == MaisonKitButtonStyle {

    /// A `ButtonStyle` that indicates a primary action in a screen
    static var primary: Self {
        return MaisonKitButtonStyle(identifier: "button-primary")
    }
}

#if DEBUG
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(title: "Label", action: { })
            Button(title: "Label", isLoading: true, action: { })
            Button(title: "Label", action: { }).disabled(true)
            Button(icon: .system(name: "star"), action: {})
            Button(icon: .system(name: "star"), isLoading: true, action: {})
            Button(icon: .system(name: "star"), action: { }).disabled(true)
            Button(title: "Label", icon: .system(name: "star"), action: { })
            Button(title: "Label", icon: .system(name: "star"), action: { }).disabled(true)
            Button(title: "Label", icon: .system(name: "star"), isLoading: true, action: { })
            Button(title: "Label", icon: .system(name: "star"), isLoading: false, expandHorizontally: true, action: { })
        }
        .buttonStyle(.primary)
        .padding()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
