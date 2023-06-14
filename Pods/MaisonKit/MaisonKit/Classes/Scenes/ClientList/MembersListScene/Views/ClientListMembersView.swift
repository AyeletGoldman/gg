// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

public struct ClientListMembersView: View {

    @ObservedObject private var viewModel: MemberListViewModel
    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    init(viewModel: MemberListViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    public var body: some View {
        GeometryReader { proxy in
            ResultStateViewBuilder(result: self.viewModel.dataSource)
                .buildContent { state in
                    return self.buildContent(state: state, proxy: proxy)
                }.animation(.easeOut, value: proxy.safeAreaInsets.top)
        }
        .alert(alertContext: self.$viewModel.alertContext)
    }

    @ViewBuilder
    private func buildContent(state: ClientListMemberState, proxy: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            self.buildStackContent(state: state, proxy: proxy)
        }
        .style("background")
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }

    @ViewBuilder
    private func buildStackContent(state: ClientListMemberState, proxy: GeometryProxy) -> some View {
        switch state {
        case .error(let listInfo, let error):
            ClientListHeaderView(listInfo: listInfo, proxy: proxy)
            AuxiliaryView(viewModel: AuxiliaryViewModel(subtitle: error.localizedDescription))
        case .partial(let listInfo):
            ClientListHeaderView(listInfo: listInfo, proxy: proxy)
            ClientListView.loadingPartialListInfoView()
        case .total(let displayable):
            ClientListHeaderView(listInfo: displayable.listInfo, proxy: proxy)
                .zIndex(2)
            switch displayable.mode {
            case .classic(let members, let cursor, let totalNumberOfClients):
                ClientListView(members: .found(members ?? []),
                               totalNumberOfMembers: totalNumberOfClients,
                               isEditable: displayable.listInfo.isEditable,
                               emptyMembersViewModel: self.viewModel.getEmptyMembersViewModel(),
                               headerText: displayable.listInfo.subtitle,
                               onSortButtonTapped: self.viewModel.shouldShowSortButton ? self.viewModel.presentSortScreen : nil,
                               onDelete: self.viewModel.presentDeleteMemberConfirmation(at:),
                               onSelect: self.viewModel.didSelectListMember(_:),
                               onQuickActionTapped: self.viewModel.handleActionType(action:),
                               onEndReached: cursor != nil ? {
                    self.viewModel.loadNextPage()
                } : nil)
            case .tabbed(let tabs):
                TabbedClientListView(viewModel: self.viewModel,
                                     tabs: tabs ?? [],
                                     isListEditable: displayable.listInfo.isEditable,
                                     subtitle: displayable.listInfo.subtitle)
            }
        }
    }
}

private extension ClientListView {
    static func loadingPartialListInfoView() -> some View {
        ClientListView(members: .loading(nil),
                       isEditable: false,
                       emptyMembersViewModel: AuxiliaryViewModel(),
                       onSortButtonTapped: nil,
                       onDelete: { _ in },
                       onSelect: nil,
                       onQuickActionTapped: nil)
    }
}
