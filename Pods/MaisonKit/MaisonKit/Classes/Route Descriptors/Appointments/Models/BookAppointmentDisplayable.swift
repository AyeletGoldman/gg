// Copyright © 2021 LVMH. All rights reserved.

import Combine

/// The book appointment data for booking a new appointment
public struct BookAppointmentDisplayable {

    /// The appointment identifier
    public let id: String?
    /// The client this appointment is booked for
    public let clientId: String
    /// The client name this appointment is booked for
    public let clientName: String
    /// The appoinement topic
    public let topic: SelectionListItem
    /// The appointment type
    public let type: SelectionListItem
    /// The store this appointment is assosiated for
    public let store: SelectionListItem
    /// The date and slot time this appointment is booked on
    public let date: DateAndSlot
    /// Additional comments for this appointment
    public let notes: String?

    /// Create a new BookAppointmentDisplayable for booking a new appointment
    /// - Parameters:
    ///   - id: The appointment identifier
    ///   - clientId: The client this appointment is booked for
    ///   - clientName: The client name this appointment is booked for
    ///   - topic: The appoinement topic
    ///   - type: The appointment type
    ///   - store: The store this appointment is assosiated for
    ///   - date: The date and slot time this appointment is booked on
    ///   - notes: Additional comments for this appointment
    public init(id: String? = nil,
                clientId: String,
                clientName: String,
                topic: SelectionListItem,
                type: SelectionListItem,
                store: SelectionListItem,
                date: DateAndSlot,
                notes: String?) {
        self.id = id
        self.clientId = clientId
        self.clientName = clientName
        self.topic = topic
        self.type = type
        self.store = store
        self.date = date
        self.notes = notes
    }
}
