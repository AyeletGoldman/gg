// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI

struct TabbedClientListView: View {

    private let tabs: [ClientMemberListTab]
    @ObservedObject private var viewModel: MemberListViewModel
    private let isListEditable: Bool
    private let subtitle: String?

    init(viewModel: MemberListViewModel, tabs: [ClientMemberListTab], isListEditable: Bool, subtitle: String?) {
        self.viewModel = viewModel
        self.tabs = tabs
        self.isListEditable = isListEditable
        self.subtitle = subtitle
    }

    private var viewTabs: [Tab] {
        return self.tabs.map { tab in
            return Tab(id: tab.id, title: tab.name, badge: nil)
        }
    }

    var body: some View {
        if let selectedTab = self.tabs.first(where: { $0.id == self.viewModel.selectedTabID }) {
            ClientListView(members: .found(selectedTab.members),
                           totalNumberOfMembers: selectedTab.totalNumberOfClients,
                           isEditable: self.isListEditable,
                           emptyMembersViewModel: self.viewModel.getEmptyMembersViewModel(),
                           headerText: self.subtitle,
                           headerView: {
                TabSwitch(selectedTabID: self.$viewModel.selectedTabID, tabs: self.viewTabs)
                    .padding([.horizontal, .top])
            },
                           onSortButtonTapped: self.viewModel.shouldShowSortButton ? self.viewModel.presentSortScreen : nil,
                           onDelete: self.viewModel.presentDeleteMemberConfirmation(at:),
                           onSelect: self.viewModel.didSelectListMember(_:),
                           onQuickActionTapped: self.viewModel.handleActionType(action:),
                           onEndReached: selectedTab.currentTabCursor != nil ? {
                self.viewModel.loadNextPage(for: selectedTab.id)
            } : nil)
        }
    }
}
