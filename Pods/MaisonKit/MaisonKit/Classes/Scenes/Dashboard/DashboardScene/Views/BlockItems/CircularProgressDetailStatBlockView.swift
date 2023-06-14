// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct CircularProgressDetailStatBlockView: View {

    public struct Data {
        let title: String
        let subtitle: String
        let progressTitle: String?
        let progress: CGFloat // between 0 and 1

        public init(title: String, subtitle: String, progressTitle: String? = nil, progress: CGFloat) {
            self.title = title
            self.subtitle = subtitle
            self.progressTitle = progressTitle
            self.progress = progress
        }
    }

    let data: Data

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(self.data.title)
                    .style("title")
                Text(self.data.subtitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .style("subtitle")
            }
            .frame(maxHeight: .infinity, alignment: .top)
            Spacer(minLength: 40)
            CircularProgressView(
                style: .single(self.data.progress),
                data: .init(title: self.data.progressTitle.flatMap {.text($0)}))
                .frame(height: 75)
        }.wrappedInStatView(variant: .circle)
    }
}

#if DEBUG
struct CircularProgressDetailStatBlockView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressDetailStatBlockView(
            data: .init(
                title: "OUTREACH SUCCESS",
                subtitle: "Total number of succesfully converted outreaches. Donec sed odio dui. Nullam id dolor id nibh.",
                progressTitle: "87%",
                progress: 0.87))
            .previewLayout(.fixed(width: 300, height: 150))
            .environmentObject(Stylist.circularProgressStylist)
    }
}

private extension Stylist {
    static var circularProgressStylist: Stylist {
        let stylist = Stylist()
        stylist.addStyle(identifier: "graph/background") { stylableView in
            stylableView.background(Color.blue.opacity(0.3))
        }
        stylist.addStyle(identifier: "graph-item[accent]/background") { stylableView in
            stylableView.background(Color.blue)
        }
        return stylist
    }
}
#endif
