// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that stacks items horizontally until they don't fit anymore and then puts them in the next line
struct WrappedHStack: View {
    /// The total items count
    private let numberOfItems: Int
    /// The item view builder
    private let itemBuilder: (Int) -> any View
    /// The horizontal spacing between items
    private let horizontalSpacing: CGFloat
    /// The vertical spacing between items
    private let verticalSpacing: CGFloat

    init(numberOfItems: Int,
         horizontalSpacing: CGFloat = 5,
         verticalSpacing: CGFloat = 10,
         itemBuilder: @escaping (Int) -> any View) {
        self.numberOfItems = numberOfItems
        self.itemBuilder = itemBuilder
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }

    init(items: [any View],
         horizontalSpacing: CGFloat = 5,
         verticalSpacing: CGFloat = 10) {
        self.numberOfItems = items.count
        self.itemBuilder = { items[$0] }
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
            ForEach(0..<self.numberOfItems, id: \.self) { index in
                self.itemBuilder(index).eraseToAnyView()
                    .padding(.trailing, self.horizontalSpacing)
                    .padding(.vertical, self.verticalSpacing/2)
                    .alignmentGuide(.leading, computeValue: { viewDimensions in
                        if abs(width - viewDimensions.width) > proxy.size.width {
                            width = 0
                            height -= viewDimensions.height
                        }
                        let result = width
                        if index == self.numberOfItems - 1 {
                            width = 0 // last item
                        } else {
                            width -= viewDimensions.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if index == self.numberOfItems - 1 {
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

struct WrappedHStack_Previews: PreviewProvider {

    static private let items = [
        "Hello",
        "This ",
        "Is",
        "A",
        "Very different view",
        "Can",
        "We",
        "Make this very long and then see what would happen",
        "Hello",
        "Hello"
    ]

    static var previews: some View {
        VStack {
            WrappedHStack(items: [
                Text("Hello"),
                Text("This "),
                Text("Is"),
                Text("A"),
                Text("Very different view"),
                Text("Can"),
                Text("We"),
                Text("Make this very long and then see what would happen").lineLimit(1),
                Text("Hello"),
                Text("Hello").background(Color.red)
            ])
            Text("_____________")
            WrappedHStack(numberOfItems: self.items.count) { index in
                Text(self.items[index]).lineLimit(1)
            }

        }
        .previewLayout(.sizeThatFits)
    }
}
