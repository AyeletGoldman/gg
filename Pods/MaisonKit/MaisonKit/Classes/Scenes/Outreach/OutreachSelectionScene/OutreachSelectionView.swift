// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

struct OutreachSelectionView: View {

    private enum Labels {
        static let emptyViewTitle = MKLocalizedString("outreach-selection.empty.title",
                                                      comment: "The title text to display when there are no outreach channels to display to the customer advisor")
        static let emptyViewDescription = MKLocalizedString("outreach-selection.empty.description",
                                                            comment: "The description text to display when there are no outreach channels to display to the customer advisor")
    }

    @ObservedObject private var viewModel: OutreachSelectionViewModel
    @State private var expandedSections: [OutreachSelectionItemDisplayable.ID: Bool] = [:]

    init(viewModel: OutreachSelectionViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        MKList {
            ResultStateViewBuilder(result: self.viewModel.outreachChannels)
                .setLoadingView {
                    self.buildRows(for: .loadingData)
                }
                .setEmptyView {
                    AuxiliaryView(viewModel: AuxiliaryViewModel(imageSource: .styledImage(identifier: "icon-lrg-fail-results"),
                                                                title: Labels.emptyViewTitle,
                                                                subtitle: Labels.emptyViewDescription),
                                  topMargin: 30)
                }.buildContent { displayable in
                    self.buildRows(for: displayable.entries)
                }
        }
    }

    @ViewBuilder
    private func buildRows(for entries: [OutreachSelectionEntry]) -> some View {
        ForEach(entries) { entry in
            switch entry {
            case .item(let entryItem):
                self.buildSelectionButton(entryItem: entryItem)
            case .expandableItem(let parent):
                self.buildExpandingButton(for: parent)
            }
        }
    }

    @ViewBuilder
    private func buildExpandingButton(for parent: OutreachSelectionParentEntryItem) -> some View {
        Button(action: {
            withAnimation {
                self.expandedSections[parent.id] = !self.isExpanded(parent)
            }
        }, label: {
            OutreachSelectionItemView(item: parent.item)
                .stackWithAccessory(accessoryIdentifier: self.isExpanded(parent) ? "icon-down" : "icon-up")
                .styleAsListRow(variant: "icon", includeDivider: true)
        }).buttonStyle(.plain)
        if self.isExpanded(parent) {
            self.buildExpandedItems(recipients: parent.children)
        }
    }

    @ViewBuilder
    private func buildExpandedItems(recipients: [OutreachSelectionEntryItem]) -> some View {
        ForEach(recipients) { entryItem in
            return self.buildSelectionButton(entryItem: entryItem)
        }
    }

    @ViewBuilder
    private func buildSelectionButton(entryItem: OutreachSelectionEntryItem) -> some View {
        Button(action: { self.viewModel.didSelectEntry(entryItem) }, label: {
            OutreachSelectionItemView(item: entryItem.item)
                .styleAsListRow(variant: "icon", includeDivider: true)
        }).buttonStyle(.plain)
    }

    private func isExpanded(_ item: OutreachSelectionParentEntryItem) -> Bool {
        return self.expandedSections[item.id] ?? false
    }
}

private extension Array where Element == OutreachSelectionEntry {
    static let loadingData: [OutreachSelectionEntry] = [
        .call(recipients: []),
        .whatsapp(recipients: []),
        .wechat()
    ]
}
