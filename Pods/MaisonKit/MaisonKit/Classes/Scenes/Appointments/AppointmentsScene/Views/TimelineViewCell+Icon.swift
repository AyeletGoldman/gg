// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

extension TimelineViewCell {
    init(icon: ImageSource,
         title: String,
         subtitle: String? = nil,
         footer: String? = nil,
         tag: String? = nil,
         mediaItems: [MediaType] = [],
         detail: TimelineDisplayable.Entry.Detail = .empty,
         showDisclosureIndicator: Bool = false) {
        self.init(title: title,
                  subtitle: subtitle,
                  variant: nil,
                  leadingView: {
            return StylableGroup("timeline-icon") {
                Group {
                    MaisonKitImage(source: icon)
                        .frame(width: 20, height: 20, alignment: .center)
                }.frame(width: 34, height: 42)
                    .style("background")
            }
        },
                  footer: footer,
                  tag: tag,
                  mediaItems: mediaItems,
                  detail: detail,
                  showDisclosureIndicator: showDisclosureIndicator)
    }
}
