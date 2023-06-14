// Copyright © 2022 LVMH. All rights reserved.

import Combine
import Biodag

/// The appointment action to confirm
enum ConfirmAppointmentActionType {
    /// Book a new appointment
    case create
    /// Cancel an appointment
    case delete
}

final class ConfirmAppointmentViewModel: ObservableObject {

    let appointment: BookAppointmentDisplayable
    let actionType: ConfirmAppointmentActionType

    private let onDone: () -> Void

    @Published private(set) var isLoading = false
    private var cancellables = Set<AnyCancellable>()

    @Inject private var adapter: AppointmentsAdapter

    init(appointment: BookAppointmentDisplayable,
         actionType: ConfirmAppointmentActionType,
         onDone: @escaping (() -> Void)) {
        self.appointment = appointment
        self.actionType = actionType
        self.onDone = onDone
    }

    func didTapConfirm() {
        switch self.actionType {
        case .create:
            self.createAppointment()
        case .delete:
            self.deleteAppointment()
        }
    }

    private func createAppointment() {
        self.isLoading = true
        self.adapter.createAppointment(data: self.appointment)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    ToastView.show(text: error.localizedDescription, style: .error)
                case .finished:
                    self?.onDone()
                }
            } receiveValue: { _ in }
            .store(in: &self.cancellables)
    }

    private func deleteAppointment() {
        guard let appointmentId = self.appointment.id else { return }
        self.isLoading = true
        self.adapter.deleteAppointment(appointmentId: appointmentId)
            .sink { [weak self] result in
                self?.isLoading = false
                switch result {
                case .finished:
                    self?.onDone()
                case .failure(let error):
                    ToastView.show(text: error.localizedDescription, style: .error)
                }
            } receiveValue: { _ in }
            .store(in: &self.cancellables)
    }
}
