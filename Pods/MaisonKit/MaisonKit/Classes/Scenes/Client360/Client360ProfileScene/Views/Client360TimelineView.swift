// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct Client360TimelineView: View {

    private enum Labels {
        static let emptyTitle = MKLocalizedString("client360.timeline.empty.title",
                                                  comment: "Title for the view shown on the screen when there are no timeline items")
        static let emptySubtitle = MKLocalizedString("client360.timeline.empty.subtitle",
                                                     comment: "Title for the view shown on the screen when there are no timeline items")
        static let timelineHeading = MKLocalizedString("client360.timeline.heading.title",
                                                            comment: "Title for the headline in the timeline section")
        static let timelineAddEventButton = MKLocalizedString("client360.timeline.button.add.title",
                                                                   comment: "Title for the 'ADD' button to create a new timeline event")
    }

    private let timelineInfo: ResultState<TimelineDisplayable, ErrorDisplayable>
    /// The set of available timeline event actions that are used for displaying which events a user can add to the timeline manually
    private let availableTimelineEventActions: ResultState<[ContextualAction], ErrorDisplayable>
    private let filterTapped: (TimelineDisplayable.Filter) -> Void
    private let addButtonHandler: () -> Void
    private let onSelectTimelineItem: (TimelineDisplayable.Entry) -> Void
    private let timelineItemConfirmationClosure: TimelineItemConfirmationClosure

    @Binding private var selectedFilters: Set<TimelineDisplayable.Filter>

    init(timelineInfo: ResultState<TimelineDisplayable, ErrorDisplayable>,
         availableTimelineEventActions: ResultState<[ContextualAction], ErrorDisplayable>,
         selectedFilters: Binding<Set<TimelineDisplayable.Filter>>,
         filterTapped: @escaping (TimelineDisplayable.Filter) -> Void,
         addButtonHandler: @escaping () -> Void,
         onSelectTimelineItem: @escaping (TimelineDisplayable.Entry) -> Void,
         timelineItemConfirmationClosure: @escaping TimelineItemConfirmationClosure) {
        self.timelineInfo = timelineInfo
        self._selectedFilters = selectedFilters
        self.filterTapped = filterTapped
        self.addButtonHandler = addButtonHandler
        self.availableTimelineEventActions = availableTimelineEventActions
        self.onSelectTimelineItem = onSelectTimelineItem
        self.timelineItemConfirmationClosure = timelineItemConfirmationClosure
    }

    /// Builds a timeline view with a title (that includes the available timeline event actions), a set of filters based on the
    /// timeline and the timeline items.
    var body: some View {
        Group {
            Spacer().frame(height: 20)
            self.buildInteractionHeader()
            TimelineView(timelineInfo: self.timelineInfo,
                         selectedFilters: self.$selectedFilters,
                         filterTapped: self.filterTapped,
                         onSelectTimelineEntry: self.onSelectTimelineItem,
                         timelineItemConfirmationClosure: self.timelineItemConfirmationClosure)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }

    // Builds the title text for the timeline section.
    // While loading whether or not there are any actions to show, it displays only the timeline title.
    @ViewBuilder
    private func buildInteractionHeader() -> some View {
        ResultStateViewBuilder(result: self.availableTimelineEventActions)
            .setWaitingView {
                self.buildTimelineTitleView()
            }.setEmptyView {
                self.buildTimelineTitleView()
            }.setLoadingView {
                self.buildTimelineTitleView()
            }.buildContent { _ in
                self.buildTimelineTitleView(buttonData: self.buildAddButtonData())
            }
        .addStyledRowDivider()
        .padding(.horizontal)
        .padding(.bottom, 5)
    }

    // Creates the timeline header title with an optional button.
    @ViewBuilder
    private func buildTimelineTitleView(buttonData: HeaderAndButtonView.HeaderButtonData? = nil) -> some View {
        HeaderAndButtonView(title: Labels.timelineHeading, buttonData: buttonData)
    }

    private func buildAddButtonData() -> HeaderAndButtonView.HeaderButtonData {
        return HeaderAndButtonView.HeaderButtonData(title: Labels.timelineAddEventButton,
                                                    action: self.addButtonHandler,
                                                    accessibilityIdentifier: "add event",
                                                    iconIdentifier: "icon-add")
    }
}

private struct HeaderAndButtonView: View {

    struct HeaderButtonData {

        let title: String
        let action: () -> Void
        let accessibilityIdentifier: String
        let iconIdentifier: StylistIdentifier?

        init(title: String, action: @escaping () -> Void, accessibilityIdentifier: String?, iconIdentifier: StylistIdentifier?) {
            self.title = title
            self.action = action
            self.accessibilityIdentifier = accessibilityIdentifier ?? title
            self.iconIdentifier = iconIdentifier
        }
    }

    private let title: String
    private let buttonData: HeaderButtonData?

    init(title: String, buttonData: HeaderButtonData?) {
        self.title = title
        self.buttonData = buttonData
    }

    var body: some View {
        StylableGroup("heading") {
            HStack(spacing: 10) {
                Text(verbatim: self.title).style("title")
                if let buttonData = self.buttonData {
                    TertiaryButton(buttonData: ButtonData(label: buttonData.title,
                                                          icon: buttonData.iconIdentifier,
                                                          action: buttonData.action))
                        .accessibility(identifier: buttonData.accessibilityIdentifier)
                }
                Spacer()
            }
            .padding(.top, 17)
            .padding(.bottom, 13)
            .style("background")
        }
    }
}
