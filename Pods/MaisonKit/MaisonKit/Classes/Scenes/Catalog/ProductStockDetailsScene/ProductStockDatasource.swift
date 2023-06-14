// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// A data source for the stock details screen.
/// This data source is used as the source of truth for stock and attributes information.
/// The data source also has methods to update the stock information and the selected attributes, in case the user
/// changes them from inside the product stock scene.
public protocol ProductStockDatasource: AnyObject {
    // MARK: Stock
    /// A function to refresh the product stock; once the product stock is updated, the `stockDetailsSourcePublisher` is expected to emit a new value.
    func onRefresh()
    /// A publisher that contains the latest stock information
    var stockDetailsSourcePublisher: AnyPublisher<ResultState<StockInformationDisplayable, ErrorDisplayable>, Never> { get }

    // MARK: Attributes
    /// A function to update the selected attributes for a product master. Once the attributes are updated, the expectaion is that a new value will be emitted from any of the attributes
    /// publishers that have updated.
    /// - Parameter newSelectedAttributes: the new set of selected attributes that are selected
    func updateSelectedAttributes(newSelectedAttributes: SelectedProductAttributes)

    /// A publisher that contains the latest array of product attributes
    var productAttributes: AnyPublisher<ResultState<[ProductAttributes.Attribute]?, ErrorDisplayable>, Never> { get }
    /// A publisher that contains the latest set of selected product attributes
    var selectedAttributes: AnyPublisher<SelectedProductAttributes, Never> { get }
    /// A publisher that contains the rows that are available for product attributes
    var productAttributeRows: AnyPublisher<ResultState<ProductAttributeRows, ErrorDisplayable>, Never> { get }
}
