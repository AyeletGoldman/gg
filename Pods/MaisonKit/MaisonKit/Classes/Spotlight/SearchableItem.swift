// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A value for an item that identifies a searchable item
public protocol SearchableItemIdentifier {
    /// The value of the identifier
    var value: String { get }
}

/// An item representation that is searchable from Core Spotlight
public protocol SearchableItem {
    /// A unique identifier for this item
    var id: SearchableItemIdentifier { get }

    /// A localized name of this item
    var  localizedName: String { get }

    /// A localised description of this item
    var  localizedDescription: String { get }

    /// The URL for a thumbnail of this item
    var  thumbnailURL: URL? { get }

    /// The domain to which this item belongs to
    /// For example, a domain could be "products", or "clients"
    var domain: String { get }
}
