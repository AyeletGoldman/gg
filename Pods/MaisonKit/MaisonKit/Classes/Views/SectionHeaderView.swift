// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that shows styled section header
public struct SectionHeaderView<UtilityViews: View>: View {

    private let title: String
    private let utilityViews: UtilityViews?

    /// Creates a new `SectionHeaderView`.
    /// - Parameters:
    ///   - title: the section title
    ///   - utilityViews: a view to place next to the title
    public init(title: String, utilityViews: () -> UtilityViews) {
        self.title = title
        self.utilityViews = utilityViews()
    }

    /// The `SectionHeaderView` body.
    public var body: some View {
        StylableGroup("heading") {
            HStack(spacing: 10) {
                Text(verbatim: self.title)
                    .style("title")
                    .lineLimit(1)
                    .padding(.vertical, 13)
                    .accessibility(identifier: "title")
                if let utilityViews = self.utilityViews {
                    utilityViews
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            .style("background")
        }
    }
}

extension SectionHeaderView where UtilityViews == Never {
    /// Creates a new `SectionHeaderView`.
    /// - Parameters:
    ///   - title: the section title
    public init(title: String) {
        self.title = title
        self.utilityViews = nil
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "Test")
            .environmentObject(Stylist.unstyled)
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
