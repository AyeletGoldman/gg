// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TimelineSectionHeader: View {

    private enum Constants {
        static let imageSize = CGSize(width: 20, height: 20)
    }

    private let title: String
    private let image: ImageSource

    init(title: String, image: ImageSource = .styledImage(identifier: "icon-bullet")) {
        self.title = title
        self.image = image
    }

    var body: some View {
        StylableGroup("timeline-heading") {
            HStack(spacing: 5) {
                MaisonKitImage(source: self.image)
                    .frame(width: Constants.imageSize.width,
                           height: Constants.imageSize.height)
                    .unredacted()
                Text(verbatim: self.title).style("title")
                Spacer()
            }
            .padding(.leading, TimelineViewCell.Constants.leadingViewWitdh/2 - Constants.imageSize.width/2)
            .style("background")
        }
    }
}

struct TimelineSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        TimelineSectionHeader(title: "Upcoming")
    }
}
