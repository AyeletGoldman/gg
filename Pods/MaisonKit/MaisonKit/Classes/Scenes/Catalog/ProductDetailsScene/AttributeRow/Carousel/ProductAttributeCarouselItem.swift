// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import MaisonKitUI

/// The product attribute item to show in thw attribute carousel row
public struct ProductAttributeCarouselItem: Identifiable {

    /// The content type
    public enum Content {
        /// Text content
        case title(String)
        /// Color content. The title is for presenting it as a support in another screen
        case color(Color, title: String)
        /// Image content. The title is for presenting it as a support in other screen
        case image(ImageSource, title: String)
    }

    /// The item unique ID
    public let id: String
    /// The item content type
    public let content: Content
    /// The stock availability to show
    public let indicatorContent: IndicatorContentType?

    /// Helper variable that calculate the title
    public var title: String {
        switch self.content {
        case .title(let title):
            return title
        case .color(_, title: let title):
            return title
        case .image(_, title: let title):
            return title
        }
    }

    /// Creates a new instanse of `ProductAttributeCarouselItem` for title content type
    /// - Parameters:
    ///   - id: The item unique ID
    ///   - title: The item title
    ///   - availabilityIndicatorContent: The stock availability to show
    public init(id: String, title: String, availabilityIndicatorContent: IndicatorContentType? = nil) {
        self.id = id
        self.content = .title(title)
        self.indicatorContent = availabilityIndicatorContent
    }

    /// Creates a new instanse of `ProductAttributeCarouselItem` for color content type
    /// - Parameters:
    ///   - id: The item unique ID
    ///   - color: The item color to show
    ///   - title: The item title. The title is for presenting it as a support in another screen
    ///   - availabilityIndicatorContent: The stock availability to show
    public init(id: String, color: Color, title: String, availabilityIndicatorContent: IndicatorContentType? = nil) {
        self.id = id
        self.content = .color(color, title: title)
        self.indicatorContent = availabilityIndicatorContent
    }

    /// Creates a new instanse of `ProductAttributeCarouselItem` for image content type
    /// - Parameters:
    ///   - id: The item unique ID
    ///   - image: The item image to show
    ///   - title: The item title. The title is for presenting it as a support in another screen
    ///   - availabilityIndicatorContent: The stock availability to show
    public init(id: String, image: ImageSource, title: String, availabilityIndicatorContent: IndicatorContentType? = nil) {
        self.id = id
        self.content = .image(image, title: title)
        self.indicatorContent = availabilityIndicatorContent
    }
}
