// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// An adapter protocol for appointments
public protocol AppointmentsAdapter {

    /// Asks the implementer to create an appointment with the given data.
    /// - Parameter data: the data for book the appointment
    /// - Returns: a publisher which will complete with no result if successful, or an error
    func createAppointment(data: BookAppointmentDisplayable) -> AnyPublisher<Void, ErrorDisplayable>

    /// Requests the client name by a given client ID for showing it in the appointment details
    /// - Parameter clientId: the ID of the client for which the appointment are requested
    /// - Returns: a publisher with the client name
    func getAppointmentClientName(clientId: String) -> AnyPublisher<String, ErrorDisplayable>

    /// Requests the topic options to show in the appointment form
    /// - Returns: a publisher with the appointment topic options
    func getAppointmentTopicOptions() -> AnyPublisher<[SelectionListItem], ErrorDisplayable>

    /// Requests the appointment type options to show in the appointment form
    /// - Returns: a publisher with the appointment type options
    func getAppointmentTypeOptions() -> AnyPublisher<[SelectionListItem], ErrorDisplayable>

    /// Requests the store options to show in the appointment form
    /// - Parameter topicId: the topic id the stores should be related to
    /// - Returns: a publisher with the appointment store options
    func getAppointmentStoreOptions(topicId: String) -> AnyPublisher<[SelectionListItem], ErrorDisplayable>

    /// Requests the available time slots to show in the appointment form
    /// - Parameter topicId: the topic id the slots should be related to
    /// - Parameter storeId: the store id the slots should be related to
    /// - Returns: a publisher with the available slots to book an appointment on
    func getAvailableSlots(topicId: String, storeId: String) -> AnyPublisher<[Date: [CalendarSlot]], ErrorDisplayable>

    /// Requests the appointment details
    /// - Parameter appointmentId: the appointment id
    /// - Returns: a publisher with the appointment details
    func getAppointmentDetails(appointmentId: String) -> AnyPublisher<Result<AppointmentDetailsDisplayable, ErrorDisplayable>, Error>

    /// Requests the appointments for a given date
    /// - Returns: a publisher with the the list of appointments
    func getAppointments() -> AnyPublisher<Result<AppointmentsList, ErrorDisplayable>, Error>

    /// Asks the implementer to delete an appointment with the given appointment ID.
    /// - Parameter appointmentId: the appointment id
    /// - Returns: a publisher which will complete with no result if successful, or an error
    func deleteAppointment(appointmentId: String) -> VoidResultPublisher
}
