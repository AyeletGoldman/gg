// Copyright © 2022 LVMH. All rights reserved.

import Foundation

extension Client360Displayable {

    /// Model used for holding and displaying all kpis associated to a client
    public struct KPI {

        /// The array containing all the KPIs that should be displayed on the client profile.
        /// These KPIs are arranged in a horizontal scrolling UI.
        let items: [KPIDisplayable]

        /// Creates a new Header to be used in `Client360HeaderView`
        /// - Parameters:
        ///   - items: An array containing kpis as `TypedField`
        public init(items: [TypedField] = []) {
            self.items = items.map { .typedField($0) }
        }

        /// Creates a new `KPI` with the given `KPIDisplayable` array.
        /// - Parameter kpiDisplayables: The array containing all the KPIs that should be displayed on the client profile.
        /// These KPIs are arranged in a horizontal scrolling UI.
        public init(kpiDisplayables: [KPIDisplayable] = []) {
            self.items = kpiDisplayables
        }
    }
}
