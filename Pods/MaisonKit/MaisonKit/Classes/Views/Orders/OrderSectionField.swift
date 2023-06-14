// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// Each of the fields that describe an order
/// For example, a delivery method, a client selection...
public struct OrderSectionField {

    /// The title to display, this is usually the selected value
    public let title: String

    /// The subtitle to display, e.g. the type of field. "Delivery method", "Client"...
    public let subtitle: String?

    /// A badge to display on the field, usually a small piece of text like a price or a date.
    public let tag: String?

    /// A closure to execute when this field is tapped.
    public let onTap: (() -> Void)?

    /// Optional. A footer view to display below the subtitle.
    public let footer: AnyView?

    /// Creates a new `OrderSectionField` instance
    /// - Parameters:
    ///   - title: The title to display, this is usually the selected value
    ///   - subtitle: The subtitle to display, e.g. the type of field. "Delivery method", "Client"...
    ///   - tag: A badge to display on the field, usually a small piece of text like a price or a date.
    ///   - onTap: A closure to execute when this field is tapped.
    ///   - footer: Optional. A footer view to display below the subtitle.
    public init<Footer: View>(title: String, subtitle: String?, tag: String? = nil, onTap: (() -> Void)? = nil, footer: () -> Footer) {
        self.title = title
        self.subtitle = subtitle
        self.tag = tag
        self.onTap = onTap
        self.footer = footer().eraseToAnyView()
    }

    /// Creates a new `OrderSectionField` instance
    /// - Parameters:
    ///   - title: The title to display, e.g. the type of field. "Delivery method", "Client"...
    ///   - subtitle: The subtitle to display, this is usually the selected value
    ///   - tag: A price to display on the field
    ///   - onTap: A closure to execute when this field is tapped.
    ///   - footer: Optional. A footer view to display below the subtitle.
    public init<Footer: View>(title: String, subtitle: String, tag: CurrencyConvertable, onTap: (() -> Void)? = nil, footer: () -> Footer) {
        self.title = title
        self.subtitle = subtitle
        self.tag = tag.toString()
        self.onTap = onTap
        self.footer = footer().eraseToAnyView()
    }
}

public extension OrderSectionField {

    /// Creates a new `OrderSectionField` instance
    /// - Parameters:
    ///   - title: The title to display, this is usually the selected value
    ///   - subtitle: The subtitle to display, e.g. the type of field. "Delivery method", "Client"...
    ///   - tag: A badge to display on the field, usually a small piece of text like a price or a date.
    ///   - onTap: A closure to execute when this field is tapped.
    init(title: String, subtitle: String?, tag: String? = nil, onTap: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.tag = tag
        self.onTap = onTap
        self.footer = nil
    }

    /// Creates a new `OrderSectionField` instance
    /// - Parameters:
    ///   - title: The title to display, e.g. the type of field. "Delivery method", "Client"...
    ///   - subtitle: The subtitle to display, this is usually the selected value
    ///   - tag: A price to display on the field
    ///   - onTap: A closure to execute when this field is tapped.
    init(title: String, subtitle: String, tag: CurrencyConvertable, onTap: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.tag = tag.toString()
        self.onTap = onTap
        self.footer = nil
    }
}
