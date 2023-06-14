// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension OrderSectionField {
    /// A convenience initializer to create an `OrderSectionField` whose `Footer` is a `TransactionPaymentInformationView`.
    /// Use this initializer to create a field that will display data about a payment that was made online, via pay-by-link.
    /// - Parameters:
    ///   - title: The title to display, this is usually the selected value or a value that represents the information the title refers to.
    ///   - subtitle: The subtitle to display, e.g. the type of field. "Delivery method", "Client"...
    ///   - tag: Optional. A badge to display on the field, usually a small piece of text like a price or a date. Defaults to `nil`.
    ///   - onTap: Optional. A closure to execute when this field is tapped. Defaults to `nil`.
    ///   - paymentInformation: A set of payment information used to build a footer for the field.
    init(title: String,
         subtitle: String?,
         tag: String? = nil,
         onTap: (() -> Void)? = nil,
         paymentInformation: TransactionPaymentInformation) {
        self.title = title
        self.subtitle = subtitle
        self.tag = tag
        self.onTap = onTap
        self.footer = TransactionPaymentInformationView(data: paymentInformation).eraseToAnyView()
    }
}
