// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct ClientListView: View {

    enum Labels {
        static let sortTitle = MKLocalizedString("client-list.toolbar.sort.title",
                                                 comment: "The text to show for the sort button in client lists")
        static let clientCount = MKLocalizedString("client-list.toolbar.matched-clients.title",
                                                   comment: "The text to show in the client list with the number of clients matching the criteria")
    }

    private var members: ResultState<[ClientMemberDisplayable], Error>

    private let isEditable: Bool
    private let emptyMembersViewModel: AuxiliaryViewModel
    private let headerText: String?
    private let headerView: (any View)?
    private let totalNumberOfMembers: Int?

    private let onDelete: (IndexSet) -> Void
    private let onSortButtonTapped: (() -> Void)?
    private let onSelect: ((ClientMemberDisplayable) -> Void)?
    private let onQuickActionTapped: ((ActionType) -> Void)?
    private let onEndReached: (() -> Void)?

    /// Initializes the client list view
    /// - Parameters:
    ///   - members: a `ResultState` of the array of members in this list
    ///   - totalNumberOfMembers: the total number of members in this list
    ///   - isEditable: whether this list is editable or not
    ///   - emptyMembersViewModel: a view model used for displaying the contents of an empty list
    ///   - headerText: the text to show on the header of the list
    ///   - onSortButtonTapped: an action to execute when the sort button is tapped.
    ///   - onDelete: an action to execute when a list row is asked to be deleted
    ///   - onSelect: an action to execute when a list row is selected. This will usually present the Client360 scene.
    ///   - onQuickActionTapped: Optional. A closure that takes an `ActionType` that represents a quick action selected from a context menu.
    ///   - onEndReached: Optional. A closure to invoke when the end of the client lists is reached.
    public init(members: ResultState<[ClientMemberDisplayable], Error>,
                totalNumberOfMembers: Int? = nil,
                isEditable: Bool,
                emptyMembersViewModel: AuxiliaryViewModel,
                headerText: String? = nil,
                headerView: (() -> (any View))? = nil,
                onSortButtonTapped: (() -> Void)?,
                onDelete: @escaping (IndexSet) -> Void,
                onSelect: ((ClientMemberDisplayable) -> Void)?,
                onQuickActionTapped: ((ActionType) -> Void)?,
                onEndReached: (() -> Void)? = nil) {
        self.members = members
        self.totalNumberOfMembers = totalNumberOfMembers
        self.isEditable = isEditable
        self.emptyMembersViewModel = emptyMembersViewModel
        self.headerText = headerText
        self.onSortButtonTapped = onSortButtonTapped
        self.onDelete = onDelete
        self.onSelect = onSelect
        self.onQuickActionTapped = onQuickActionTapped
        self.onEndReached = onEndReached
        self.headerView = headerView?()
    }

    /// The main body of the client list view. Displays the suitable data depending on the load status.
    /// When it appears it asks the viewmodel to fetch its clients.
    public var body: some View {
        ResultStateViewBuilder(result: self.members)
            .setLoadingView {
                self.buildMainView(members: ClientMemberDisplayable.loadingStateDisplayable)
            }
            .setEmptyView {
                VStack {
                    if let headerText {
                        ExpandableView(text: headerText)
                    }
                    if let headerView {
                        headerView.eraseToAnyView()
                    }
                    AuxiliaryView(viewModel: self.emptyMembersViewModel)
                }
            }.buildContent { members in
                return self.buildMainView(members: members)
            }
    }

    @ViewBuilder
    private func buildMainView(members: [ClientMemberDisplayable]) -> some View {
        MKList {
            if let headerText {
                Section {
                    ExpandableView(text: headerText)
                }
            }
            Section {
                self.buildAllCells(members: members)
                    .onEndReached(self.onEndReached)
            } header: {
                VStack(spacing: 0) {
                    if let headerView {
                        headerView.eraseToAnyView()
                    }
                    self.buildHeader(memberCount: self.totalNumberOfMembers ?? members.count)
                        .addStyledRowDivider()
                }
            }
        }
    }

    @ViewBuilder
    private func buildAllCells(members: [ClientMemberDisplayable]) -> some View {
        ForEach(Array(zip(members.indices, members)), id: \.1.listMemberId) { index, member in
            self.buildCell(member: member, index: index)
        }
        .onDelete(perform: self.isEditable ? self.onDelete : nil)
    }

    @ViewBuilder
    private func buildCell(member: ClientMemberDisplayable, index: Int) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "client-row", variant: self.isEditable ? "swipe-left" : nil)) {
            Button(action: {
                self.onSelect?(member)
            }, label: {
                member.cellProvider.cellCreation().eraseToAnyView()
            })
            .buttonStyle(NoAnimationButtonStyle(if: false))
            .addStyledRowDivider()
            .padding(.horizontal)
            .style("background")
            .addSwipeToDelete(if: self.isEditable) {
                self.onDelete(IndexSet(integer: index))
            }
            .contextMenu(actions: member.cellProvider.quickActions) { actionType in
                self.onQuickActionTapped?(actionType)
            }
        }
    }

    @ViewBuilder
    private func buildHeader(memberCount: Int) -> some View {
        SearchToolbarView(
            title: String(format: Labels.clientCount, memberCount),
            utilityViews: {
                Group {
                    if let sortButtonTapped = self.onSortButtonTapped {
                        StyledButton(buttonData: ButtonData(label: Labels.sortTitle,
                                                            icon: "icon-sort",
                                                            action: sortButtonTapped),
                                     style: "button-toolbar",
                                     iconSize: .medium)
                    }
                }
            }).clipped()
    }
}
