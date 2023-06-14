// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A representation of an object to be displayed in the product curator
public struct CuratedProductDisplayable {
    /// The product's ID
    public let id: ProductReference
    /// The title to display in the cell. This is usually the name of the product, localized to the app's language
    public let title: String
    /// An array of assets associated with this curation. This can be product images but also assets from a catalog or from the user's phone.
    public let assets: [MediaType]
    /// A set of properties to display for this product
    public let properties: [CuratedProductProperty]

    /// Creates a new `CuratedProductDisplayable`
    /// - Parameters:
    ///   - id: The product's ID
    ///   - title: The title to display in the cell. This is usually the name of the product, localized to the app's language
    ///   - assets: An array of assets associated with this curation. This can be product images but also assets from a catalog or from the user's phone.
    ///   - properties: A set of properties to display for this product
    public init(id: ProductReference, title: String, assets: [MediaType], properties: [CuratedProductProperty]) {
        self.id = id
        self.title = title
        self.assets = assets
        self.properties = properties
    }

}

/// The property data for a given curated item
public typealias CuratedProductProperty = LabeledValue
