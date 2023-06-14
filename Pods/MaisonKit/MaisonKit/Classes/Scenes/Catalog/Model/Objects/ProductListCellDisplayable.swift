// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// The model object for a product list cell.
/// Product lists can show either simple products or product families, each with different data.
///
/// Each product cell has number of finite displayable fields:
///
///  |------------------------------------------------------------------------------------
///  | Availability tag  |   Subtitle
///  |                          |   Title
///  |                          |   Body
///  | IMAGE             |   Property name: Property Value
///  |                          |   Property name: Property Value
///  |                          |   Property name: Property Value
///  |                          |   Property name: Property Value
///  |                          |   (Color) (Color) (Color) (Color) + 77
///  |                          |   [Sale]Price  [Original]Price
///  |------------------------------------------------------------------------------------
public enum ProductListCellDisplayable {

    /// A cell displayable for a product type, with an assciated set of data that is usually available for a product summary in a cell
    case product(ProductSummaryDisplayable)
    /// A cell displayable for a master product type, with an assciated set of data that is usually available for a master summary in a cell
    case master(ProductMasterSummaryDisplayable)

    var id: String {
        switch self {
        case .product(let summary):
            return summary.productId
        case .master(let summary):
            return summary.id
        }
    }

    var masterId: String? {
        switch self {
        case .product(let summary):
            return summary.masterId
        case .master(let summary):
            return summary.id
        }
    }

    var image: ImageSource {
        switch self {
        case .product(let summary):
            return summary.image
        case .master(let summary):
            return summary.image
        }
    }

    var properties: [ProductSummaryProperty] {
        switch self {
        case .product(let summary):
            return summary.properties
        case .master(let summary):
            return summary.properties
        }
    }

    var subtitle: String? {
        switch self {
        case .product(let summary):
            return summary.subtitle
        case .master(let summary):
            return summary.subtitle
        }
    }

    var price: String? {
        switch self {
        case .product(let summary):
            return summary.price
        case .master(let summary):
            return summary.price
        }
    }

    var salePrice: String? {
        switch self {
        case .product(let summary):
            return summary.salePrice
        case .master(let summary):
            return summary.salePrice
        }
    }

    var title: String {
        switch self {
        case .product(let summary):
            return summary.title
        case .master(let summary):
            return summary.title
        }
    }

    var body: String? {
        switch self {
        case .product(let summary):
            return summary.body
        case .master(let summary):
            return summary.body
        }
    }

    var availability: ProductAvailability? {
        switch self {
        case .product(let summary):
            return summary.availability
        case .master(let master):
            return master.availability
        }
    }

    var availableColors: [ProductColorDisplay] {
        switch self {
        case .product(let summary):
            return summary.availableColors
        case .master(let master):
            return master.availableColors
        }
    }
}

/// The product summary's property data. Usually these are displayed as lists of properties in a product list.
/// For example you could use these to show key-value pairs of product attributes like color, material etc.
public typealias ProductSummaryProperty = LabeledValue

/// The product summary's data. Used to display all the data about a product that is available in a product list when
/// the product is not a "master" type.
public struct ProductSummaryDisplayable {

    /// The ID of this product. Can hold the sku or another identifier, depends on implementation.
    public let productId: String

    /// The master ID of this product, if any
    public let masterId: String?

    /// The product SKU. This is different to the product ID and usually involves a specific size of a product.
    public let sku: String

    /// The product image. Usually it also corresponds to what you would expect to see as the "hero" image in the product details screen.
    public let image: ImageSource

    /// A set of attributes for the product like the color, or material it is made from.
    public let properties: [ProductSummaryProperty]

    /// The subtitle to display above the title in the product cell
    public let subtitle: String?

    /// The product price
    /// Use as a string for any free-text value, or use `PriceType` or the convenience `.price` and `.priceRange` `String` extensions for a formatted price or price range.
    public let price: String?

    /// The product sale price
    /// Use as a string for any free-text value, or use `PriceType` or the convenience `.price` and `.priceRange` `String` extensions for a formatted price or price range.
    public let salePrice: String?

    /// The product body, displayed between the title and the list of properties
    public let body: String?

    /// The cell's title, displayed prominently in the cell
    public let title: String

    /// The level of availability for this specific product. Defaults to `nil`.
    public let availability: ProductAvailability?

    /// An array of available colors for a given product. Defaults to an empty array.
    public let availableColors: [ProductColorDisplay]

    /// Creates a new `ProductSummaryDisplayable`
    /// - Parameters:
    ///   - productId: The ID of this product. Can hold the sku or another identifier, depends on implementation. 
    ///   - masterId: The master ID of this product
    ///   - sku: The product SKU. This is different to the product ID and usually involves a specific size of a product.
    ///   - image: The product image. Usually it also corresponds to what you would expect to see as the "hero" image in the product details screen.
    ///   - properties: A set of attributes for the product like the color, or material it is made from.
    ///   - subtitle: The product's category (usually only the last-level)
    ///   - price: The product price
    ///   - salePrice: The product sale price
    ///   - body: The text to display on the summary cell. This text is usually displayed below the title and above the attributes.
    ///   - title: The cell's title, displayed prominently in the cell
    ///   - availability: The level of availability for this specific product. Defaults to `nil`.
    ///   - availableColors: An array of available colors for a given product. Defaults to an empty array.
    public init(productId: String,
                masterId: String?,
                sku: String,
                image: ImageSource,
                properties: [ProductSummaryProperty],
                subtitle: String?,
                price: String?,
                salePrice: String? = nil,
                body: String? = nil,
                title: String,
                availability: ProductAvailability? = nil,
                availableColors: [ProductColorDisplay] = []) {
        self.productId = productId
        self.masterId = masterId
        self.sku = sku
        self.image = image
        self.properties = properties
        self.subtitle = subtitle
        self.price = price
        self.salePrice = salePrice
        self.title = title
        self.body = body
        self.availability = availability
        self.availableColors = availableColors
    }
}

/// A product master's summary's data. Used to display all the data about a product master that is available in a product list when
/// the type of the product in the list is `master`.
public struct ProductMasterSummaryDisplayable {

    /// The master ID of this product
    public let id: String

    /// The product image. Usually it also corresponds to what you would expect to see as the "hero" image in the product details screen.
    public let image: ImageSource

    /// A set of attributes for the product like the color, or material it is made from.
    public let properties: [ProductSummaryProperty]

    /// The subtitle to display above the title in the product cell
    public let subtitle: String?

    /// The product price
    /// Use as a string for any free-text value, or use `PriceType` or the convenience `.price` and `.priceRange` `String` extensions for a formatted price or price range.
    public let price: String?

    /// The product sale price
    /// Use as a string for any free-text value, or use `PriceType` or the convenience `.price` and `.priceRange` `String` extensions for a formatted price or price range.
    public let salePrice: String?

    /// The product body, displayed between the title and the list of properties
    public let body: String?

    /// The cell's title, displayed prominently in the cell
    public let title: String

    /// The level of availability for this specific product. Defaults to `nil`.
    public let availability: ProductAvailability?

    /// An array of available colors for a given product. Defaults to an empty array.
    public let availableColors: [ProductColorDisplay]

    /// Creates a new `ProductMasterSummaryDisplayable`
    /// - Parameters:
    ///   - id: The master ID of this product
    ///   - image: The product image. Usually it also corresponds to what you would expect to see as the "hero" image in the product details screen.
    ///   - properties: A set of attributes for the product like the color, or material it is made from.
    ///   - subtitle: The product's category (usually only the last-level)
    ///   - price: The product price; can be either an actual price or a price range,  usually a price range in`master` state
    ///   - salePrice: The product sale price; can be either an actual price or a price range,  usually a price range in`master` state
    ///   - body: The text to display on the summary cell. This text is usually displayed below the title and above the attributes. Defaults to `nil`.
    ///   - title: The cell's title, displayed prominently in the cell
    ///   - availability: The level of availability for this specific product. Defaults to `nil`.
    ///   - availableColors: An array of available colors for a given product. Defaults to an empty array.
    public init(id: String,
                image: ImageSource,
                properties: [ProductSummaryProperty],
                subtitle: String?,
                price: String?,
                salePrice: String? = nil,
                body: String? = nil,
                title: String,
                availability: ProductAvailability? = nil,
                availableColors: [ProductColorDisplay] = []) {
        self.id = id
        self.image = image
        self.properties = properties
        self.subtitle = subtitle
        self.price = price
        self.salePrice = salePrice
        self.title = title
        self.body = body
        self.availability = availability
        self.availableColors = availableColors
    }
}
