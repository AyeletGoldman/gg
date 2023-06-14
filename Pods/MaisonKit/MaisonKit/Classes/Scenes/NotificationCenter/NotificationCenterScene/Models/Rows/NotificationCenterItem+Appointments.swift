// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

private extension DateFormatter {
    static let dayAndMonthDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.autoupdatingCurrent
        formatter.calendar = Calendar.autoupdatingCurrent
        formatter.setLocalizedDateFormatFromTemplate("dd/MM")
        return formatter
    }()
}

public extension NotificationCenterItem {

    // swiftlint:disable line_length
    private enum Labels {
        static let appointmentCreatedByAnotherUser = MKLocalizedString("notification-center.items.appointment-created-other-user.title",
                                                                       comment: "The title for the notification that tells the user an appointment was created by another user")
        static let oneToOneAppointmentStartingSoon = MKLocalizedString("notification-center.items.o2o-appointment-starting.title",
                                                                       comment: "The title for the notification that tells the user that their appointment is starting soon. The first placeholder is the time of the appointment and the second one is the number of minutes left until the appointment starts.")
        static let oneToManyAppointmentStartingSoon = MKLocalizedString("notification-center.items.o2m-appointment-starting.title",
                                                                        comment: "The title for the notification that tells the user that their appointment is starting soon. The first placeholder is the time of the appointment and the second one is the number of minutes left until the appointment starts.")

        static let todayAppointmentCancelled = MKLocalizedString("notification-center.items.appointment-today-cancelled-other-user.title",
                                                                 comment: "The title for the notification that tells the user an appointment TODAY was cancelled by another user. The first placeholder is the time of the appointment.")
        static let tomorrowAppointmentCancelled = MKLocalizedString("notification-center.items.appointment-tomorrow-cancelled-other-user.title",
                                                                    comment: "The title for the notification that tells the user an appointment TOMORROW was cancelled by another user. The first placeholder is the time of the appointment.")
        static let thisWeekAppointmentCancelled = MKLocalizedString("notification-center.items.appointment-this-week-cancelled-other-user.title",
                                                                    comment: "The title for the notification that tells the user an appointment THIS WEEK was cancelled by another user. The first placeholder is the week day and the second is time of the appointment.")
        static let futureAppointmentCancelled = MKLocalizedString("notification-center.items.appointment-future-cancelled-other-user.title",
                                                                    comment: "The title for the notification that tells the user an appointment IN THE FUTURE was cancelled by another user. The first placeholder is the week day and the second is time of the appointment.")
    }
    // swiftlint:enable line_length

    private enum Constants {
        static let appointmentsImageIdentifier = StylistIdentifier("icon-calendar")
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of an appointment that was created by another user for this user.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - appointmentID: The ID of the appointment that has been assigned to this user. This is then used to open the correct appointments details screen.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func appointmentCreatedByAnotherUser(id: String = UUID().uuidString,
                                                clientName: String,
                                                appointmentID: String,
                                                date: Date,
                                                isRead: Bool) -> NotificationCenterItem {
        return Self.createAppointmentNotificationCenterItem(id: id,
                                                            title: Labels.appointmentCreatedByAnotherUser,
                                                            clientName: clientName,
                                                            appointmentID: appointmentID,
                                                            date: date,
                                                            isRead: isRead)
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of an appointment that was created by another user for this user.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - appointmentID: The ID of the appointment that has been cancelled.
    ///   - appointmentDate: The date of the appointment that has been cancelled.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func appointmentCancelledByAnotherUser(id: String = UUID().uuidString,
                                                  clientName: String,
                                                  appointmentID: String,
                                                  appointmentDate: Date,
                                                  date: Date,
                                                  isRead: Bool) -> NotificationCenterItem {
        // If date is today: do not show
        // If date is tomorrow: “Tomorrow”
        // If date is anytime this week after tomorrow: show weekday, e.g. “on Thursday”
        // If date is next week: show date without year information in the short format in user’s format, e.g. “on 10/10”
        let dateString: String = {
            let todayComponents = Calendar.current.dateComponents([.day, .month, .year, .weekOfYear, .weekday], from: Date())
            let appointmentComponents = Calendar.current.dateComponents([.day, .month, .year, .weekOfYear, .weekday], from: appointmentDate)
            if todayComponents == appointmentComponents { // today
                return String(format: Labels.todayAppointmentCancelled,
                              DateFormatter.timeOnlyFormatter.string(from: appointmentDate))
            }
            if todayComponents.day == ((appointmentComponents.day ?? 0) - 1) &&
                todayComponents.month == appointmentComponents.month &&
                todayComponents.year == appointmentComponents.year { // tomorrow
                return String(format: Labels.tomorrowAppointmentCancelled,
                              DateFormatter.timeOnlyFormatter.string(from: appointmentDate))
            }
            if todayComponents.weekOfYear == appointmentComponents.weekOfYear &&
                (todayComponents.day ?? 0) < (appointmentComponents.day ?? 0) &&
                todayComponents.year == appointmentComponents.year {
                guard let weekday = appointmentComponents.weekday else {
                    return String(format: Labels.futureAppointmentCancelled,
                                  DateFormatter.dayAndMonthDateFormatter.string(from: appointmentDate),
                                  DateFormatter.timeOnlyFormatter.string(from: appointmentDate))
                }
                return String(format: Labels.thisWeekAppointmentCancelled,
                              DateFormatter.dayAndMonthDateFormatter.weekdaySymbols[weekday-1],
                              DateFormatter.timeOnlyFormatter.string(from: appointmentDate))
            }
            return String(format: Labels.futureAppointmentCancelled,
                          DateFormatter.dayAndMonthDateFormatter.string(from: appointmentDate),
                          DateFormatter.timeOnlyFormatter.string(from: appointmentDate))
        }()
        return Self.createAppointmentNotificationCenterItem(id: id,
                                                            title: dateString,
                                                            clientName: clientName,
                                                            appointmentID: appointmentID,
                                                            date: date,
                                                            isRead: isRead)
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a one-to-one appointment that is starting soon.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - appointmentID: The ID of the appointment..
    ///   - appointmentDate: The date of the appointment.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func oneToOneAppointmentStartingSoon(id: String = UUID().uuidString,
                                                clientName: String,
                                                appointmentID: String,
                                                appointmentDate: Date,
                                                date: Date,
                                                isRead: Bool) -> NotificationCenterItem {
        let minutes = Calendar.current.dateComponents([.minute], from: Date(), to: appointmentDate).minute ?? 0
        return Self.createAppointmentNotificationCenterItem(id: id,
                                                            title: String(format: Labels.oneToOneAppointmentStartingSoon,
                                                                          DateFormatter.timeOnlyFormatter.string(from: appointmentDate),
                                                                          "\(minutes)"),
                                                            clientName: clientName,
                                                            appointmentID: appointmentID,
                                                            date: date,
                                                            isRead: isRead)
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a one-to-many appointment that is starting soon.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - appointmentID: The ID of the appointment..
    ///   - appointmentDate: The date of the appointment.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func oneToManyAppointmentStartingSoon(id: String = UUID().uuidString, clientName: String, appointmentID: String, appointmentDate: Date, date: Date, isRead: Bool) -> NotificationCenterItem {
        let minutes = Calendar.current.dateComponents([.minute], from: Date(), to: appointmentDate).minute ?? 0
        return Self.createAppointmentNotificationCenterItem(id: id,
                                                            title: String(format: Labels.oneToManyAppointmentStartingSoon,
                                                                          DateFormatter.timeOnlyFormatter.string(from: appointmentDate),
                                                                          "\(minutes)"),
                                                            clientName: clientName,
                                                            appointmentID: appointmentID,
                                                            date: date,
                                                            isRead: isRead)
    }

    // swiftlint:disable:next function_parameter_count
    private static func createAppointmentNotificationCenterItem(id: String, title: String, clientName: String, appointmentID: String, date: Date, isRead: Bool) -> NotificationCenterItem {
        return NotificationCenterItem(id: id,
                                      icon: .styledImage(identifier: Constants.appointmentsImageIdentifier),
                                      title: title,
                                      subtitles: [
                                        LabeledValue(label: SharedLabels.client, value: clientName)
                                      ],
                                      date: date,
                                      isRead: isRead,
                                      action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return AppointmentDetailsRouteDescriptor(appointmentId: appointmentID)
        }, preferredPresentationStyle: .push))
    }
}
