// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct NotificationCenterView: View {

    private enum Labels {
        static let allTitle = MKLocalizedString("notification-center.toolbar.filter-all.title",
                                                comment: "Title for seeing all notification center items")
        static let unreadTitle = MKLocalizedString("notification-center.toolbar.filter-unread.title",
                                                   comment: "Title for seeing unread notification center items")
        static let itemsCount = MKLocalizedString("notification-center.toolbar.matched-items.title",
                                                  comment: "The text to show in the notification center with the number of items matching the criteria")
        static let emptyDataTitle = MKLocalizedString("notification-center.empty.title",
                                                      comment: "Title for notification center empty data title")
        static let emptyDataSubtitle = MKLocalizedString("notification-center.empty.subtitle",
                                                         comment: "Subtitle for notification center empty data subtitle")
        static let emptyUnreadTitle = MKLocalizedString("notification-center.empty-unread.title",
                                                        comment: "Title for notification center empty unread data title")
        static let emptyUnreadSubtitle = MKLocalizedString("notification-center.empty-unread.subtitle",
                                                           comment: "Subtitle for notification center empty unread data subtitle")
    }

    @ObservedObject private var viewModel: NotificationCenterViewModel

    init(viewModel: NotificationCenterViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 0) {
            ResultStateViewBuilder(result: self.viewModel.displayable)
                .setErroredAction(ButtonData(label: GeneralErrorLabel.retryButtonTitle,
                                             icon: "icon-retry",
                                             action: { self.viewModel.fetchData() }))
                .setLoadingView {
                    self.buildMain(displayable: .loadingData)
                }
                .setEmptyView {
                    self.emptyView
                }
                .buildContent { displayable in
                    self.buildMain(displayable: displayable)
                }
        }
        .style("background")
    }

    private var emptyView: some View {
        return AuxiliaryView(viewModel: .emptyDataModel(
            title: self.viewModel.showOnlyUnread ? Labels.emptyUnreadTitle : Labels.emptyDataTitle,
            subtitle: self.viewModel.showOnlyUnread ? Labels.emptyUnreadSubtitle : Labels.emptyDataSubtitle,
            buttonData: ButtonData(label: GeneralErrorLabel.retryButtonTitle,
                                   icon: "icon-retry",
                                   action: { self.viewModel.fetchData(force: true) })))
    }

    private func buildMain(displayable: NotificationCenterDisplayable) -> some View {
        VStack(spacing: 0) {
            self.buildToolbar(itemsCount: self.viewModel.getTotalFilteredItems(for: displayable.sections))
            let sections = self.viewModel.getFilteredItems(for: displayable.sections)
            if sections.isEmpty {
                self.emptyView
            } else {
                MKList {
                    ForEach(sections) { section in
                        if !section.items.isEmpty {
                            SectionHeaderView(title: section.sectionTitle)
                                .addStyledRowDivider()
                                .padding(.horizontal)

                            ForEach(section.items) { item in
                                self.buildNotificationItem(item: item)
                                    .padding(.top, 8)
                            }
                        }
                    }
                    Spacer(minLength: 20)
                }
                .refreshable {
                    await self.viewModel.refreshData()
                }
            }
        }
    }

    private func buildToolbar(itemsCount: Int) -> some View {
        SearchToolbarView(
            title: String(format: Labels.itemsCount, itemsCount),
            utilityViews: {
                Group {
                    StyledButton(buttonData: ButtonData(label: self.viewModel.showOnlyUnread ? Labels.unreadTitle : Labels.allTitle,
                                                        icon: self.viewModel.showOnlyUnread ? "icon-eye-closed" : "icon-eye-open",
                                                        action: { withAnimation { self.viewModel.showOnlyUnread.toggle() }}),
                                 style: "button-toolbar",
                                 iconSize: .medium)
                    .transition(.scale)
                }
            })
        .addStyledRowDivider()
    }

    @ViewBuilder
    private func buildNotificationItem(item: NotificationCenterRow) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "notification",
                                                            variant: item.isRead ? "read" : "unread")) {
            Button(action: {
                self.viewModel.didTapItem(item)
            }, label: {
                item.cellProvider(item.isRead)
            })
            .buttonStyle(NoAnimationButtonStyle(if: false))
            .disabled(item.action == nil)
            .addSwipeToRead(isRead: item.isRead, action: {
                self.viewModel.markItemAsReadOrUnread(item)
            })
            .padding(.horizontal)
        }
    }
}

extension NotificationCenterDisplayable: EmptyStateRepresentable {
    public var isEmpty: Bool {
        return self.sections.isEmpty
    }
}

private extension NotificationCenterDisplayable {
    static let loadingData = NotificationCenterDisplayable(
        sections: [
            .today(items: [
                NotificationCenterItem(id: UUID().uuidString,
                                       icon: .styledImage(identifier: "icon-cart"),
                                       title: "Follow up reminder",
                                       subtitles: [LabeledValue(label: "Client", value: "Client name")],
                                       date: Date(),
                                       isRead: true)
            ]),
            .recent(items: (0...4).map { _ in NotificationCenterItem(id: UUID().uuidString,
                                                                     icon: .styledImage(identifier: "icon-cart"),
                                                                     title: "Follow up reminder",
                                                                     subtitles: [LabeledValue(label: "Client", value: "Client name")],
                                                                     date: Date(),
                                                                     isRead: true) })
        ]
    )
}
