// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A single item in a pulldown menu. Since these are native components (`Menu` the only available options are to set the title and a possible icon)
/// This component sets the styles to match the designs, but in reality the system discards most modifications and uses its own display.
public struct PulldownItem: View {

    private let title: String
    private let icon: ImageSource?

    /// Creates a new `PulldownItem` with the given title and image source.
    /// - Parameters:
    ///   - title: The title to display on the leading edge of the item. This title will be styled as `title` but the system currently overrides all styling information.
    ///   - icon: Optional. An icon to display on the trailing edge of the item.
    public init(title: String, icon: ImageSource? = nil) {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        StylableGroup("pulldown-item") {
            HStack {
                Text(self.title).style("title")
                Spacer()
                if let icon {
                    MaisonKitImage(source: icon)
                        .frame(width: 20, height: 20)
                }
            }.padding(.vertical, 12)
            .style("background")
        }
    }
}

#if DEBUG
struct PulldownItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PulldownItem(title: "Hello", icon: .system(name: "star"))
            PulldownItem(title: "Hello", icon: nil)
        }
        .padding(.horizontal)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
