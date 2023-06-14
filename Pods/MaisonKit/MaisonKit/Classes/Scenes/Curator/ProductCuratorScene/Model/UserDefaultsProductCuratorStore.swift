// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine

/// A product reference is the product or master ID, or a UPC if a barcode is scanned
public typealias ProductReference = String

/// A store for item references backed by `UserDefaults`.
public final class UserDefaultsProductCuratorStore {

    private enum Constants {
        static let curatorDefaultsKey = "com.lvmh.maisonkit.curatorProducts"
    }

    /// The default instance for managing product curator store
    public static let `default` = UserDefaultsProductCuratorStore()

    /// The publisher for getting and tracking the products on the store
    @Published public private(set) var products: [ProductReference] = []

    private var productsRef: AnyCancellable?

    /// Creates a new instance of the store with the given user defaults as the backing store
    /// - Parameter defaults: the backing user defaults that will persist the product references.
    public init(defaults: UserDefaults = .standard) {

        self.products = (defaults.array(forKey: Constants.curatorDefaultsKey) as? [ProductReference]) ?? []

        self.productsRef = self.$products.sink { newRefs in
            defaults.set(newRefs, forKey: Constants.curatorDefaultsKey)
        }
    }

    /// The method for adding a product to the store
    /// - Parameter reference: the product reference to store
    public func add(_ reference: ProductReference) {
        guard !self.contains(reference) else { return }
        self.products.append(reference)
    }

    /// The method for setting products to the store and overriding the existing list
    /// - Parameter references: the product references to store
    public func set(_ references: [ProductReference]) {
        self.products = references
    }

    /// The method for removing a product from the store
    /// - Parameter reference: the product reference to remove
    public func remove(_ reference: ProductReference) {
        self.products = self.products.filter { $0 != reference }
    }

    /// The method for removing all products from the store
    public func removeAll() {
        self.products = []
    }

    /// The method for checking if a product exists in the store or not
    /// - Parameter reference: the product reference to check if it is in the store
    /// - Returns: whether or not the products array contains the passed-in `ProductReference`
    public func contains(_ reference: ProductReference) -> Bool {
        return self.products.contains(reference)
    }
}
