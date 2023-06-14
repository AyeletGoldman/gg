// Copyright © 2021 LVMH. All rights reserved.

import FSCalendar
import StylableSwiftUI
import UIKit
import SwiftUI
import Combine

extension FSCalendarAppearance {
    func styleCalendar(_ styleContainer: UIKitStyleContainer) {
        self.headerTitleColor = styleContainer.textColor(for: "calendar/title")
        self.headerTitleFont = styleContainer.font(for: "calendar/title")

        self.weekdayTextColor = styleContainer.textColor(for: "calendar/subtitle")
        self.weekdayFont = styleContainer.font(for: "calendar/subtitle")

        self.titleDefaultColor = styleContainer.textColor(for: "calendar-day/title")
        self.titleFont = styleContainer.font(for: "calendar-day/title")
        self.titlePlaceholderColor = styleContainer.textColor(for: "calendar-day[disabled]/title")

        self.titleSelectionColor = styleContainer.textColor(for: "calendar-day[selected]/title")
        self.selectionColor = styleContainer.backgroundColor(for: "calendar-day[selected]/background")

        self.titleTodayColor = styleContainer.textColor(for: "calendar-day[highlighted]/title")
        self.todayColor = styleContainer.backgroundColor(for: "calendar-day[highlighted]/background")

        let stringTextCase = styleContainer.textCase(for: "calendar/subtitle")
        switch stringTextCase {
        case .lowercase:
            self.caseOptions = [.weekdayUsesSingleUpperCase]
        case .uppercase:
            self.caseOptions = [.weekdayUsesUpperCase]
        default:
            break
        }
    }
}

struct CalendarViewRepresentable: UIViewRepresentable {
    @EnvironmentObject private var styleContainer: UIKitStyleContainer
    @Environment(\.refreshPublisher) private var refreshPublisher

    @Binding private var isCalendarExpanded: Bool
    @Binding private var calendarHeight: CGFloat
    @Binding private var selectedDate: Date?
    @Binding private var currentPage: Date

    private let shouldDisableDate: ((Date) -> Bool)?

    init(calendarHeight: Binding<CGFloat>,
         isCalendarExpanded: Binding<Bool>,
         selectedDate: Binding<Date?>,
         currentPage: Binding<Date>,
         shouldDisableDate: ((Date) -> Bool)? = nil) {
        self._isCalendarExpanded = isCalendarExpanded
        self._calendarHeight = calendarHeight
        self._selectedDate = selectedDate
        self._currentPage = currentPage
        self.shouldDisableDate = shouldDisableDate
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(height: self.$calendarHeight,
                           selectedDate: self.$selectedDate,
                           currentPage: self.$currentPage,
                           shouldDisableDate: self.shouldDisableDate,
                           refreshPublisher: self.refreshPublisher,
                           styleContainer: self.styleContainer)
    }

    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.appearance.styleCalendar(self.styleContainer)
        calendar.select(self.selectedDate, scrollToDate: false)
        calendar.headerHeight = 0 // Remove the header
        calendar.setScope(self.isCalendarExpanded ? .month : .week, animated: false)
        calendar.locale = .autoupdatingCurrent
        calendar.firstWeekday = UInt(Calendar.autoupdatingCurrent.firstWeekday)

        // WARNING! Why is this gesture recognizer here?
        // It doesn't have a target, it doesn't do anything!
        // For some reason, tap touches added in SwiftUI via `gesture()` don't forward
        // to views in UIKit. Adding a tap gesture recognizer that does nothing but
        // does not cancel touches in the view it is added to, permits gestures
        // from SwiftUI to be forwarded to UIKit. I have no idea why.
        let gesture = UITapGestureRecognizer()
        gesture.cancelsTouchesInView = false
        calendar.addGestureRecognizer(gesture)

        return calendar
    }

    // WARNING! This is all a bit hairy
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        if context.coordinator.needsUpdate {
            context.coordinator.needsUpdate = false
            uiView.appearance.styleCalendar(self.styleContainer)
            uiView.reloadData()
        }

        let scope: FSCalendarScope = self.isCalendarExpanded ? .month : .week
        if scope != uiView.scope {
            // If the scope changes, then the current page has also changed, so we need
            // to update our version of the current page.s
            uiView.setScope(scope, animated: true)
            DispatchQueue.main.async {
                self.currentPage = uiView.currentPage
            }
        } else if let selectedDate = self.selectedDate,
                  uiView.gregorian.startOfDay(for: selectedDate) != uiView.selectedDate {
            uiView.select(self.selectedDate)
        } else if uiView.currentPage != self.currentPage {
            // If the scope didn't change, but our current page did, we have to update the calendar
            uiView.setCurrentPage(self.currentPage, animated: true)
        }
    }
}

extension CalendarViewRepresentable {
    final class Coordinator: NSObject, FSCalendarDelegate {

        @Binding var height: CGFloat
        @Binding var selectedDate: Date?
        @Binding var currentPage: Date
        fileprivate var needsUpdate: Bool = false
        private let shouldDisableDate: ((Date) -> Bool)?
        private var styleContainer: UIKitStyleContainer
        private var notificationHandle: NSObjectProtocol?
        private var refreshCancellable: AnyCancellable?

        init(height: Binding<CGFloat>,
             selectedDate: Binding<Date?>,
             currentPage: Binding<Date>,
             shouldDisableDate: ((Date) -> Bool)?,
             refreshPublisher: PassthroughSubject<Void, Never>? = nil,
             styleContainer: UIKitStyleContainer) {
            self._height = height
            self._selectedDate = selectedDate
            self._currentPage = currentPage
            self.shouldDisableDate = shouldDisableDate
            self.styleContainer = styleContainer
            super.init()

            self.listenToNotifications()

            self.refreshCancellable = refreshPublisher?.sink(receiveValue: { [weak self] _ in
                self?.needsUpdate = true
            })
        }

        private func listenToNotifications() {
            self.notificationHandle = NotificationCenter.default.addObserver(forName: .themeDidChangeNotification,
                                                                             object: nil,
                                                                             queue: nil,
                                                                             using: { [weak self] _ in
                self?.needsUpdate = true
            })
        }

        func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
            calendar.frame = CGRect(origin: calendar.frame.origin,
                                    size: bounds.size)
            DispatchQueue.main.async {
                self.height = bounds.height
            }
        }

        func calendar(_ calendar: FSCalendar,
                      didSelect date: Date,
                      at monthPosition: FSCalendarMonthPosition) {
            self.selectedDate = date
        }

        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            DispatchQueue.main.async {
                self.currentPage = calendar.currentPage
            }
        }

        func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            return self.shouldSelectDate(date)
        }

        func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
            let isDisabled = !self.shouldSelectDate(date)
            if isDisabled && calendar.today != date {
                let stylistIdentifier: String = StylistIdentifier.buildFullIdentifier(for: "calendar-day", variant: "disabled")
                let cellTitleColor = self.styleContainer.textColor(for: StylistIdentifier("\(stylistIdentifier)/title"))
                cell.preferredTitleDefaultColor = cellTitleColor
                cell.titleLabel.textColor = cellTitleColor
            }
        }

        private func shouldSelectDate(_ date: Date) -> Bool {
            return !(self.shouldDisableDate?(date) ?? false)
        }
    }
}
