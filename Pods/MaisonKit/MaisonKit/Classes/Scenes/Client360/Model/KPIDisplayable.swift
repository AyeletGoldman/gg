// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A representation of a KPI. This allows the implementer to either use a pre-designed KPI by creating
/// a `KPIDisplayable` with one of the supplied convenience initializers (with TypedValue or NPS data)
/// or to create a custom view to display a KPI.
public struct KPIDisplayable: Identifiable {

    private enum Constants {
        static let kpiSize = CGSize(width: 80, height: 75)
    }

    private let body: any View
    /// The stable identity of the entity associated with this instance.
    public let id: String

    /// Creates a new `KPIDisplayable`
    /// - Parameters:
    ///   - id: The stable identity of the entity associated with this instance.
    ///   - body: A closure that will create the view for this KPI
    public init(id: String = UUID().uuidString, body: () -> some View) {
        self.body = body()
        self.id = id
    }

    /// Creates the view that represents the KPI in question
    /// - Returns: a `View` that represents the KPI
    public func makeBody() -> some View {
        self.body.eraseToAnyView()
    }
}

public extension KPIDisplayable {

    /// Creates a new `KPIDisplayable` with a given `TypedField`.
    /// Uses the field's `value` as the `title` style and the field's
    /// `title` property as the `subtitle` style.
    /// - Parameter typedField: a typed field to use to create the view for a KPI.
    /// - Returns: a new `KPIDisplayable` that will create a view from the given `TypedField`
    static func typedField(_ typedField: TypedField) -> KPIDisplayable {
        return KPIDisplayable(id: typedField.id,
                              body: {
            KPIItemView(title: { Text(verbatim: typedField.value.toString()).style("title") },
                        subtitle: typedField.title,
                        stylistVariant: nil)
        })
    }
}

public extension KPIDisplayable {

    /// Creates a new `KPIDisplayable` configured to display an NPS score.
    /// - Parameters:
    ///   - value: The value of the NPS score
    ///   - maximumValue: The maximum value available for this NPS score
    ///   - stylistVariant: The variant to apply to the `block` style
    /// - Returns: A new `KPIDisplayable` that will create a view to display an NPS score.
    static func nps(value: Int, maximumValue: Int, stylistVariant: String?) -> KPIDisplayable {
        return KPIDisplayable(body: {
            KPIItemView(title: { NPSKPIItemTitle(value: value, maximumValue: maximumValue) },
                        subtitle: MKLocalizedString("client360.kpis.nps.subtitle",
                                                    comment: "The subtitle to show in a KPI to indicate it was an NPS score"),
                        stylistVariant: stylistVariant)
        })
    }
}
