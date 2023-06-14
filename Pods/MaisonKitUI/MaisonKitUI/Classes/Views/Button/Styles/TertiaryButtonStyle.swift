// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

public extension ButtonStyle where Self == MaisonKitButtonStyle {

    /// A `ButtonStyle` that indicates a tertiary action in a screen
    static var tertiary: Self {
        return MaisonKitButtonStyle(identifier: "button-tertiary",
                                    padding: EdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7))
    }
}

#if DEBUG
struct TertiaryButton_Previews: PreviewProvider {
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
        .buttonStyle(.tertiary)
        .padding()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
