// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

struct StatRowView<Item1: View, Item2: View>: View {

    private let item1: Item1
    private let item2: Item2

    @State private var height: CGFloat = .zero

    private var approximateMaxHeight: CGFloat {
        return 120
    }

    public init(_ item1: Item1, _ item2: Item2) {
        self.item1 = item1
        self.item2 = item2
    }

    private func alignmentGuideComputValue(dimension: ViewDimensions) -> CGFloat {
        DispatchQueue.main.async { // << dynamically detected - needs to be async !!
            let calculatedHeight = dimension.height < self.approximateMaxHeight ? max(dimension.height, self.height) : 0
            if calculatedHeight != 0, calculatedHeight != self.height {
                self.height = calculatedHeight
            }
        }
        return dimension[.top]
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 15) {
            self.item1
                .frame(minHeight: height)
                .alignmentGuide(.top, computeValue: alignmentGuideComputValue)
            self.item2
                .frame(minHeight: height)
                .alignmentGuide(.top, computeValue: alignmentGuideComputValue)
        }
    }
}
