// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import MaisonKitUI

struct ProductAttributeCarousel: View {

    private let attribute: ProductAttributes.Attribute
    private let items: [ProductAttributeCarouselItem]
    @Binding private var selectedAttributes: SelectedProductAttributes
    private let isLoading: Bool

    init(attribute: ProductAttributes.Attribute,
         items: [ProductAttributeCarouselItem],
         selectedAttributes: Binding<SelectedProductAttributes>,
         isLoading: Bool) {
        self.attribute = attribute
        self.items = items
        self._selectedAttributes = selectedAttributes
        self.isLoading = isLoading
    }

    private func onSelect(item: ProductAttributeCarouselItem) {
        if item.id == self.selectedAttributes[attribute.id]?.id {
            self.selectedAttributes[attribute.id] = nil
        } else {
            self.selectedAttributes[attribute.id] = .init(id: item.id, title: item.title)
        }
    }
    var body: some View {
        FormField(title: self.attribute.title) {
            // Scroll inset if 5 because the default padding for the form field is 10,
            // and we are padding each element in the list 5, so 5 padding + 5 inset = 10
            FormTypeGroupCarousel(scrollInset: 5) {
                ForEach(self.items) { item in
                    Group {
                        switch item.content {
                        case .title(let title):
                            FormTypeSmallImage(title: title,
                                               isSelected: item.id == self.selectedAttributes[attribute.id]?.id,
                                               onTap: { self.onSelect(item: item) })
                        case .color(let color, _):
                            FormTypeSmallImage(color: color,
                                               isSelected: item.id == self.selectedAttributes[attribute.id]?.id,
                                               onTap: { self.onSelect(item: item) })
                        case .image(let image, _):
                            FormTypeSmallImage(image: image,
                                               isSelected: item.id == self.selectedAttributes[attribute.id]?.id,
                                               onTap: { self.onSelect(item: item) })
                        }
                    }.withIndicator(item.indicatorContent)
                }
                .padding(5)
            }
            .padding(.top, 7)
        }
        .loading(self.isLoading)
    }
}
