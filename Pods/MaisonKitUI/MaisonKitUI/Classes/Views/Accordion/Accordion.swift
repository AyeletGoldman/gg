// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A vertically stacked list of items that can be "expanded" or "collapsed" to reveal the content associated with that item.
public struct Accordion: View {

    private let items: [Accordion.Item]
    @State private var expandedItemIDs: Set<Accordion.Item.ID>

    /// Creates a new `Accordion` element. The given `items` property will be used to populate the view,
    /// and each of the items in the `initiallyExpandedItemIDs` will be shown as expanded to start with.
    /// - Parameters:
    ///   - items: The items in the accordion. Each item will have a title and a body.
    ///   - initiallyExpandedItems: A set of initially-expanded item IDs
    public init(items: [Accordion.Item], initiallyExpandedItemIDs: Set<Accordion.Item.ID> = []) {
        self.items = items
        self.expandedItemIDs = initiallyExpandedItemIDs
    }

    public var body: some View {
        StylableGroup("accordion") {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.items) { item in
                    Divider()
                    self.buildTitle(for: item)
                    self.buildBody(for: item)
                        .padding(.bottom, self.expandedItemIDs.contains(item.id) ? 8 : 0)
                }.clipped()
            }.style("background")
        }
        .animation(.easeOut, value: self.expandedItemIDs)
    }

    @ViewBuilder
    private func buildBody(for item: Accordion.Item) -> some View {
        ScrollView {
            item.body.eraseToAnyView()
                .opacity(self.expandedItemIDs.contains(item.id) ? 1 : 0)
                .frame(height: self.expandedItemIDs.contains(item.id) ? nil : 0)
                .accessibilityIdentifier("Body content for \(item.id)")
        }
        .frame(maxHeight: item.maxHeight)
    }

    @ViewBuilder
    private func buildTitle(for item: Accordion.Item) -> some View {
        Button {
            if self.expandedItemIDs.contains(item.id) {
                self.expandedItemIDs.remove(item.id)
            } else {
                self.expandedItemIDs.insert(item.id)
            }
        } label: {
            HStack(spacing: 0) {
                Text(item.title).style("title")
                Spacer()
                MaisonKitImage(source: .styledImage(identifier: "icon-up"))
                    .frame(width: 20, height: 20)
                    .rotationEffect(.radians(self.expandedItemIDs.contains(item.id) ? .pi : 0))
            }.padding(.vertical, 8)
        }
        .accessibilityValue(item.title)
        .accessibilityIdentifier("Title button for \(item.id)")
    }
}

#if DEBUG
// swiftlint:disable line_length
private let html = """
<html><head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
html {
  line-height: 1.25;
  font-size: 1.25em;
}
a {
  color: red;
  font-style: italic;
}
</style>
</head><body>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem <a href="https://example.com">Privacy Policy</a></body></html>
"""

struct Accordion_Previews: PreviewProvider {

    @State private static var isExpanded = false

    static var previews: some View {
        ScrollView {
            Accordion(items: [
                Accordion.Item(title: "Title",
                               body: "Read our [Privacy Policy](https://example.com) here."),
                Accordion.Item(title: "Long text",
                               maxHeight: 100,
                               body: Text("Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem.")),
                Accordion.Item(title: "Title",
                               body: Text("Hello")),
                Accordion.Item(title: "Html", html: html, didTapLink: { print("Tapped link: \($0)") })
            ])
        }
        .padding()
        .padding(.vertical, 50)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
