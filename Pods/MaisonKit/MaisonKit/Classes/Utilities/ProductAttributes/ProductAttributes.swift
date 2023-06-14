// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

/// The product attribute ID.
public typealias ProductAttributeID = String

/// A dictionary to hold product attribute ID to selected attribute value
public typealias SelectedProductAttributes = [ProductAttributeID: ProductAttributes.AttributeValue]

/// The data for the product attributes.
/// To be used to in product details screen so the user can see the attributes and attribute items to select.
public struct ProductAttributes {

    /// The attributes information.
    public let attributes: [Attribute]

    /// Optional selected attribute values dictionary.
    public let selectedAttributes: SelectedProductAttributes?

    /// Creates a new ProductAttributes to be used to in product details screen.
    /// - Parameters:
    ///   - attributes: the attributes information.
    ///   - selectedAttributes: the selected attribute values dictionary. The dictionary holds attribute id to selected attribute value
    public init(attributes: [Attribute], selectedAttributes: SelectedProductAttributes? = nil) {
        self.attributes = attributes
        self.selectedAttributes = selectedAttributes
    }

    /// The product attribute
    public struct Attribute: Identifiable {
        /// The id for the product attribute.
        public let id: ProductAttributeID
        /// The title for the product attribute.
        public let title: String
        /// The display style for this attribute
        public let row: ProductAttributeRow

        /// Creates a new ProductAttributes.Attribute to be used to in product details screen.
        /// - Parameters:
        ///   - id: the id for the product attribute.
        ///   - title: the title for the product attribute.
        ///   - row: the display style for this attribute.
        public init(id: ProductAttributeID, title: String, row: ProductAttributeRow) {
            self.id = id
            self.title = title
            self.row = row
        }
    }

    /// The product attribute value that selected from `ProductAttributeItems` list.
    /// To be used to in product details screen next to a specific attribute in attributes list.
    public struct AttributeValue: Equatable {
        /// The id for the product attribute value.
        public let id: String
        /// The title for the product attribute value.
        public let title: String

        /// Creates a new ProductAttributes.AttributeValue to be used to in product details screen next to a specific attribute in attributes list.
        /// - Parameters:
        ///   - id: the id for the product attribute value.
        ///   - title: the title for the product attribute value.
        public init(id: String, title: String) {
            self.id = id
            self.title = title
        }
    }
}
