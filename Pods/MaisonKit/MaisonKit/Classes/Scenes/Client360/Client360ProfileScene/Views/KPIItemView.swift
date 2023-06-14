// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct KPIItemView: View {

    private enum Constants {
        static let kpiSize = CGSize(width: 80, height: 75)
    }

    private let title: any View
    private let subtitle: String
    private let stylistVariant: String?

    init<Title: View>(title: @escaping () -> Title,
                      subtitle: String,
                      stylistVariant: String?) {
        self.title = title()
        self.subtitle = subtitle
        self.stylistVariant = stylistVariant
    }

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "block", variant: self.stylistVariant)) {
            VStack(alignment: .leading, spacing: 0) {
                self.title.eraseToAnyView()
                Spacer(minLength: 6)
                Text(verbatim: self.subtitle)
                    .style("subtitle")
                    .lineLimit(2)
                    .frame(maxWidth: Constants.kpiSize.width, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.vertical, 8)
            .frame(minWidth: Constants.kpiSize.width,
                   minHeight: Constants.kpiSize.height,
                   maxHeight: Constants.kpiSize.height,
                   alignment: .leading)
            .padding(.horizontal, 10)
            .style("background")
        }
    }
}
