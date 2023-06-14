// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

/// Styled calendar and slots view. support monthly and weekly mode.
public struct CalendarAndSlotsView: View {

    private enum Labels {
        static let emptyTitle = MKLocalizedString("calendar.slots.empty.title",
                                                  comment: "Empty view title when there are no calendar slots available")
        static let emptySubtitle = MKLocalizedString("calendar.slots.empty.subtitle",
                                                     comment: "Empty view subtitle when there are no calendar slots available")
    }

    @State private var calendarHeight: CGFloat = 300
    @Binding private var selectedDate: Date?
    @Binding private var selectedSlot: CalendarSlot?
    private let availableSlots: [CalendarSlot]
    private let shouldDisableDate: ((Date) -> Bool)?

    /// Creates an instance of `CalendarAndSlotsView`
    /// - Parameters:
    ///   - selectedDate: Binded date to be selected on the calendar
    ///   - selectedSlot: Binded calendar slot to be selected
    ///   - availableSlots: Available slots to be shown on a specific date
    ///   - shouldDisableDate: Optional function to decide which date should be disabled
    public init(selectedDate: Binding<Date?>,
                selectedSlot: Binding<CalendarSlot?>,
                availableSlots: [CalendarSlot],
                shouldDisableDate: ((Date) -> Bool)? = nil) {
        self._selectedDate = selectedDate
        self._selectedSlot = selectedSlot
        self.availableSlots = availableSlots
        self.shouldDisableDate = shouldDisableDate
    }

    public var body: some View {
        VStack(spacing: 0) {
            CalendarView(selectedDate: self.$selectedDate,
                         calendarHeight: self.$calendarHeight,
                         shouldDisableDate: self.shouldDisableDate)
                .addStyledRowDivider()
                .padding(.top)
                .padding(.horizontal)
            if self.availableSlots.isEmpty {
                AuxiliaryView(viewModel: AuxiliaryViewModel(imageSource: .styledImage(identifier: "icon-lrg-appointment-booking"),
                                                            title: Labels.emptyTitle,
                                                            subtitle: Labels.emptySubtitle))
            } else {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(self.availableSlots) { slot in
                            self.buildSlot(slot: slot)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                }
            }
        }
        .animation(.easeOut, value: self.calendarHeight)
        .style("background")
    }

    @ViewBuilder
    private func buildSlot(slot: CalendarSlot) -> some View {
        StyledButton.fullWidthPaddedButton(
            data: ButtonData(label: DateFormatter.shortTimeRangeFormatter.string(from: slot.startTime, to: slot.endTime),
                             action: {
                                 self.selectedSlot = slot == self.selectedSlot ? nil : slot
                             }),
            style: slot == self.selectedSlot ? .primary : .secondary
        )
    }
}
