// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A product representation that is searchable from Core Spotlight
public struct SearchableProduct: SearchableItem {
    /// A unique identifier for this item
    public let id: SearchableItemIdentifier

    /// A localized name of this item
    public let localizedName: String

    /// A localised description of this item
    public let localizedDescription: String

    /// The URL for a thumbnail of this item
    public let thumbnailURL: URL?

    public var domain: String {
        return "com.maisonkit.products"
    }

    /// Creates a new `SearchableProduct`
    /// - Parameters:
    ///   - context: the context for this product. This is used to create a specific identifier for the `SearchableProduct`.
    ///   - localizedName: A localized name of this item
    ///   - localizedDescription: A localised description of this item
    ///   - thumbnailURL: The URL for a thumbnail of this item
    public init(context: ProductDetailsInitialisationContext, localizedName: String, localizedDescription: String, thumbnailURL: URL?) {
        self.id = SearchableProductIdentifier(context: context)
        self.localizedName = localizedName
        self.localizedDescription = localizedDescription
        self.thumbnailURL = thumbnailURL
    }
}

struct SearchableProductIdentifier: SearchableItemIdentifier {
    let context: ProductDetailsInitialisationContext

    init(context: ProductDetailsInitialisationContext) {
        self.context = context
    }

    init?(string: String) {
        guard let data = string.data(using: .utf8) else {
            return nil
        }

        guard let context = try? JSONDecoder().decode(ProductDetailsInitialisationContext.self, from: data) else {
            return nil
        }
        self.context = context
    }

    var value: String {
        let data = try? JSONEncoder().encode(self.context)
        return String(data: data ?? Data(), encoding: .utf8) ?? "No identifier"
    }
}

extension ProductDetailsInitialisationContext: Codable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let type = try container.decode(String.self)
        if type == "master" {
            self = try .master(masterId: container.decode(String.self))
        } else {
            let productId = try container.decode(String.self)
            let masterId = try? container.decode(String.self)
            self = .product(productId: productId, masterId: masterId)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        switch self {
        case .master(let masterId):
            try container.encode("master")
            try container.encode(masterId)
        case .product(let productId, let masterId):
            try container.encode("product")
            try container.encode(productId)
            try container.encode(masterId)
        }
    }
}
