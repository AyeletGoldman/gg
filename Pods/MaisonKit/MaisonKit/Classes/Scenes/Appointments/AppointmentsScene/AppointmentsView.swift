// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import Combine
import StylableSwiftUI

struct AppointmentsView: View {

    private enum Labels {
        // swiftlint:disable line_length
        static let toolbarTitle = MKLocalizedString("appointments.toolbar.title",
                                                    comment: "The title for the appointments toolbar. This value is shown in an appointments screen where the appointments for the whole store are shown. The user can filter by customer advisor and then this text would change to the advisor's name. So this value means we are searching the whole store.")
        // swiftlint:enable line_length
        static let filtersButtonTitle = MKLocalizedString("appointments.toolbar.filters.title",
                                                          comment: "The title for the filters button in appointments toolbar")

        static let emptyTitle = MKLocalizedString("appointments.timeline.empty.title",
                                                  comment: "The title for the empty state in the appointments view")
        static let emptySubtitle = MKLocalizedString("appointments.timeline.empty.subtitle",
                                                     comment: "The subtitle for the empty state in the appointments view")
    }

    @ObservedObject private var viewModel: AppointmentsViewModel

    @State private var calendarHeight: CGFloat = 260
    @State private var totalHeight: CGFloat = 260
    @State private var isCalendarExpanded = false

    init(viewModel: AppointmentsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geoProxy in
            ScrollViewReader { scrollProxy in
                ScrollView {
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        if let filters = self.viewModel.filters.value, !filters.isEmpty {
                            SearchToolbarView(title: Labels.toolbarTitle,
                                              utilityViews: {
                                StyledButton(buttonData: ButtonData(label: Labels.filtersButtonTitle,
                                                                    icon: "icon-filters",
                                                                    iconPosition: .leading,
                                                                    action: self.viewModel.didTapFilter),
                                             style: "button-toolbar",
                                             iconSize: .medium)
                            })
                            .addStyledRowDivider()
                        }
                        Group {
                            Section {
                                TimelineView(timelineInfo: self.viewModel.timelineDisplayable,
                                             selectedFilters: .constant([]),
                                             filterTapped: { _ in },
                                             onSelectTimelineEntry: self.viewModel.onSelectTimelineEntry(_:))
                            } header: {
                                CalendarView(selectedDate: self.$viewModel.selectedDate,
                                             calendarHeight: self.$calendarHeight,
                                             shouldDisableDate: self.viewModel.shouldDisableDate,
                                             isCalendarExpanded: self.$isCalendarExpanded)
                                .environment(\.refreshPublisher, self.viewModel.refreshCalendarPublisher)
                                .addStyledRowDivider()
                                .padding(.top)
                                .background(GeometryReader { proxy in Color.clear.onChange(of: self.calendarHeight) { _ in
                                    self.totalHeight = proxy.size.height
                                }})
                            }
                        }
                        .style("background")
                        .padding(.horizontal)
                        Spacer()
                    }
                }
                .animation(.easeOut, value: self.calendarHeight)
                .onReceive(self.viewModel.$scrollToID) { id in
                    // There is no way to currently chain animations in SwiftUI
                    // so we use a delay but only if the calendar was expanded.
                    let wasCalendarExpanded = self.isCalendarExpanded
                    self.isCalendarExpanded = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + (wasCalendarExpanded ? 0.4 : 0)) { // animation duration in FSCalendar is 0.3
                        withAnimation {
                            // +0.01 for a little padding, just for a nicer UI
                            let yValue = (self.totalHeight/geoProxy.size.height) + 0.01
                            scrollProxy.scrollTo(id, anchor: UnitPoint(x: 0, y: yValue))
                        }
                    }
                }
            }
        }
    }

    private var emptyViewModel: AuxiliaryViewModel {
        return AuxiliaryViewModel(imageSource: .styledImage(identifier: "icon-lrg-appointment-booking"),
                                  title: Labels.emptyTitle,
                                  subtitle: Labels.emptySubtitle)
    }
}
