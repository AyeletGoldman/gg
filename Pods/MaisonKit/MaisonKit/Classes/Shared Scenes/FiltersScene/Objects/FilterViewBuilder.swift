// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import Combine

/// The ID for a filter. This is usually used to identify the filter for communication with a third party (e.g. a remote server)
public typealias FilterID = String
/// The value for a filter option. Each filter is comprised of an ID and a set of values to choose from.
public typealias FilterValue = String
/// A dictionary of filter IDs to an array of filter values.
public typealias SelectedFilters = [FilterID: [FilterValue]]

/// A protocol to identify objects that can create views used for filtering.
public protocol FilterDisplayView {
    /// The `Scene` type that will be presented when the view created by the implementer of this protocol is tapped
    associatedtype SceneType: Scene
    /// The `View` type that will be displayed in this filter
    associatedtype ViewType: View
    /// The ID of the filter the view this object creates represents
    var filterId: FilterID { get }
    /// Creates the body of the filtering view with the given selected items.
    /// - Parameters:
    ///   - selectedItems: a binding to the selected filters in this view
    ///   - totalItems: a publisher for getting the total filtered items title
    ///   - onSelectedPresent: a closure to execute with a scene that will be presented when the view that this function creates is tapped
    /// - Returns: a `View` to be displayed in the filters context
    func makeBody(selectedItems: Binding<SelectedFilters>,
                  totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?,
                  onSelectedPresent: @escaping (SceneType) -> Void) -> ViewType
    /// Gets the title for filter item
    /// - Parameter value: The value of the filter (usually a filter ID)
    /// - Returns: An optional `String` that will be used as a title for the filter
    func getFilterItemTitle(value: FilterValue) -> String?
}

/// A type-erased `AnyFilterDisplayView`
public struct AnyFilterDisplayView: FilterDisplayView {
    public var filterId: FilterID
    private let _makeBody: (_ selectedItems: Binding<SelectedFilters>,
                            _ totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?,
                            _ onSelectedPresent: @escaping (AnyScene) -> Void) -> AnyView
    private let _getFilterItemTitle: (_ value: FilterValue) -> String?

    public init<FilterDisplay: FilterDisplayView>(filterDisplay: FilterDisplay) {
        self.filterId = filterDisplay.filterId
        self._makeBody = { selectedItems, totalItems, onSelected in
            return filterDisplay.makeBody(selectedItems: selectedItems, totalItems: totalItems, onSelectedPresent: {
                onSelected(AnyScene(scene: $0))
            }).eraseToAnyView()
        }
        self._getFilterItemTitle = filterDisplay.getFilterItemTitle
    }

    public func makeBody(selectedItems: Binding<SelectedFilters>,
                         totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?,
                         onSelectedPresent: @escaping (AnyScene) -> Void) -> AnyView {
        return self._makeBody(selectedItems, totalItems, onSelectedPresent)
    }

    public func getFilterItemTitle(value: FilterValue) -> String? {
        return self._getFilterItemTitle(value)
    }
}

public extension AnyFilterDisplayView {

    /// Create a new `AnyFilterDisplayView` for a given `ImageFilter.
    /// - Parameter imageFilter: the image filter type to create the view for
    /// - Returns: a new type-erased `FilterDisplayView`.
    static func imageFilter(_ imageFilter: ImageFilter) -> AnyFilterDisplayView {
        return AnyFilterDisplayView(filterDisplay: imageFilter)
    }

    /// Create a new `AnyFilterDisplayView` for a given `TextFilter.
    /// - Parameter textFilter: the text filter type to create the view for
    /// - Returns: a new type-erased `FilterDisplayView`.
    static func textFilter(_ textFilter: TextFilter) -> AnyFilterDisplayView {
        return AnyFilterDisplayView(filterDisplay: textFilter)
    }

    /// Create a new `AnyFilterDisplayView` for a given `NestedFilter.
    /// - Parameter nestedFilter: the nested filter type to create the view for
    /// - Returns: a new type-erased `FilterDisplayView`.
    static func nestedFilter(_ nestedFilter: NestedFilter) -> AnyFilterDisplayView {
        return AnyFilterDisplayView(filterDisplay: nestedFilter)
    }
}
