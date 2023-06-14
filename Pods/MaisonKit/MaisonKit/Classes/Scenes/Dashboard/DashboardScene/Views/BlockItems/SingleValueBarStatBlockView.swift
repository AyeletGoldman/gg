// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct SingleValueBarStatBlockView: View {

    public struct Data {
        let title: String
        let value: String
        let subtitle: String?
        let progress: CGFloat // value between 0 and 1

        public init(title: String, value: String, subtitle: String? = nil, progress: CGFloat) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.progress = progress
        }
    }

    public let data: Data

    public var body: some View {
        VStack(spacing: 12) {
            TitleValueAndSubtitleStatView(data: .init(
                                        title: self.data.title,
                                        value: self.data.value,
                                        subtitle: self.data.subtitle))
                .frame(maxWidth: .infinity, alignment: .leading)
            ProgressBar(style: .single(self.data.progress))
                .frame(height: 5)
        }.wrappedInStatView(variant: .barSmall)
    }
}

#if DEBUG
struct SmallBarStatBlockView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SingleValueBarStatBlockView(data: .init(
                                    title: "OUTREACH SUCCESS",
                                        value: "870",
                                        subtitle: "of 1000 outreaches",
                                        progress: 870.0/1000))
            SingleValueBarStatBlockView(data: .init(
                                        title: "OUTREACH SUCCESS",
                                        value: "870",
                                        subtitle: nil,
                                        progress: 870.0/1000))
        }.previewLayout(.fixed(width: 164, height: 96))
        .environmentObject(Stylist.progressBarStylist)
    }
}
#endif
