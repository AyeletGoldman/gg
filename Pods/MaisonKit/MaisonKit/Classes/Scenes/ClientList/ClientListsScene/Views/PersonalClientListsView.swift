// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// Personal client lists view. Having an option to create a new list, delete a list and navigate to personal client list members screen.
public struct PersonalClientListsView: View {

    private enum Labels {
        static let createListButtonText = MKLocalizedString("client-list.create-list.button.title",
                                                            comment: "Title of the create list button")
        static let clientListEmptyTitle = MKLocalizedString("client-lists.empty.title",
                                                            comment: "Empty view title when there are no lists")
        static let clientListEmptySubtitle = MKLocalizedString("client-lists.empty.subtitle",
                                                               comment: "Empty view subtitle when there are no lists")
        static let clientListEmptyButtonTitle = MKLocalizedString("client-lists.empty.button.title",
                                                                  comment: "Empty view button title when there are no lists")
    }

    private let clientLists: [ClientListDisplayable]
    private let sectionTitle: String
    @Binding private var isEditing: Bool
    private let presentMemberListScene: (String) -> Void
    private let didTapCreateClientList: (() -> Void)?
    private let didTapDeleteClientList: ((String) -> Void)?

    /// Creates a new `PersonalClientListsView`
    /// - Parameters:
    ///   - clientLists: The client lists.
    ///   - sectionTitle: The section title.
    ///   - isEditing: Whether the view is in edit mode or not for deleting client lists.
    ///   - didTapCreateClientList: Optional. A closure to perform on taping the create list button.
    ///   - didTapDeleteClientList: Optional. A closure to perform on taping to delete a list.
    ///   - presentMemberListScene: A closure to perform to navigate to member list scene.
    public init(clientLists: [ClientListDisplayable],
                sectionTitle: String,
                isEditing: Binding<Bool>,
                didTapCreateClientList: (() -> Void)? = nil,
                didTapDeleteClientList: ((String) -> Void)? = nil,
                presentMemberListScene: @escaping (String) -> Void) {
        self.clientLists = clientLists
        self.sectionTitle = sectionTitle
        self._isEditing = isEditing
        self.didTapCreateClientList = didTapCreateClientList
        self.didTapDeleteClientList = didTapDeleteClientList
        self.presentMemberListScene = presentMemberListScene
    }

    public var body: some View {
        SectionHeaderView(title: sectionTitle,
                          utilityViews: {
            self.buildListUtilityButtons(isEmptyLists: clientLists.isEmpty)
        })
        .addStyledRowDivider()
        .padding(.horizontal)

        if self.clientLists.isEmpty {
            self.buildEmptyPersonalListsView()
        } else {
            ForEach(self.clientLists) { personalList in
                self.buildPersonalListRow(for: personalList)
            }
        }
    }

    @ViewBuilder
    private func buildListUtilityButtons(isEmptyLists: Bool) -> some View {
        HStack(spacing: 5) {
            if self.didTapDeleteClientList != nil {
                StylableEditButton(isEditing: self.$isEditing)
                    .hidden(isEmptyLists)
            }
            if self.didTapCreateClientList != nil {
                self.buildCreateButton()
                    .hidden(isEmptyLists)
            }
        }
    }

    @ViewBuilder
    private func buildCreateButton() -> some View {
        TertiaryButton(buttonData: ButtonData(
            label: Labels.createListButtonText,
            icon: StylistIdentifier("icon-add"),
            action: { self.didTapCreateClientList?() }
        ))
        .hidden(self.isEditing)
    }

    @ViewBuilder
    private func buildPersonalListRow(for clientList: ClientListDisplayable) -> some View {
        Button(action: {
            self.presentMemberListScene(clientList.id)
        }, label: {
            ListItemView(title: clientList.listInfo.title, subtitle: clientList.listInfo.subtitle)
                .stackWithDeleteButton(if: self.isEditing) {
                    self.didTapDeleteClientList?(clientList.id)
                }
                .contentShape(Rectangle())
        })
        .stackWithAccessory(if: !self.isEditing)
        .buttonStyle(PlainButtonStyle())
        .animation(.spring(), value: self.isEditing) // For animating the edit mode in or out
        .animation(.spring(), value: self.clientLists.count) // For animating deleting a client list
        .styleAsListRow(includeDivider: true)
    }

    @ViewBuilder
    private func buildEmptyPersonalListsView() -> some View {
        AuxiliaryView(viewModel: AuxiliaryViewModel.emptyDataModel(
            title: Labels.clientListEmptyTitle,
            subtitle: Labels.clientListEmptySubtitle,
            buttonData: self.didTapCreateClientList.map {
                ButtonData(
                    label: Labels.clientListEmptyButtonTitle,
                    icon: StylistIdentifier("icon-add"),
                    action: $0)
            }
        ))
    }
}
