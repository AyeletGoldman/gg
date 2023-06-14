// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

/// A convenience to represent a closure that takes a `ProductCategory` and returns nothing.
public typealias CategorySelectionClosure = (ProductCategory) -> Void

/// A protocol to identify objects that can create views used for customising product category row.
public protocol CustomProductCategoryRow {
    /// Creates the body of product category row with the given geometry width.
    /// - Parameters:
    ///   - geoWidth: the width available for this row
    ///   - onSelectCategory: a closure to invoke when the category this row represents is tapped
    /// - Returns: a view to represent the row
    func makeBody(geoWidth: CGFloat, onSelectCategory: @escaping CategorySelectionClosure) -> AnyView
}
