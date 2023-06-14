// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import MaisonKitUI

struct NestedProductAttributeRowView: View {

    private enum Labels {
        static let placeholder = MKLocalizedString("product-details.attributes.nested-list.placeholder",
                                                   comment: "The placeholder to show when there is no item selected in the nested attribute row in product details. The placeholder is the attribute title.")
    }

    private let attributeTitle: String
    private let attributeValueTitle: String?
    private let presentAttributeItemsSelection: () -> Void
    private let isLoading: Bool

    init(attributeTitle: String,
         attributeValueTitle: String?,
         presentAttributeItemsSelection: @escaping () -> Void,
         isLoading: Bool) {
        self.attributeTitle = attributeTitle
        self.attributeValueTitle = attributeValueTitle
        self.presentAttributeItemsSelection = presentAttributeItemsSelection
        self.isLoading = isLoading
    }

    var body: some View {
        FormField(title: self.attributeTitle) {
            Button(action: self.presentAttributeItemsSelection) {
                HStack {
                    Text(self.attributeValueTitle ?? String(format: Labels.placeholder, self.attributeTitle))
                        .style("title")
                    Spacer()
                    if isLoading {
                        LoadingView()
                            .frame(width: 20)
                            .unredacted()
                    } else {
                        MaisonKitImage(source: .styledImage(identifier: "icon-right"))
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.top, 7)
            }.padding(.horizontal, 10)
        }
    }
}
