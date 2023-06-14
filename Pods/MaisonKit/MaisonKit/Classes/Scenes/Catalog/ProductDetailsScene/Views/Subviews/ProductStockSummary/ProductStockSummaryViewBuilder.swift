// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A protocol for view builders that want to provide views for the product details to display stock information
/// Create an object that conforms to this protocol to provide a view for the product details screen to show, optionally
/// with two different modes; one for "private" display and one with more details.
public protocol ProductStockSummaryViewBuilder {

    /// Creates the body of the stat item view.
    /// - Parameter privacyMode: The mode the view is shown.
    /// - Returns: a view to represent the stock in a privacy-aware mode
    func makeBody(privacyMode: PrivacyMode) -> AnyView
}

/// A product stock information view builder that shows "generic" stock levels; i.e. not very specific information in image format.
public struct GenericProductStockSummary: ProductStockSummaryViewBuilder {

    /// The data to be displayed in the view that this view builder will make
    public struct Data {
        let area: String
        let stockImageIdentifier: StylistIdentifier

        /// Creates a new copy of GenericProductStockSummary.Data
        /// - Parameters:
        ///   - area: the area in which the stock is held
        ///   - stockImageIdentifier: the identifier to use to create the image to be displayed
        public init(area: String, stockImageIdentifier: StylistIdentifier) {
            self.area = area
            self.stockImageIdentifier = stockImageIdentifier
        }
    }

    let stockInfo: [Data]

    /// Creates a new instance of GenericProductStockSummary
    /// - Parameters:
    ///   - stockInfo: the array of data to show in the view.
    public init(stockInfo: [Data]) {
        self.stockInfo = stockInfo
    }

    /// Returns the title for the stock view, if there is any
    /// - Parameter privacyMode: The mode the view is shown.
    /// - Returns: A view, stacked horizontally with `ImageBlockView`s
    @ViewBuilder
    public func makeBody(privacyMode: PrivacyMode) -> AnyView {
        HStack {
            ForEach(0..<self.stockInfo.count, id: \.self) { index in
                ImageBlockView(image: .styledImage(identifier: self.stockInfo[index].stockImageIdentifier),
                               subtitle: self.stockInfo[index].area)
            }
        }.eraseToAnyView()
    }
}

/// A product stock information view builder that shows specific stock levels; i.e. accurate information about stock in text.
public struct SpecificProductStockSummary: ProductStockSummaryViewBuilder {

    /// The data to be displayed in the view that the SpecificProductStockSummary builder will make
    public struct Data {
        let area: String
        let amount: String
        let isInStock: Bool

        /// Creates a new SpecificProductStockSummary.Data
        /// - Parameters:
        ///   - area: the area in which the stock is held
        ///   - amount: a string determining how much stock is held. It's a string to allow for inputs like "100+", or "1k+"
        ///   - isInStock: a value to determine whether this item is in stock or not. This is used to style the interface appropriately.
        public init(area: String, amount: String, isInStock: Bool) {
            self.area = area
            self.amount = amount
            self.isInStock = isInStock
        }

        var variant: AvailabilityVariant {
            if self.isInStock {
                return .inStock
            }
            return .outOfStock
        }

    }

    let stockInfo: [Data]

    /// Creates a new instance of SpecificProductStockSummary
    /// - Parameters:
    ///   - stockInfo: the array of data to show in the view.
    public init(stockInfo: [Data]) {
        self.stockInfo = stockInfo
    }

    /// Returns the title for the stock view, if there is any
    /// - Parameter privacyMode: The mode the view is shown.
    /// - Returns: A view, stacked horizontally with `TextBlockView`s
    @ViewBuilder
    public func makeBody(privacyMode: PrivacyMode) -> AnyView {
        HStack {
            ForEach(0..<self.stockInfo.count, id: \.self) { index in
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "block",
                                                                    variant: self.stockInfo[index].variant.rawValue)) {
                    TextBlockView(title: self.stockInfo[index].amount,
                                  subtitle: self.stockInfo[index].area)
                }
            }
        }.eraseToAnyView()
    }
}

/// A product stock information view builder that shows generic stock levels or specific stock levels depending on the
/// `PrivacyMode` that is passed into the `makeBody` function.
public struct PrivacyAwareProductStockSummary: ProductStockSummaryViewBuilder {

    private enum Labels {
        static let tapToHide = MKLocalizedString("product-details.stock-information.caption.hide",
                                                 comment: "The label to show in the product details screen when stock information is displayed")
        static let tapToShow = MKLocalizedString("product-details.stock-information.caption.show",
                                                 comment: "The label to show in the product details screen when stock information is behind a privacy control")
    }

    /// The data to be displayed in the view that the PrivacyAwareProductStockSummary builder will make
    public struct Data: Equatable {
        let area: String
        let amount: String
        let isInStock: Bool

        var stockImageIdentifier: StylistIdentifier {
            if self.isInStock {
                return .inStockIconIdentifier
            }
            return .outOfStockIconIdentifier
        }

        var variant: AvailabilityVariant {
            if self.isInStock {
                return .inStock
            }
            return .outOfStock
        }

        /// Creates a new PrivacyAwareProductStockSummary.Data
        /// - Parameters:
        ///   - area: the area in which the stock is held
        ///   - amount: a string ddetermining how much stock is held. It's a string to allow for inputs like "100+", or "1k+"
        ///   - isInStock: whether the item is considered to be in stock or not
        public init(area: String, amount: String, isInStock: Bool) {
            self.area = area
            self.amount = amount
            self.isInStock = isInStock
        }
    }

    /// The default value for the title closure.
    /// If the `privacyMode` is `.detail` it returns localized text indicating the user to "tap to hide"
    /// If the `privacyMode` is `.privacy` it returns localized text indicating the user to "tap to show"
    public static let defaultTitleClosure: (PrivacyMode) -> String? = { privacyMode in
        switch privacyMode {
        case .detail:
            return Labels.tapToHide
        case .privacy:
            return Labels.tapToShow
        }
    }

    let stockInfo: [Data]

    /// Creates a new instance of PrivacyAwareProductStockSummary
    /// - Parameters:
    ///   - stockInfo: the array of data to show in the view.
    public init(stockInfo: [Data]) {
        self.stockInfo = stockInfo
    }

    /// Returns the title for the stock view, if there is any
    /// - Parameter privacyMode: The mode the view is shown.
    /// - Returns: a view, dependant on the `privacyMode`, that will either show detailed levels of stock or generic levels of stock.
    public func makeBody(privacyMode: PrivacyMode) -> AnyView {
        HStack {
            ForEach(0..<self.stockInfo.count, id: \.self) { index in
                ZStack { // ZStack for keeping on the same height for both views
                    StylableGroup(StylistIdentifier.buildFullIdentifier(for: "block",
                                                                        variant: self.stockInfo[index].variant.rawValue)) {
                        TextBlockView(title: self.stockInfo[index].amount,
                                      subtitle: self.stockInfo[index].area)
                            .hidden(privacyMode != .detail)
                    }
                    StylableGroup(StylistIdentifier.buildFullIdentifier(for: "block",
                                                                        variant: "\(self.stockInfo[index].variant.rawValue)-hide")) {
                        ImageBlockView(image: .styledImage(identifier: self.stockInfo[index].stockImageIdentifier),
                                       subtitle: self.stockInfo[index].area)
                            .hidden(privacyMode != .privacy)
                    }
                }
            }
        }
        .transition(.opacity)
        .animation(.default, value: self.stockInfo)
        .eraseToAnyView()
    }
}
