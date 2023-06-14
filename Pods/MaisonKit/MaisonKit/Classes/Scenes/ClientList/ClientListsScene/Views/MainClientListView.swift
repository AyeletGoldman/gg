// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import Combine

public struct MainClientListView: View {

    @ObservedObject private var viewModel: MainClientListViewModel

    public init(viewModel: MainClientListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        self.buildMainView()
            .alert(alertContext: self.$viewModel.alertContext)
    }

    @ViewBuilder
    private func buildMainView() -> some View {
        ResultStateViewBuilder(result: self.viewModel.clientLists)
            .setLoadingView {
                self.buildLists(with: ClientListSection.loadingStateDisplayable)
            }
            .buildContent { section in
                self.buildLists(with: section)
            }
    }

    // Builds both sections in the screen: the "carousel" and the "list".
    private func buildLists(with section: ClientListSection) -> some View {
        MKList {
            if !section.featured.clientLists.isEmpty {
                FeaturedClientListsView(clientLists: section.featured.clientLists,
                                        sectionTitle: section.featured.title,
                                        presentMemberListScene: { listId in
                    self.viewModel.presentMemberListScene(listId: listId, listType: section.featured.listTypeIdentifier)
                })
            }

            PersonalClientListsView(clientLists: section.personal.clientLists,
                                    sectionTitle: section.personal.title,
                                    isEditing: self.$viewModel.isEditingPersonalLists,
                                    didTapCreateClientList: self.viewModel.didTapCreateClientList,
                                    didTapDeleteClientList: self.viewModel.deleteClientListConfirmPopup,
                                    presentMemberListScene: { listId in
                self.viewModel.presentMemberListScene(listId: listId, listType: section.personal.listTypeIdentifier)
            })
        }
    }
}
