// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductDetailsAccordion: View {

    let items: [ProductInformationItem]
    let expandedResolver: (Int) -> Binding<Bool>

    init(items: [ProductInformationItem], expandedResolver: @escaping (Int) -> Binding<Bool>) {
        self.items = items
        self.expandedResolver = expandedResolver
    }

    var body: some View {
        StylableGroup("accordion") {
            ForEach(Array(zip(self.items.indices, items)), id: \.0) { (index, infoItem) in
                Group {
                    switch infoItem.content {
                    case .text(let content):
                        MKDisclosureGroup(title: infoItem.title,
                                          content: content,
                                          isExpanded: expandedResolver(index))
                    case .html(let htmlString):
                        MKDisclosureGroup(title: infoItem.title,
                                          htmlContent: htmlString,
                                          isExpanded: expandedResolver(index))
                    }
                }
                .addStyledRowDivider(if: index != (items.count - 1))
            }.padding(.horizontal)
        }
    }
}

struct ProductDetailsAccordion_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsAccordion(items: [], expandedResolver: { _ in return .constant(false) })
    }
}
