// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that stacks items horizontally until they don't fit anymore and then puts them in the next line, "tag cloud" style
/// Allows items to be selected and exposes that selection via the `selectedItems` property.
struct TagCloud<ItemView: View & Identifiable>: View {
    /// The items to put in the stack
    private let items: [ItemView]
    /// The horizontal spacing between items
    private let horizontalSpacing: CGFloat
    /// The vertical spacing between items
    private let verticalSpacing: CGFloat

    init(items: [ItemView],
         horizontalSpacing: CGFloat = 5,
         verticalSpacing: CGFloat = 10) {
        self.items = items
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }

    /// Helper to calculate the total height of the view. The height changes depending on
    /// the number of items in the stack and their width.
    @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometryProxy in
                self.generateContent(in: geometryProxy)
            }
        }
        .frame(height: self.totalHeight)
    }

    private func generateContent(in proxy: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.items, id: \.id) { item in
                item
                    .padding(.trailing, self.horizontalSpacing)
                    .padding(.vertical, self.verticalSpacing/2)
                    .alignmentGuide(.leading, computeValue: { viewDimensions in
                        if abs(width - viewDimensions.width) > proxy.size.width {
                            width = 0
                            height -= viewDimensions.height
                        }
                        let result = width
                        if let last = self.items.last, last.id == item.id {
                            width = 0 // last item
                        } else {
                            width -= viewDimensions.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if let last = self.items.last, last.id == item.id {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(self.viewHeightReader(self.$totalHeight))
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct TextTagCloud_Previews: PreviewProvider {

    struct PreviewText: View, Identifiable {
        let id = UUID()
        var text: String

        var body: some View {
            Text(self.text).lineLimit(1)
        }
    }

    static var previews: some View {
        return Group {
            TagCloud(items: [
                PreviewText(text: "Hello"),
                PreviewText(text: "This "),
                PreviewText(text: "Is"),
                PreviewText(text: "A"),
                PreviewText(text: "Very different view"),
                PreviewText(text: "Can"),
                PreviewText(text: "We"),
                PreviewText(text: "Make this very long and then see what would happen"),
                PreviewText(text: "Hello"),
                PreviewText(text: "Hello")
            ])
        }
        .previewLayout(.sizeThatFits)
        .environmentObject(Stylist.unstyled)
    }
}
