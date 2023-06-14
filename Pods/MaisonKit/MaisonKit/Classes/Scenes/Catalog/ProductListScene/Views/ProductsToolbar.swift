// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductsToolbar: View {

    private enum Labels {
        static let filterTitle = MKLocalizedString("product-list.toolbar.filter.title",
                                                   comment: "The text to show for the filter button in product lists")
        static let sortTitle = MKLocalizedString("product-list.toolbar.sort.title",
                                                 comment: "The text to show for the sort button in product lists")
        static let matchedProducts = MKLocalizedString("product-list.toolbar.matched-products.title",
                                                       comment: "The text to show in the product list with the number of matched products in the variable")
        static let updatingToolbarText = MKLocalizedString("product-list.toolbar.loading.title",
                                                           comment: "The text to show in the product toolbar while fetching new results")
    }

    enum Status {
        case loading
        case found(itemCount: Int)

        var isLoading: Bool {
            switch self {
            case .loading: return true
            case .found: return false
            }
        }
    }

    private let status: Status
    private let onFilterTapped: (() -> Void)?
    private let onSortTapped: (() -> Void)?
    private let filterBadge: String?

    init(status: Status,
         onFilterTapped: (() -> Void)? = nil,
         onSortTapped: (() -> Void)? = nil,
         filterBadge: String? = nil) {
        self.status = status
        self.onFilterTapped = onFilterTapped
        self.onSortTapped = onSortTapped
        self.filterBadge = filterBadge
    }

    private var title: String {
        switch self.status {
        case .loading:
            return Labels.updatingToolbarText
        case .found(let itemCount):
            return String(format: Labels.matchedProducts, itemCount)
        }
    }

    var body: some View {
        SearchToolbarView(
            title: self.title,
            showSpinner: self.status.isLoading,
            utilityViews: {
                Group {
                    if let handleFilterTapped = self.onFilterTapped {
                        StyledButton(buttonData: ButtonData(label: Labels.filterTitle,
                                                            icon: "icon-filters",
                                                            badge: self.filterBadge,
                                                            action: handleFilterTapped),
                                     style: "button-toolbar",
                                     iconSize: .medium)
                    }
                    if let handleSortTapped = self.onSortTapped {
                        StyledButton(buttonData: ButtonData(label: Labels.sortTitle,
                                                               icon: "icon-sort",
                                                               action: handleSortTapped),
                                     style: "button-toolbar",
                                     iconSize: .medium)
                    }
                }
            })
    }
}
