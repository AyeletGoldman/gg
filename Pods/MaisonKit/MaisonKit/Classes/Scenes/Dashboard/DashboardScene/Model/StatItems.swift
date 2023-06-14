// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

/// A stat item object that can build a view that presents multiple values + present them on a stat bar
public struct MultiValueBarStat: StatItemDisplayView {

    /// A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public let isSmallItem: Bool
    /// The object data.
    let data: MultiValueBarStatBlockView.Data

    /// Creates a new MultiValueBarStat to be used in dashboard screen
    /// - Parameters:
    ///   - data: The object data.
    ///   - isSmallItem: A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public init(data: MultiValueBarStatBlockView.Data, isSmallItem: Bool? = nil) {
        self.data = data
        self.isSmallItem = isSmallItem ??
            // If there is only one section with only one column inside the item can take just haf of the scrren
            (data.categoriesSections.count == 1 && data.categoriesSections.first?.numberOfColumns == 1)
    }

    @ViewBuilder
    public func makeBody() -> some View {
        MultiValueBarStatBlockView(data: self.data)
    }
}

/// A stat item object that can build a view that presents a single value + present it on a stat bar
public struct SingleValueBarStat: StatItemDisplayView {

    /// A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public let isSmallItem: Bool
    /// The object data.
    let data: SingleValueBarStatBlockView.Data

    /// Creates a new SingleValueBarStat to be used in dashboard screen
    /// - Parameters:
    ///   - data: The object data.
    ///   - isSmallItem: A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public init(data: SingleValueBarStatBlockView.Data, isSmallItem: Bool = true) {
        self.data = data
        self.isSmallItem = isSmallItem
    }

    @ViewBuilder
    public func makeBody() -> some View {
        SingleValueBarStatBlockView(data: self.data)
    }
}

/// A stat item object that can build a view that presents a single value
public struct SimpleStat: StatItemDisplayView {

    /// A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public let isSmallItem: Bool
    /// The object data.
    let data: SimpleStatBlockView.Data

    /// Creates a new SimpleStat to be used in dashboard screen
    /// - Parameters:
    ///   - data: The object data.
    ///   - isSmallItem: A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public init(data: SimpleStatBlockView.Data, isSmallItem: Bool = true) {
        self.data = data
        self.isSmallItem = isSmallItem
    }

    @ViewBuilder
    public func makeBody() -> some View {
        SimpleStatBlockView(data: self.data)
    }
}

/// A stat item object that can build a view that presents a single total value + items (recommended top to 4 items) +  present the items on a circular progress bar
public struct CircularProgressStat: StatItemDisplayView {

    /// A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public let isSmallItem: Bool
    /// The object data.
    let data: CircularProgressStatBlockView.Data

    /// Creates a new CircularProgressStat to be used in dashboard screen
    /// - Parameters:
    ///   - data: The object data.
    ///   - isSmallItem: A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public init(data: CircularProgressStatBlockView.Data, isSmallItem: Bool = false) {
        self.data = data
        self.isSmallItem = isSmallItem
    }

    @ViewBuilder
    public func makeBody() -> some View {
        CircularProgressStatBlockView(data: self.data)
    }
}

/// A stat item object that can build a view that presents text description +  present single value on a circular progress bar
public struct CircularProgressDetailStat: StatItemDisplayView {

    /// A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public let isSmallItem: Bool
    /// The object data.
    let data: CircularProgressDetailStatBlockView.Data

    /// Creates a new CircularProgressDetailStat to be used in dashboard screen
    /// - Parameters:
    ///   - data: The object data.
    ///   - isSmallItem: A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public init(data: CircularProgressDetailStatBlockView.Data, isSmallItem: Bool = false) {
        self.data = data
        self.isSmallItem = isSmallItem
    }

    @ViewBuilder
    public func makeBody() -> some View {
        CircularProgressDetailStatBlockView(data: self.data)
    }
}

/// A stat item object that can build a view that presents presents multiple circular progress bars (recommended top to 4 items)
public struct MultiCircularStat: StatItemDisplayView {

    /// A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public let isSmallItem: Bool
    /// The object data.
    let data: MultiCircularStatBlockView.Data

    /// Creates a new MultiCircularStat to be used in dashboard screen
    /// - Parameters:
    ///   - data: The object data.
    ///   - isSmallItem: A variable to define if the item can take place of half of the row (`DashboardRow.couple`)  or full row (`DashboardRow.single`).
    public init(data: MultiCircularStatBlockView.Data, isSmallItem: Bool = false) {
        self.data = data
        self.isSmallItem = isSmallItem
    }

    @ViewBuilder
    public func makeBody() -> some View {
        MultiCircularStatBlockView(data: self.data)
    }
}
