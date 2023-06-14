// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// A protocol to define selection list data source for having an option to bind the selection list data
public protocol SelectionListDataSource {
    /// Selection list view model apply this function any time there is a change in selected items
    /// - Parameter selection: the new selection data
    func onSelectionChange(selection: Set<String>)
    /// The selection list items publisher. any time there is an updated data the selection list screen will update the data.
    /// In case of loading state with data the user can still use the selection list.
    var items: [SelectionListItem] { get }
    /// The selected items publisher. any time there is an updated data the selection list screen will update the data.
    var selectionPublisher: AnyPublisher<Set<String>, Never> { get }
    /// The total items publisher to show. any time there is an updated data the selection list screen will update the data.
    var totalItemsPublisher: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>? { get }
}

struct DefaultSelectionListDataSource: SelectionListDataSource {
    func onSelectionChange(selection: Set<String>) { }
    let items: [SelectionListItem]
    let selectionPublisher: AnyPublisher<Set<String>, Never>
    let totalItemsPublisher: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?
}
