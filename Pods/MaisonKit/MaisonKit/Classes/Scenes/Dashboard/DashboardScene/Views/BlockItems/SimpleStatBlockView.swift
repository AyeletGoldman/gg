// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct SimpleStatBlockView: View {

    public struct Data {
        let title: String
        let value: String
        let subtitle: String?

        public init(title: String, value: String, subtitle: String? = nil) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
        }
    }

    let data: Data

    public var body: some View {
        Group {
            TitleValueAndSubtitleStatView(data: .init(title: self.data.title,
                                          value: self.data.value,
                                          subtitle: nil))
                .frame(maxWidth: .infinity, alignment: .leading)
            if let subtitle = self.data.subtitle {
                Spacer().frame(height: 7)
                Text(verbatim: subtitle)
                    .style("subtitle")
            } else {
                Spacer()
            }
        }.wrappedInStatView()
    }
}

struct SimpleStatBlockView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SimpleStatBlockView(data: .init(title: "OUTREACH SALES",
                                       value: "24.568€",
                                       subtitle: nil))
            SimpleStatBlockView(data: .init(title: "OUTREACH SALES",
                                       value: "24.568€",
                                       subtitle: "150 transactions"))
        }.previewLayout(.fixed(width: 164, height: 96))
        .environmentObject(Stylist.unstyled)
    }
}
