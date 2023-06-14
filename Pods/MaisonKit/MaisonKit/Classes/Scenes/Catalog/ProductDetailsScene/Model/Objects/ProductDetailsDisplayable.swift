// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// The displayable options for a product's detail screen.
public struct ProductDetailsDisplayable {

    /// Defines the context the product details scene will be in. In MaisonKit's case this is either a product master or a single product.
    public let context: ProductDetailsContext

    /// A closure that requests actions to be displayed in the details screen. The actions are shown in three different places:
    /// - The trailing navigation bar menu
    /// - A set of primary vertical actions displayed prominently in the view
    /// - A set of secondary horizontal actions displayed under the primary vertical actions
    /// The actions are refreshed when the user performs certain actions. For example setting the visibility of the product stock.
    public let actions: () -> ProductDetailsActions

    /// Creates a new `ProductDetailsDisplayable`
    /// - Parameters:
    ///   - context: the context the product details scene will be in.
    ///   - actions: a set of actions that will be displayed to the user when they attempt to perform an action in the details screen.
    public init(context: ProductDetailsContext,
                actions: @escaping () -> ProductDetailsActions = { ProductDetailsActions() }) {
        self.context = context
        self.actions = actions
    }
}

/// A set of actions that will be displayed to the user when they attempt to perform an action in the details page.
public struct ProductDetailsActions {
    /// The set of actions that will be displayed to the user when they attempt to perform an action from the menu in the details page navigation bar
    public let navigationActions: [MenuAction]
    /// The set of actions that will be displayed to the user in the primary actions page vertical layout
    public let pageVerticalActions: [ButtonAction]
    /// The set of actions that will be displayed to the user in the secondary actions page horizontal layout
    public let pageHorizontalActions: [ContextualAction]

    /// Creates a new `ProductDetailsActions`
    /// - Parameters:
    ///   - navigationActions: The set of actions that will be displayed to the user when they attempt to perform an action from the menu in the details page navigation bar
    ///   - pageVerticalActions: The set of actions that will be displayed to the user in the primary actions page vertical layout
    ///   - pageHorizontalActions: The set of actions that will be displayed to the user in the secondary actions page horizontal layout
    public init(navigationActions: [MenuAction] = [],
                pageVerticalActions: [ButtonAction] = [],
                pageHorizontalActions: [ContextualAction] = []) {
        self.navigationActions = navigationActions
        self.pageVerticalActions = pageVerticalActions
        self.pageHorizontalActions = pageHorizontalActions
    }
}

/// The context options a product details scene supports
public enum ProductDetailsContext {
    /// The context for a "detailed" product. e.g. a product whose properties are all selected (size, color, material... etc)s
    case product(ProductDetailsData)
    /// The context for a "master" product. e.g. a product that has different properties that can be selected.
    case master(ProductMasterDetailsData)

    /// The identifier for this context. If the product is a regular product it will be its `productId` property and if it's a master product it will be it's `id` property.
    public var id: String {
        switch self {
        case .product(let data):
            return data.productId
        case .master(let data):
            return data.id
        }
    }

    var masterId: String? {
        switch self {
        case .product(let data):
            return data.productMasterId
        case .master(let data):
            return data.id
        }
    }

    var title: String {
        switch self {
        case .product(let data):
            return data.title
        case .master(let data):
            return data.title
        }
    }

    var subtitle: String {
        switch self {
        case .product(let data):
            return data.subtitle
        case .master(let data):
            return data.subtitle
        }
    }

    var price: String? {
        switch self {
        case .product(let data):
            return data.price
        case .master(let data):
            return data.price
        }
    }

    var salePrice: String? {
        switch self {
        case .product(let data):
            return data.salePrice
        case .master(let data):
            return data.salePrice
        }
    }

    var informationItems: [ProductInformationItem] {
        switch self {
        case .product(let data):
            return data.informationItems
        case .master(let data):
            return data.informationItems
        }
    }

    var mediaItems: HeroCarouselItems {
        switch self {
        case .product(let data):
            return data.mediaItems
        case .master(let data):
            return data.mediaItems
        }
    }

    var sku: String? {
        switch self {
        case .product(let data):
            return data.sku
        case .master: return nil
        }
    }

    var stockInformationType: StockInformationType {
        switch self {
        case .product(let data):
            return data.stockInformationType
        case .master(let data):
            return data.stockInformationType
        }
    }

    var availability: ProductAvailability? {
        switch self {
        case .product(let data):
            return data.availability
        case .master: return nil
        }
    }

    var attributes: ProductAttributes? {
        switch self {
        case .product(let data):
            return data.attributes
        case .master(let data):
            return data.attributes
        }
    }

    /// Returns whether this context is of case `.product` or not.
    public var isProduct: Bool {
        switch self {
        case .product:
            return true
        case .master:
            return false
        }
    }
}

/// The data for the hero carousel images in the product details screen
public struct HeroCarouselItems {

    /// The hero image index; presented above the rest of the carousel.
    /// Usually this image will be the same as the first image in the `carouselItems`
    public let heroImageIndex: Int

    /// The array of images to display in the carousel.
    /// Usually the first image will be the same as the `heroImage`
    public let carouselItems: [MediaType]

    /// Creates a new `HeroCarouselItems` object.
    /// - Parameters:
    ///   - heroImageIndex: The index of the image to show above the carousel as default.
    ///   - carouselItems: The list of carousel images.
    public init(heroImageIndex: Int, carouselItems: [MediaType]) {
        self.heroImageIndex = heroImageIndex
        self.carouselItems = carouselItems
    }
}

/// The data for the product detail's information; usually presented in an accordion in the product detail's screen.
public struct ProductInformationItem {

    /// The content type for the product information item.
    /// The two options are plain-text and HTML.
    /// Depending on this type, the view that presents this will either be a webview or a regular text view.
    public enum ContentType {
        /// A text content type, with the text as the associated value
        case text(String)
        /// An HTML content type, with the HTML content as the associated value
        case html(String)
    }

    /// An ID so this object can be iterated over by SwiftUI
    let id: UUID

    /// The title for the item
    public let title: String

    /// The content for the item. If presented in an accordion this will be collapsible.
    public let content: ContentType

    /// Creates a new `ProductInformationItem`.
    /// - Parameters:
    ///   - title: The title for the item.
    ///   - content: The string content for the item. If presented in an accordion, this will be collapsible.
    public init(title: String, content: ContentType) {
        self.init(id: UUID(), title: title, content: content)
    }

    init(id: UUID, title: String, content: ContentType) {
        self.id = id
        self.title = title
        self.content = content
    }
}

/// The type of stock information to show.
public enum StockInformationType {
    /// No stock to show
    case none
    /// Show only summary view in product details screen
    case onlySummary
    /// Show only details in a seperated screen
    case onlyDetails
    /// Show summary view in product details screen and also details in a seperated screen
    case summaryAndDetails
}
