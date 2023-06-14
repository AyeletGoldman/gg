// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct NPSKPIItemTitle: View {

    private let value: Int
    private let maximumValue: Int

    init(value: Int,
         maximumValue: Int) {
        self.value = value
        self.maximumValue = maximumValue
    }

    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 0) {
            Text(verbatim: "\(self.value)").style("title")
            Text(verbatim: "/\(self.maximumValue)").style("body")
        }
    }
}
