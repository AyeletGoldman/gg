// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension OrderSectionField {

    /// A convenience initializer to create an `OrderSectionField` whose `title` property will be created from the given `date` parameter.
    /// The date will be formatted in `medium` style, e.g. "March 25, 2022".
    /// - Parameters:
    ///   - date: The date to format and use as a title
    ///   - title: The title to display, this is usually the selected value
    ///   - tag: Optional. A badge to display on the field, usually a small piece of text like a price or a date. Defaults to `nil`.
    ///   - onTap: Optional. A closure to execute when this field is tapped. Defaults to `nil`.
    ///   - footer: Optional. The footer view to display below the subtitle.
    init<Footer: View>(date: Date?,
                       title: String,
                       tag: String? = nil,
                       onTap: (() -> Void)? = nil,
                       @ViewBuilder footer: () -> Footer) {
        self.title = title
        self.subtitle = date.map { DateFormatter.medium.string(from: $0) }
        self.tag = tag
        self.onTap = onTap
        self.footer = footer().eraseToAnyView()
    }

    /// A convenience initializer to create an `OrderSectionField` whose `title` property will be created from the given `date` parameter.
    /// The date will be formatted in `medium` style, e.g. "March 25, 2022".
    /// - Parameters:
    ///   - date: The date to format and use as a title
    ///   - title: The title to display, this is usually the selected value
    ///   - tag: Optional. A badge to display on the field, usually a small piece of text like a price or a date. Defaults to `nil`.
    ///   - onTap: Optional. A closure to execute when this field is tapped. Defaults to `nil`.
    init(date: Date?, title: String, tag: String? = nil, onTap: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = date.map { DateFormatter.medium.string(from: $0) }
        self.tag = tag
        self.onTap = onTap
        self.footer = nil
    }

    /// A convenience initializer to create an `OrderSectionField` whose `title` property will be created from the given `date` parameter
    /// and whose `Footer` is a `TransactionPaymentInformationView`. Use this initializer to create a field that will display data about
    /// a payment that was made online, via pay-by-link.
    /// The date will be formatted in `medium` style, e.g. "March 25, 2022".
    /// - Parameters:
    ///   - date: The date to format and use as a title
    ///   - title: The title to display, this is usually the selected value
    ///   - tag: Optional. A badge to display on the field, usually a small piece of text like a price or a date. Defaults to `nil`.
    ///   - onTap: Optional. A closure to execute when this field is tapped. Defaults to `nil`.
    ///   - paymentInformation: payment information to display in the footer.
    init(date: Date?,
         title: String,
         tag: String? = nil,
         onTap: (() -> Void)? = nil,
         paymentInformation: TransactionPaymentInformation) {
        self.init(date: date,
                  title: title,
                  tag: tag,
                  onTap: onTap,
                  footer: { TransactionPaymentInformationView(data: paymentInformation) })
    }
}
