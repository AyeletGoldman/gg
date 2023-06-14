// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension TimelineDisplayable.Entry {

    // swiftlint:disable function_parameter_count
    /// Creates a new `TimelineDisplayable.Entry` pre-configured for a virtual appointment entry
    /// - Parameters:
    ///   - appointmentID: the ID of the appointment. This should be unique.
    ///   - startTime: the date-time at which the appointment starts.
    ///   - endTime: the date-time at which the appointment ends.
    ///   - clientName: the name of the client for which the appointment is booked
    ///   - appointmentCategory: the category of the appointment, also known as the theme e.g. "Customer Care"
    ///   - advisorName: the name of the customer advisor that will host the appointment
    ///   - appointmentLocation: the location of the appointment. This is usually the address/name of the store.
    /// - Returns: a new `TimelineDisplayable.Entry` configured for in-store appointments
    static func inStoreAppointmentTimelineEntry(appointmentID: String,
                                                startTime: Date,
                                                endTime: Date,
                                                clientName: String,
                                                appointmentCategory: String,
                                                advisorName: String,
                                                appointmentLocation: String) -> Self {
        return TimelineDisplayable.Entry(id: appointmentID,
                                         filterId: .consultation,
                                         cellProvider: .inStoreAppointmentTimelineEntry(startTime: startTime,
                                                                                        endTime: endTime,
                                                                                        clientName: clientName,
                                                                                        appointmentCategory: appointmentCategory,
                                                                                        advisorName: advisorName,
                                                                                        appointmentLocation: appointmentLocation),
                                         action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return AppointmentDetailsRouteDescriptor(appointmentId: appointmentID)
        }))
    }
    // swiftlint:enable function_parameter_count
}

private extension TimelineEntryCellProvider {

    // swiftlint:disable function_parameter_count
    /// Creates a new `TimelineEntryCellProvider` that is pre-configured for an in-store appointment display
    /// - Parameters:
    ///   - startTime: the date-time at which the appointment starts.
    ///   - endTime: the date-time at which the appointment ends.
    ///   - clientName: the name of the client for which the appointment is booked
    ///   - appointmentCategory: the category of the appointment, also known as the theme e.g. "Customer Care"
    ///   - advisorName: the name of the customer advisor that will host the appointment
    ///   - appointmentLocation: the location of the appointment. This is usually the address/name of the store.
    /// - Returns: a newly-created and fully configured `TimelineEntryCellProvider`
    static func inStoreAppointmentTimelineEntry(startTime: Date,
                                                endTime: Date,
                                                clientName: String,
                                                appointmentCategory: String,
                                                advisorName: String,
                                                appointmentLocation: String) -> Self {
        return TimelineEntryCellProvider {
            InStoreAppointmentTimelineEntry(startTime: startTime,
                                            endTime: endTime,
                                            clientName: clientName,
                                            advisorName: advisorName,
                                            appointmentCategory: appointmentCategory,
                                            appointmentLocation: appointmentLocation)
        }
    }
    // swiftlint:enable function_parameter_count
}

private struct InStoreAppointmentTimelineEntry: View {

    private enum Labels {
        static let title = MKLocalizedString("appointments.timeline.in-store-appointments.title",
                                             comment: "Title for the timeline entry for in-store appointments")
    }

    let startTime: Date
    let endTime: Date
    let clientName: String
    let advisorName: String
    let appointmentCategory: String
    let appointmentLocation: String

    var body: some View {
        return TimelineViewCell(icon: .styledImage(identifier: "icon-store"),
                                title: Labels.title,
                                subtitle: DateFormatter.shortTimeRangeFormatter.string(from: startTime, to: endTime),
                                footer: String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, appointmentLocation),
                                tag: nil,
                                mediaItems: [],
                                detail: TimelineDisplayable.Entry.Detail(attributes: [
                                    TypedField(title: AppointmentTimelineEntryLabels.clientNameTitle, value: .text(lines: [clientName])),
                                    TypedField(title: AppointmentTimelineEntryLabels.categoryTitle, value: .text(lines: [appointmentCategory]))
                                ]),
                                showDisclosureIndicator: true)
    }
}
