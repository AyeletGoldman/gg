// Copyright © 2020 LVMH. All rights reserved.

import StylableSwiftUI

/// An object used to model the filters for a particular scene.
public struct FilterData {
    /// The title of the section. This will usually be styled as `heading/title`.
    public let title: String
    /// The icon defined for this section. Will be in use in the filter button.
    public let icon: StylistIdentifier?
    /// The plural title of the section. This will usually be use in `getDisplayButtonText`.
    public let pluralTitleFormat: String
    /// An object that will be responsible for building the actual view that will be displayed for this filter.
    /// MaisonKit provides a set of `FilterDisplayView`s ready for use:
    /// - ImageFilter
    /// - TextFilter
    /// - NestedFilter
    public let viewBuilder: AnyFilterDisplayView

    /// Creates a new FilterData with the given title and view builder.
    /// - Parameters:
    ///   - title: The title of the section. This will usually be styled as `heading/title`.
    ///   - icon: Optional. The icon defined for this section. Will be in use in the filter button.
    ///   - pluralTitleFormat: The plural title of the section. This will usually be use in `getDisplayButtonText`.
    ///   - viewBuilder: An object that will be responsible for building the actual view that will be displayed for this filter.
    ///         MaisonKit provides a set of `FilterDisplayView`s ready for use: ImageFilter, TextFilter, NestedFilter
    public init(title: String,
                icon: StylistIdentifier? = nil,
                pluralTitleFormat: String,
                viewBuilder: AnyFilterDisplayView) {
        self.title = title
        self.icon = icon
        self.pluralTitleFormat = pluralTitleFormat
        self.viewBuilder = viewBuilder
    }

    func getDisplayButtonText(selectedValues: [FilterValue]) -> String? {
        guard let firstValue = selectedValues.first,
              let singular = self.viewBuilder.getFilterItemTitle(value: firstValue) else {
            return nil
        }
        if selectedValues.count == 1 {
            return singular
        } else {
            return String(format: self.pluralTitleFormat, selectedValues.count)
        }
    }
}
