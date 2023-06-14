// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct DashboardView: View {

    private enum Labels {
        static let dashboardHeadingFilterButton = MKLocalizedString("dashboard.heading.button.title",
                                                                    comment: "The title for default filter button on the dashboard heading")
    }

    @ObservedObject private var viewModel: DashboardViewModel

    public init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        StylableGroup("dashboard") {
            VStack(spacing: 0) {
                ResultStateViewBuilder(result: self.viewModel.dashboardRows)
                    .setErroredAction(ButtonData(label: GeneralErrorLabel.retryButtonTitle,
                                                 icon: "icon-retry",
                                                 action: self.viewModel.fetchDashboard))
                    .setLoadingView {
                        self.buildSectionHeader()
                        self.buildDashboardView(dashboardItems: .buildLoadingItems())
                    }.buildContent { dashboard in
                        self.buildSectionHeader()
                        self.buildDashboardView(dashboardItems: dashboard)
                    }
            }
            .style("background")
        }
    }

    @ViewBuilder
    private func buildSectionHeader() -> some View {
        if self.viewModel.hasFilters {
            SearchToolbarView(
                title: self.viewModel.getToolbarTitle(),
                utilityViews: {
                    StyledButton(buttonData: ButtonData(label: Labels.dashboardHeadingFilterButton,
                                                        icon: "icon-filters",
                                                        action: self.viewModel.presentFilters),
                                 style: "button-toolbar",
                                 iconSize: .medium)
                })
                .addStyledRowDivider()
        }
    }

    @ViewBuilder
    private func buildDashboardView(dashboardItems: [any StatItemDisplayView]) -> some View {
        MKList {
            VStack(spacing: 15) {
                self.buildRows(from: dashboardItems)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            .padding(.top, 15)
        }
        .refreshable {
            await self.viewModel.refreshDashboard()
        }
    }

    private func buildRows(from items: [any StatItemDisplayView]) -> some View {
        var views = [any View]()
        var index = 0
        while index < items.count {
            if items[index].isSmallItem && items[safe: index + 1]?.isSmallItem == true {
                views.append(StatRowView(
                    items[index].makeBody().eraseToAnyView(),
                    items[index + 1].makeBody().eraseToAnyView()
                ))
                index += 2
            } else {
                views.append(items[index].makeBody())
                index += 1
            }
        }
        return ForEach(0 ..< views.count, id: \.self) { index in
            views[index].eraseToAnyView()
        }
    }
}

private extension Array where Element == any StatItemDisplayView {
    static func buildLoadingItems() -> [any StatItemDisplayView] {
        return [
            self.buildCoupleRow(),
            [self.buildSingleRow()],
            self.buildCoupleRow(),
            [self.buildSingleRow()],
            self.buildCoupleRow()
        ].flatMap { $0 }
    }

    private static func buildCoupleRow() -> [any StatItemDisplayView] {
        return [SimpleStat(data: .init(title: "Title",
                                       value: "£300")),
                SingleValueBarStat(data: .init(title: "Title 2",
                                               value: "£100",
                                               progress: 0))]
    }

    private static func buildSingleRow() -> any StatItemDisplayView {
        return MultiCircularStat(data: .init(title: "Title",
                                             items: [
                                                self.buildSingleRowItem(),
                                                self.buildSingleRowItem(),
                                                self.buildSingleRowItem(),
                                                self.buildSingleRowItem()
                                             ]))
    }

    private static func buildSingleRowItem() -> MultiCircularStatBlockView.Value {
        return MultiCircularStatBlockView.Value(value: 0,
                                                color: .clear,
                                                title: "Some title",
                                                body: "Some body")
    }
}
