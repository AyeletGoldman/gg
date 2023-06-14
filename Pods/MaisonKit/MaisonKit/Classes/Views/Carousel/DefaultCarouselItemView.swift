// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct DefaultCarouselItemView: View {
    let mediaType: MediaType
    let itemSize: CGSize
    let isSelected: Bool
    /// Preview mode creates a carousel where videos show their thumbnail instead of the actual video.
    /// This is useful for example when you have a carousel that has a large hero image where the video
    /// would be played but you don't want to play the video in the carousel.
    let isPreviewMode: Bool

    var body: some View {
        MediaTypeView(source: self.mediaType, isPreviewMode: self.isPreviewMode)
            .aspectRatio(contentMode: .fit)
            .frame(width: self.itemSize.width, height: self.itemSize.height)
            .asImageBackground(variant: self.isSelected ? "highlighted" : nil)
    }
}
