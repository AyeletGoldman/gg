// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct LabeledValueView: View {

    let values: [LabeledValue]

    init(values: [LabeledValue]) {
        self.values = values
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            ForEach(Array(zip(self.values.indices, self.values)), id: \.0) { (_, item) in
                HStack(alignment: .top) {
                    Text(verbatim: item.label)
                        .style("subtitle")
                    Text(verbatim: item.value)
                        .style("title")
                }
            }
        }
    }
}
