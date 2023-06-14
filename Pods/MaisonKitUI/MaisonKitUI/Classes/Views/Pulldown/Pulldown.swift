// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A native Menu implementaiton with a title on the leading edge and an optional icon on the trailing edge for each element
public struct PulldownMenu<Option: Identifiable, Label: View>: View {

    let options: [Option]
    let titleForOption: (Option) -> String
    let iconForOption: ((Option) -> ImageSource?)?
    let onSelectedOption: (Option) -> Void
    let label: Label

    /// Creates a new `PulldownMenu` with the given parameters
    /// - Parameters:
    ///   - options: the array of options to display on the menu.
    ///   - titleForOption: A closure that will return the title for the row that the given option is in
    ///   - iconForOption: Optional. A closure that will return the image source for the row that the given option is in. Defaults to `nil`.
    ///   - onSelectedOption: A closure to invoke when an option is selected.
    public init(options: [Option],
                titleForOption: @escaping (Option) -> String,
                iconForOption: ((Option) -> ImageSource?)? = nil,
                onSelectedOption: @escaping (Option) -> Void,
                label: () -> Label) {
        self.options = options
        self.titleForOption = titleForOption
        self.iconForOption = iconForOption
        self.onSelectedOption = onSelectedOption
        self.label = label()
    }

    public var body: some View {
        Menu(content: {
            StylableGroup("pulldown") {
                ForEach(self.options) { option in
                    Button(action: {
                        self.onSelectedOption(option)
                    }, label: {
                        PulldownItem(title: self.titleForOption(option), icon: self.iconForOption?(option))
                    })
                }.style("background")
            }
        }, label: {
            self.label
        })

    }
}

#if DEBUG
struct PulldownMenu_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            PulldownMenu(options: [
                            Option(title: "Test"),
                            Option(title: "Test"),
                            Option(title: "Test"),
                            Option(title: "Test")
                         ],
                         titleForOption: { $0.title },
                         onSelectedOption: { _ in },
                         label: { Text("Tap me") })
        }
        .padding()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
