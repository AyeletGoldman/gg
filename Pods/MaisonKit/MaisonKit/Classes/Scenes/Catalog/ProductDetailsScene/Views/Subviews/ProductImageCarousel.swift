// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A carousel of images with one large hero image.
/// The small images in the scrolling carousel underneath the hero image
/// can be selected and when they are they take the hero image's positioin.
/// Because of this, usually the data you pass into this view will have the hero image
/// and the first image in the carousel repeated.
struct ProductImageCarousel: View {

    private enum Constants {
        static let heroImageHeight: CGFloat = 270
    }

    let imageDisplayable: HeroCarouselItems
    let availability: ProductAvailability?
    @State private var selectedImageIndex: Int

    init(imageDisplayable: HeroCarouselItems, availability: ProductAvailability?) {
        self.imageDisplayable = imageDisplayable
        self.availability = availability
        self._selectedImageIndex = State(wrappedValue: imageDisplayable.heroImageIndex)
    }

    var body: some View {
        self.heroMedia(source: self.imageDisplayable.carouselItems[safe: self.selectedImageIndex])
            .setProductAvailability(availability)
            .padding()
        if self.imageDisplayable.carouselItems.count > 1 {
            CarouselView(carouselItems: self.imageDisplayable.carouselItems,
                         onItemSelected: { self.selectedImageIndex = $0 })
        }
    }

    @ViewBuilder
    private func heroMedia(source: MediaType?) -> some View {
        if let source = source {
            MediaTypeView(source: source, enableImageZoom: true)
                .aspectRatio(contentMode: .fit)
                .asImageBackground()
        }
    }
}

struct ProductImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageCarousel(
            imageDisplayable: HeroCarouselItems(
                heroImageIndex: 0,
                carouselItems: [.image(source: .system(name: "star"))]),
            availability: nil)
    }
}
