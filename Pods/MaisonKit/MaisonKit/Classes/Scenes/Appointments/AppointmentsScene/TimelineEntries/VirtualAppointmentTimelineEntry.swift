// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension ImageSource {
    /// The icon for a virtual appointment by video
    static let virtualAppointmentVideoIcon: ImageSource = .styledImage(identifier: "icon-video")
    /// The icon for a virtual appointment by phone call
    static let virtualAppointmentPhoneCallIcon: ImageSource = .styledImage(identifier: "icon-phone")
}

public extension TimelineDisplayable.Entry {

    /// Creates a new `TimelineDisplayable.Entry` pre-configured for a virtual appointment entry
    /// - Parameters:
    ///   - appointmentID: the ID of the appointment. This should be unique.
    ///   - typeIcon: the virtual appointment type icon. usually will be `ImageSource.virtualAppointmentVideoIcon` or `ImageSource.virtualAppointmentPhoneCallIcon`
    ///   - startTime: the date-time at which the appointment starts.
    ///   - endTime: the date-time at which the appointment ends.
    ///   - clientName: the name of the client that the appointment is booked for
    ///   - appointmentCategory: the appointment category; this is usually the theme of the appointment e.g. Customer Care. This should be localised.
    ///   - advisorName: the name of the advisor that will host this appointment
    /// - Returns: a new `TimelineDisplayable.Entry` configured for virtual appointments
    // swiftlint:disable:next function_parameter_count
    static func virtualAppointmentTimelineEntry(appointmentID: String,
                                                typeIcon: ImageSource,
                                                startTime: Date,
                                                endTime: Date,
                                                clientName: String,
                                                appointmentCategory: String,
                                                advisorName: String) -> Self {
        return TimelineDisplayable.Entry(id: appointmentID,
                                         filterId: .consultation,
                                         cellProvider: .virtualAppointmentTimelineEntry(typeIcon: typeIcon,
                                                                                        startTime: startTime,
                                                                                        endTime: endTime,
                                                                                        clientName: clientName,
                                                                                        appointmentCategory: appointmentCategory,
                                                                                        advisorName: advisorName),
                                         action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return AppointmentDetailsRouteDescriptor(appointmentId: appointmentID)
        }))
    }
}

private extension TimelineEntryCellProvider {

    /// Creates a `TimelineEntryCellProvider` pre-configured for a virtual appointment entry
    /// - Parameters:
    ///   - typeIcon: the virtual appointment type icon. usually will be `ImageSource.virtualAppointmentVideoIcon` or `ImageSource.virtualAppointmentPhoneCallIcon`
    ///   - startTime: the date-time at which the appointment starts.
    ///   - endTime: the date-time at which the appointment ends.
    ///   - clientName: the name of the client that the appointment is booked for
    ///   - appointmentCategory: the appointment category; this is usually the theme of the appointment e.g. Customer Care
    ///   - advisorName: the name of the advisor that will host this appointment
    /// - Returns: a new `TimelineEntryCellProvider` configured for virtual appointments
    // swiftlint:disable:next function_parameter_count
    static func virtualAppointmentTimelineEntry(typeIcon: ImageSource,
                                                startTime: Date,
                                                endTime: Date,
                                                clientName: String,
                                                appointmentCategory: String,
                                                advisorName: String) -> Self {
        return TimelineEntryCellProvider {
            VirtualAppointmentTimelineEntry(icon: typeIcon,
                                            startTime: startTime,
                                            endTime: endTime,
                                            clientName: clientName,
                                            advisorName: advisorName,
                                            appointmentCategory: appointmentCategory)
        }
    }
}

private struct VirtualAppointmentTimelineEntry: View {

    private enum Labels {
        static let title = MKLocalizedString("appointments.timeline.virtual-appointments.title",
                                             comment: "Title for the timeline entry for virtual appointments")
        static let appointmentLocation = MKLocalizedString("appointments.timeline.virtual-appointments.location.title",
                                                           comment: "The location for a virtual appointment. This will usually be the string 'Online'")
    }

    let icon: ImageSource
    let startTime: Date
    let endTime: Date
    let clientName: String
    let advisorName: String
    let appointmentCategory: String

    var body: some View {
        return TimelineViewCell(icon: icon,
                                title: Labels.title,
                                subtitle: DateFormatter.shortTimeRangeFormatter.string(from: startTime, to: endTime),
                                footer: String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, Labels.appointmentLocation),
                                tag: nil,
                                mediaItems: [],
                                detail: TimelineDisplayable.Entry.Detail(attributes: [
                                    TypedField(title: AppointmentTimelineEntryLabels.clientNameTitle, value: .text(lines: [clientName])),
                                    TypedField(title: AppointmentTimelineEntryLabels.categoryTitle, value: .text(lines: [appointmentCategory]))
                                ]),
                                showDisclosureIndicator: true)
    }
}
