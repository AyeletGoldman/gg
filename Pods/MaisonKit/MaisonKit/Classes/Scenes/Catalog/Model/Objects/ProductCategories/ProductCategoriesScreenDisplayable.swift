// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A representation of the product categories screen.
/// This screen can have two different display modes:
/// - Text: Shows the categories in a simple list with the title of the category
/// - Custom: Allows customisation of the user interface to show different
/// views ordered by row and divided in columns. You may make columns of
/// different widths.
public struct ProductCategoriesScreenDisplayable {

    /// The type of list we want to display, either a text list or custom views
    public let listType: ListType

    /// Creates a new `ProductCategoriesScreenDisplayable`.
    /// - Parameter listType: The type of list we want to display, either a text list or custom views
    public init(listType: ListType) {
        self.listType = listType
    }

    /// The type of list we want to display, either a text list or custom views
    public enum ListType {
        /// Shows the categories in a simple list with the title of the category
        case text([TextOnlyProductCategory])
        /// Allows customisation of the user interface to show different
        /// views ordered by row and divided in columns. You may make columns of
        /// different widths.
        case custom([CustomProductCategoryRow])
    }
}

/// Defines the type of screen that is expected in the catalog.
/// This is used in MaisonKit to decide what route to follow when a user taps
/// a cell. It helps to differentiate between a sub-category or a product list.
public enum CatalogScreenType {
    /// A categories screen
    case categories
    /// A product list screen
    case products
}

/// A protocol to define any product category that can be displayed in the catalog views
public protocol ProductCategory {

    /// The ID of the category, used when retrieving details for it
    var id: String { get }

    /// The title of this category, usually the category name
    var title: String { get }

    /// The description of what the next step is after tapping on this category
    var nextScreen: CatalogScreenType { get }
}

/// A product category to represent a view that only supports text as the display
public struct TextOnlyProductCategory: ProductCategory, Identifiable {

    /// The ID of the category, used when retrieving details for it
    public let id: String

    /// The title of this category, usually the category name
    public let title: String

    /// The description of what the next step is after tapping on this category
    public let nextScreen: CatalogScreenType

    /// Creates a new `TextOnlyProductCategory`
    /// - Parameters:
    ///   - id: The ID of the category, used when retrieving details for it
    ///   - title: The title of this category, usually the category name
    ///   - nextScreen: The description of what the next step is after tapping on this category
    public init(id: String, title: String, nextScreen: CatalogScreenType) {
        self.id = id
        self.title = title
        self.nextScreen = nextScreen
    }
}
