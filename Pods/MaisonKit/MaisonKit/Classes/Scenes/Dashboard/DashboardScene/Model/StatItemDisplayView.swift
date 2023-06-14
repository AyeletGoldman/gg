// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

/// A protocol to identify objects that can create views used for stat dashboard item.
public protocol StatItemDisplayView {

    associatedtype Body: View
    /// A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    var isSmallItem: Bool { get }
    /// Creates the body of the stat item view.
    /// - Returns: a view that will represent the body of this stat item
    func makeBody() -> Body
}
