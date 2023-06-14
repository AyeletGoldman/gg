// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The object that represents all the data available for a product details screen.
public struct ProductDetailsData {

    /// The ID of this product. Can hold the sku or another identifier, depends on implementation.
    public let productId: String

    /// The master ID of this product
    public let productMasterId: String?

    /// The title for this product; usually the product name. Displayed prominantly in the product details screen.
    public let title: String

    /// The subtitle for this product, usually the product category.
    public let subtitle: String

    /// The product SKU. This is different to the product ID and usually involves a specific size of a product.
    public let sku: String

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

    /// Indicates whether stock information view should be shown or not
    public let stockInformationType: StockInformationType

    /// The level of availability for this specific product. Defaults to `nil`.
    public let availability: ProductAvailability?

    /// The product attributes information.
    public let attributes: ProductAttributes?

    /// Creates a new ProductDetailsDisplayable to be used to display a set of product information
    /// - Parameters:
    ///   - productId: The ID of this product. Can hold the sku or another identifier, depends on implementation.
    ///   - productMasterId: the product master ID.
    ///   - title: The title, usually the product name
    ///   - subtitle: The subtitle, usually
    ///   - sku: The product SKU. This is different to the product ID and usually involves a specific size of a product.
    ///   - price: The product price; can be either an actual price or a price range,  usually a price range in`master` state
    ///   - salePrice: The product sale price; can be either an actual price or a price range,  usually a price range in`master` state
    ///   - informationItems: a set of items that are displayed in an accordion at the bottom of the product details page
    ///   - mediaItems: a set of images or videos, both for the carousel and the hero image in the product details page
    ///   - stockInformationType: the type of stock information.
    ///   - availability: the level of availability for this specific product. Defaults to `nil`.
    ///   - attributes: the product attributes information.
    public init(productId: String,
                productMasterId: String?,
                title: String,
                subtitle: String,
                sku: String,
                price: String?,
                salePrice: String? = nil,
                informationItems: [ProductInformationItem],
                mediaItems: HeroCarouselItems,
                stockInformationType: StockInformationType = .none,
                availability: ProductAvailability? = nil,
                attributes: ProductAttributes? = nil) {
        self.productId = productId
        self.productMasterId = productMasterId
        self.title = title
        self.subtitle = subtitle
        self.sku = sku
        self.price = price
        self.salePrice = salePrice
        self.informationItems = informationItems
        self.mediaItems = mediaItems
        self.stockInformationType = stockInformationType
        self.availability = availability
        self.attributes = attributes
    }
}
