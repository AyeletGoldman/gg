// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The object that represents all the data available for a product details screen in "product master" state.
public struct ProductMasterDetailsData {

    /// The master ID of this product
    public let id: String

    /// The title for this product; usually the product name. Displayed prominantly in the product details screen.
    public let title: String

    /// The subtitle for this product, usually the product category.
    public let subtitle: String

    /// The product price
    /// Use as a string for any free-text value, or use `PriceType` or the convenience `.price` and `.priceRange` `String` extensions for a formatted price or price range.
    public let price: String?

    /// The product sale price
    /// Use as a string for any free-text value, or use `PriceType` or the convenience `.price` and `.priceRange` `String` extensions for a formatted price or price range.
    public let salePrice: String?

    /// The set of items that hold the product information; usually displayed in an accordion inside the product details.
    public let informationItems: [ProductInformationItem]

    /// The set of images, videos in the product carousel.
    public let mediaItems: HeroCarouselItems

    /// The level of availability for this specific product master.
    public let attributes: ProductAttributes

    /// Indicates whether stock information view should be shown or not
    public let stockInformationType: StockInformationType

    /// Creates a new `ProductMasterDetailsData`
    /// - Parameters:
    ///   - id: The master ID of this product
    ///   - title: The title for this product; usually the product name. Displayed prominantly in the product details screen.
    ///   - subtitle: The subtitle for this product, usually the product category.
    ///   - price: The product price; can be either an actual price or a price range,  usually a price range in`master` state
    ///   - salePrice: The product sale price; can be either an actual price or a price range,  usually a price range in`master` state   
    ///   - informationItems: The set of items that hold the product information; usually displayed in an accordion inside the product details.
    ///   - mediaItems: a set of images or videos, both for the carousel and the hero image in the product details page
    ///   - stockInformationType: The type of stock information.
    ///   - attributes: The level of availability for this specific product master.
    public init(id: String,
                title: String,
                subtitle: String,
                price: String? = nil,
                salePrice: String? = nil,
                informationItems: [ProductInformationItem],
                mediaItems: HeroCarouselItems,
                stockInformationType: StockInformationType = .none,
                attributes: ProductAttributes) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.price = price
        self.salePrice = salePrice
        self.informationItems = informationItems
        self.mediaItems = mediaItems
        self.attributes = attributes
        self.stockInformationType = stockInformationType
    }
}
