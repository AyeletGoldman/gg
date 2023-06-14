// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine

final class EditAppointmentViewModel: GenericFormViewModel<EditAppointmentFormData> {

    private let appointmentId: String
    private let didCancel: () -> Void
    private let router: EditAppointmentRouter

    @Inject private var adapter: AppointmentsAdapter
    private var cancellables = Set<AnyCancellable>()

    var isDeletable: Bool {
        return true // TODO: define by the appointment details
    }

    init(appointmentId: String, didCancel: @escaping () -> Void, router: EditAppointmentRouter) {
        self.appointmentId = appointmentId
        self.didCancel = didCancel
        self.router = router

        let data = EditAppointmentFormData()
        super.init(
            fieldsDataSource: data.$fields.eraseToAnyPublisher(),
            data: data,
            isReadOnly: false,
            router: router)
    }

    func presentDeleteConfirmation() {
        let appointment = BookAppointmentDisplayable( // TODO: take the data from the real appointment
            id: self.appointmentId,
            clientId: "123",
            clientName: "John Juan",
            topic: SelectionListItem(id: UUID().uuidString, title: "The topic"),
            type: SelectionListItem(id: UUID().uuidString, title: "The type"),
            store: SelectionListItem(id: UUID().uuidString, title: "The store"),
            date: DateAndSlot(date: Date(), slot: CalendarSlot(startTime: Date(), endTime: Date())),
            notes: "Lots of notes lots of nots")
        self.router.presentCancelAppointmentConfirmation(appointment: appointment, didCancel: { [didCancel] in
            didCancel()
        })
    }
}
