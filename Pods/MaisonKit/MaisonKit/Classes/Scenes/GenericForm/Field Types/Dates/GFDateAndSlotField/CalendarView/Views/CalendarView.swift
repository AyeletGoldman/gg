// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import FSCalendar

/// Styled calendar view. support monthly and weekly mode.
public struct CalendarView: View {

    private enum Labels {
        static let todayButtonTitle = MKLocalizedString("calendar.todayButton.title",
                                                        comment: "Title for today button in calendar view")
    }

    private static let dateStringFormater: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .autoupdatingCurrent
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
        return dateFormatter
    }()

    @State private var currentPage = Date()
    @Binding private var isCalendarExpanded: Bool
    @Binding private var selectedDate: Date?
    @Binding private var calendarHeight: CGFloat

    private var currentMonthName: String {
        return CalendarView.dateStringFormater.string(from: self.currentPage)
    }

    private let shouldDisableDate: ((Date) -> Bool)?

    /// Creates an instance of `CalendarView`
    /// - Parameters:
    ///   - date: Binded date to be selected on the calendar
    ///   - calendarHeight: Binded calendar height tpo support height animation when expand and collaps the calendar
    ///   - shouldDisableDate: Optional function to decide which date should be disabled
    ///   - isCalendarExpanded: a binding to a boolean indicating whether the calendar is expanded or not. Defaults to `.constant(true)`.
    public init(selectedDate date: Binding<Date?> = .constant(nil),
                calendarHeight: Binding<CGFloat>,
                shouldDisableDate: ((Date) -> Bool)? = nil,
                isCalendarExpanded: Binding<Bool> = .constant(true)) {
        self._selectedDate = date
        self._calendarHeight = calendarHeight
        self.shouldDisableDate = shouldDisableDate
        self._currentPage = State(initialValue: date.wrappedValue ?? Date())
        self._isCalendarExpanded = isCalendarExpanded
    }

    public var body: some View {
        StylableGroup("calendar") {
            VStack {
                HStack(spacing: 0) {
                    Button(action: { self.isCalendarExpanded.toggle() },
                           label: {
                        Text(self.currentMonthName)
                            .style("title")
                    })
                    TertiaryButton(buttonData: ButtonData(label: "",
                                                          icon: self.isCalendarExpanded ? "icon-down" : "icon-up",
                                                          action: { self.isCalendarExpanded.toggle() }),
                                   variant: .highlighted)
                    Spacer()
                    TertiaryButton(buttonData: ButtonData(label: "", icon: "icon-left", action: self.previousWeekOrMonth),
                                   variant: .highlighted)
                    TertiaryButton(buttonData: ButtonData(label: Labels.todayButtonTitle, action: { self.currentPage = Date() }))
                    TertiaryButton(buttonData: ButtonData(label: "", icon: "icon-right", action: self.nextWeekOrMonth),
                                   variant: .highlighted)
                }
                CalendarViewRepresentable(calendarHeight: self.$calendarHeight,
                                          isCalendarExpanded: self.$isCalendarExpanded,
                                          selectedDate: self.$selectedDate,
                                          currentPage: self.$currentPage,
                                          shouldDisableDate: self.shouldDisableDate)
                    .frame(height: self.calendarHeight)
            }
            .style("background")
        }
    }

    private func nextWeekOrMonth() {
        self.moveCalendar(amount: 1)
    }

    private func previousWeekOrMonth() {
        self.moveCalendar(amount: -1)
    }

    private func moveCalendar(amount: Int) {
        let unit: Calendar.Component = self.isCalendarExpanded ? .month : .weekOfYear
        guard let nextWeekOrMonth = Calendar.current.date(byAdding: unit,
                                                          value: amount,
                                                          to: self.currentPage) else { return }
        self.currentPage = nextWeekOrMonth
    }
}
