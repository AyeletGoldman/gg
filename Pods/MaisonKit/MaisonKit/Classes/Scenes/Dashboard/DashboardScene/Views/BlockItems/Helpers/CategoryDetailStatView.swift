// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct CategoryDetailStatView: View {

    public struct Data {
        public let color: Color
        public let title: String
        public let subtitle: String

        public init(color: Color, title: String, subtitle: String) {
            self.color = color
            self.title = title
            self.subtitle = subtitle
        }
    }

    public let data: Data

    public var body: some View {
        StylableGroup("stat-item") {
            HStack(alignment: .bottom) {
                HStack(spacing: 5) {
                    Circle().frame(width: 7, height: 7)
                        .foregroundColor(self.data.color)
                    Text(self.data.title)
                        .style("title")
                }
                Spacer()
                Text(self.data.subtitle)
                    .style("subtitle")
            }
        }
    }
}

struct CategoryDetailStatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryDetailStatView(data: CategoryDetailStatView.Data(color: .red, title: "Jewellery", subtitle: "12.880€"))
        }.environmentObject(Stylist.unstyled)
        .previewLayout(.sizeThatFits)
    }
}
