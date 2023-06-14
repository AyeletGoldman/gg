// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct RecentlySearchedData {
    let onRecentlySearchTapped: (String) -> Void
    let onClearTapped: () -> Void
    let recentSearches: [String]
    let recentlySearchedHelpBodyText: String
}

struct RecentlySearchedView: View {

    private enum Labels {
        static let clearButtonTitle = MKLocalizedString("search.recently-searched.clearButton.title",
                                                        comment: "The title of the clear button in the recently searched view")
        static let recentlySearchedTitle = MKLocalizedString("search.recently-searched.title", comment: "The title in the recently searched view")
        static let recentlySearchedHelpTitle = MKLocalizedString("search.recently-searched.help.title", comment: "The help text title in the recently searched view")
    }

    private let data: RecentlySearchedData

    init(data: RecentlySearchedData) {
        self.data = data
    }

    init(onRecentlySearchTapped: @escaping (String) -> Void,
         onClearTapped: @escaping () -> Void,
         recentSearches: [String],
         recentlySearchedHelpBodyText: String) {
        self.data = RecentlySearchedData(onRecentlySearchTapped: onRecentlySearchTapped,
                                         onClearTapped: onClearTapped,
                                         recentSearches: recentSearches,
                                         recentlySearchedHelpBodyText: recentlySearchedHelpBodyText)
    }

    var body: some View {
        VStack(spacing: 0) {
            if !self.data.recentSearches.isEmpty {
                self.buildRecentSearches()
            }
            self.buildSearchInitial()
        }
    }

    private func buildRecentSearches() -> some View {
        StylableGroup("list") {
            VStack(alignment: .leading, spacing: 0) {
                self.buildRecentListHeader()
                    .addStyledRowDivider()
                    .padding(.horizontal)
                ForEach(self.data.recentSearches, id: \.self) { text in
                    self.buildRecentListCell(text: text)
                }
            }
            .padding(.bottom, 20)
            .style("background")
        }
    }

    @ViewBuilder
    private func buildRecentListHeader() -> some View {
        SectionHeaderView(title: Labels.recentlySearchedTitle, utilityViews: {
            TertiaryButton(buttonData: ButtonData(label: Labels.clearButtonTitle,
                                                  icon: "icon-close",
                                                  action: self.data.onClearTapped))
            .accessibility(identifier: "clear")
        })
        .padding(.top, 5)
    }

    @ViewBuilder
    private func buildRecentListCell(text: String) -> some View {
        Button(action: {
            self.data.onRecentlySearchTapped(text)
        }, label: {
            ListItemView(title: text, icon: "icon-search")
                .accessibility(identifier: "recent-search")
        })
        .styleAsListRow(includeDivider: true)
        // The selection list is in edit mode, but the contents of the list item view are not
        .environment(\.editMode, .constant(.inactive))
    }

    @ViewBuilder
    private func buildSearchInitial() -> some View {
        StylableGroup("note") {
            VStack(alignment: .leading, spacing: 10) {
                Text(verbatim: Labels.recentlySearchedHelpTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .style("title")
                Text(verbatim: self.data.recentlySearchedHelpBodyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(nil)
                    .style("body")
            }
            .padding(.top, 20)
            .padding(.bottom, 28)
            .padding(.horizontal)
            .style("background")
        }
    }
}
