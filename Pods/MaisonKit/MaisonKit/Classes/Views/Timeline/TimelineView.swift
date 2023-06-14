// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

typealias TimelineItemConfirmationClosure = (String, TimelineEntryConfirmationAction) -> Void

struct TimelineView: View {

    private enum Labels {
        static let emptyTimelineTitle = MKLocalizedString("timeline.default.empty.title",
                                                          comment: "Default title to show in an empty timeline")
        static let emptyTimelineSubtitle = MKLocalizedString("timeline.default.empty.subtitle",
                                                             comment: "Default subtitle to show in an empty timeline")
    }

    private let timelineInfo: ResultState<TimelineDisplayable, ErrorDisplayable>
    private let filterTapped: (TimelineDisplayable.Filter) -> Void
    private let onSelectTimelineEntry: (TimelineDisplayable.Entry) -> Void
    private let emptyDataModel: AuxiliaryViewModel
    private let timelineItemConfirmationClosure: TimelineItemConfirmationClosure?

    @Binding var selectedFilters: Set<TimelineDisplayable.Filter>

    init(timelineInfo: ResultState<TimelineDisplayable, ErrorDisplayable>,
         selectedFilters: Binding<Set<TimelineDisplayable.Filter>>,
         filterTapped: @escaping (TimelineDisplayable.Filter) -> Void,
         onSelectTimelineEntry: @escaping (TimelineDisplayable.Entry) -> Void,
         emptyDataModel: AuxiliaryViewModel = .emptyDataModel(title: Labels.emptyTimelineTitle,
                                                              subtitle: Labels.emptyTimelineSubtitle),
         timelineItemConfirmationClosure: TimelineItemConfirmationClosure? = nil) {
        self.timelineInfo = timelineInfo
        self._selectedFilters = selectedFilters
        self.filterTapped = filterTapped
        self.onSelectTimelineEntry = onSelectTimelineEntry
        self.emptyDataModel = emptyDataModel
        self.timelineItemConfirmationClosure = timelineItemConfirmationClosure
    }

    var body: some View {
        ResultStateViewBuilder(result: self.timelineInfo)
            .setEmptyView {
                AuxiliaryView(viewModel: self.emptyDataModel).padding()
            }
            .setLoadingView {
                self.buildFilters(filters: .loadingData)
                self.buildInteractionTimeline(timelineInfo: .loadingData)
            }
            .buildContent { timelineInfo in
                self.buildFilters(filters: timelineInfo.filters)
                self.buildInteractionTimeline(timelineInfo: timelineInfo)
            }
    }

    @ViewBuilder
    private func buildInteractionTimeline(timelineInfo: TimelineDisplayable) -> some View {
        ForEach(timelineInfo.sections) { section in
            Section(header: self.buildSectionHeader(for: section)) {
                ForEach(section.items) { entry in
                    if entry.action != nil {
                        Button(action: {
                            self.onSelectTimelineEntry(entry)
                        }, label: {
                            self.createTimelineCell(entry: entry)
                        }).buttonStyle(PlainButtonStyle())
                    } else {
                        self.createTimelineCell(entry: entry)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func createTimelineCell(entry: TimelineDisplayable.Entry) -> some View {
        if let timelineItemConfirmationClosure {
            entry.cellProvider.entryCreation({ action in
                timelineItemConfirmationClosure(entry.id, action)
            })
        } else {
            entry.cellProvider.entryCreation(nil)
        }
    }

    // Builds a section header for a timeline section. Usually this is just the year in which the events happened.
    @ViewBuilder
    private func buildSectionHeader(for timelineSection: TimelineDisplayable.Section) -> some View {
        TimelineSectionHeader(title: timelineSection.title)
            .padding(.vertical, 5)
            .id(timelineSection.id)
    }

    @ViewBuilder
    private func buildFilters(filters: [TimelineDisplayable.Filter]) -> some View {
        StylableGroup("filters") {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(filters) { filter in
                        FilterButton(title: filter.name,
                                     isSelected: self.selectedFilters.contains(filter),
                                     action: { self.filterTapped(filter) }
                        )
                        .filterButtonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 11)
            }
            .style("background")
        }
    }
}

extension TimelineDisplayable: EmptyStateRepresentable {
    public var isEmpty: Bool {
        return self.sections.isEmpty
    }
}

private extension TimelineDisplayable {
    static var loadingData: TimelineDisplayable {
        return TimelineDisplayable(sections: [
            Section(title: "Some title", items: (0..<4).map { _ in
                return Entry(id: UUID().uuidString,
                             filterId: "filter_id",
                             cellProvider: .init(date: Date(), title: "Some title"),
                             action: nil)
            })
        ],
        filters: [
            TimelineDisplayable.Filter(id: TimelineFilterID(value: UUID().uuidString), name: "Example"),
            TimelineDisplayable.Filter(id: TimelineFilterID(value: UUID().uuidString), name: "Loading")
        ])
    }
}

private extension Array where Element == TimelineDisplayable.Filter {
    static var loadingData: [TimelineDisplayable.Filter] {
        return [
            TimelineDisplayable.Filter(id: TimelineFilterID(value: UUID().uuidString), name: "Example"),
            TimelineDisplayable.Filter(id: TimelineFilterID(value: UUID().uuidString), name: "Loading")
        ]
    }
}
