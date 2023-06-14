// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that displays a small excerpt of the whole text, with a button on the trailing edge
/// of the view to expand the view completely. Once the view has been expanded it cannot
/// be contracted again.
public struct Expandable: View {

    @State private var isExpanded = false

    private let text: String
    private let expandButtonTitle: String
    private let lineLimit: Int

    /// Creates a new `Expandable` component.
    /// - Parameters:
    ///   - text: the text to display. This string will be cut at the beginning.
    ///   - expandButtonTitle: The title of the button to show the whole content.
    ///   The recommendation here is to use a small word, like "more" in English.
    ///   - lineLimit: The number of lines from the main text that will be shown when the text is contracted.
    public init(text: String,
                expandButtonTitle: String,
                lineLimit: Int = 1) {
        self.text = text
        self.lineLimit = lineLimit
        self.expandButtonTitle = expandButtonTitle
    }

    @ViewBuilder
    private var moreButton: some View {
        Button(action: {
            self.isExpanded = true
        }, label: {
            Text(verbatim: self.expandButtonTitle)
                .style("title")
        })
        .buttonStyle(.plain)
        .padding(.trailing)
    }

    public var body: some View {
        StylableGroup("expandable") {
            VStack {
                HStack {
                    Text(verbatim: self.text)
                        .style("body")
                        .lineLimit(self.isExpanded ? nil : self.lineLimit)
                    if !self.isExpanded {
                        self.moreButton
                    }
                }
                .padding(.vertical, 8)
                Divider()
            }.style("background")
        }
        .animation(.easeOut, value: self.isExpanded)
    }
}

#if DEBUG
struct Expandable_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable line_length
        Expandable(text: """
Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam
""",
                   expandButtonTitle: "more")
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
