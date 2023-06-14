// Copyright © 2021 LVMH. All rights reserved.

import Combine

/// The appointment details
public struct AppointmentDetailsDisplayable {

    /// The appointment identifier
    public let id: String
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
    /// The details for virtial meetings
    public let virtualMeeting: VirtualMeetingDisplayable?
    /// Enable editing the appointment
    public let isEditable: Bool
    /// Whether the appointment has cancelled, so it's availiable only to read.
    public let isCancelled: Bool

    /// Create a new AppointmentDetailsDisplayable for booking a new appointment
    /// - Parameters:
    ///   - id: The appointment identifier
    ///   - clientId: The client this appointment is booked for
    ///   - clientName: The client name this appointment is booked for
    ///   - topic: The appoinement topic
    ///   - type: The appointment type
    ///   - store: The store this appointment is assosiated for
    ///   - date: The date and slot time this appointment is booked on
    ///   - notes: Additional comments for this appointment
    ///   - virtualMeeting: The details for virtial meetings
    ///   - isEditable: Enable editing the appointment
    ///   - isCancelled: Whether the appointment has cancelled, so it's availiable only to read.
    public init(id: String,
                clientId: String,
                clientName: String,
                topic: SelectionListItem,
                type: SelectionListItem,
                store: SelectionListItem,
                date: DateAndSlot,
                notes: String?,
                virtualMeeting: VirtualMeetingDisplayable? = nil,
                isEditable: Bool,
                isCancelled: Bool = false) {
        self.id = id
        self.clientId = clientId
        self.clientName = clientName
        self.topic = topic
        self.type = type
        self.store = store
        self.date = date
        self.notes = notes
        self.virtualMeeting = virtualMeeting
        self.isEditable = isEditable
        self.isCancelled = isCancelled
    }
}

/// The details for virtial meetings
public struct VirtualMeetingDisplayable {

    /// The time the virtual meeting will be availibale to join. Could be at the same meeting time, but also could be before.
    public let activeMeetingTime: Date
    /// The closure to activate and join the meeting.
    public let joinAction: () -> Void

    /// Create a new VirtualMeetingDisplayable
    /// - Parameters:
    ///   - activeMeetingTime: The time the virtual meeting will be availibale to join. Could be at the same meeting time, but also could be before.
    ///   - joinAction: The closure to activate and join the meeting.
    public init(activeMeetingTime: Date, joinAction: @escaping () -> Void) {
        self.activeMeetingTime = activeMeetingTime
        self.joinAction = joinAction
    }
}
