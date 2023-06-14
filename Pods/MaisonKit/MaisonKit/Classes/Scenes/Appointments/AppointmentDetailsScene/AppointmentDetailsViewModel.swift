// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine

final class AppointmentDetailsViewModel: GenericFormViewModel<AppointmentDetailsFormData> {

    private let appointmentId: String
    private let shouldAllowClient360Navigation: Bool

    @Published private(set) var displayable: ResultState<AppointmentDetailsDisplayable, ErrorDisplayable> = .waiting

    private let router: AppointmentDetailsRouter
    @Inject private var adapter: AppointmentsAdapter
    @Published private(set) var joinVirtualMeetingAvailiable: Bool = false
    private var cancellables = Set<AnyCancellable>()

    var isCancelled: Bool {
        self.displayable.value?.isCancelled ?? false
    }

    var premeetingActiveMinutes: Int? {
        guard let displayable = self.displayable.value,
              let virtualMeeting = displayable.virtualMeeting else {
            return nil
        }
        let interval = virtualMeeting.activeMeetingTime.distance(to: displayable.date.slot.startTime)
        let minutes = Int(interval / 60)
        return minutes != 0 ? minutes : nil
    }

    init(appointmentId: String, router: AppointmentDetailsRouter, shouldAllowClient360Navigation: Bool) {
        self.appointmentId = appointmentId
        self.router = router
        self.shouldAllowClient360Navigation = shouldAllowClient360Navigation

        let data = AppointmentDetailsFormData()
        super.init(data: data,
                   isReadOnly: true,
                   router: router
        )

        self.defineInitFieldsPublisher()
    }

    func fetchAppointment() {
        self.adapter.getAppointmentDetails(appointmentId: self.appointmentId)
            .handleEvents(receiveSubscription: { [weak self] _ in
                guard let self = self else { return }
                self.displayable = .loading(nil)
            })
            .catch { return Just(.failure(ErrorDisplayable($0))) }
            .sink(receiveValue: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    self.displayable = .failed(error)
                case .success(let displayable):
                    self.displayable = .found(displayable)
                    self.defineMeetingAvailabilityPublisher()
                }
            })
            .store(in: &self.cancellables)
    }

    private func defineInitFieldsPublisher() {
        self.$displayable.sink { result in
            switch result {
            case .waiting:
                self.sections = .waiting
            case .loading:
                self.sections = .loading([FormSection(fields: self.data.getFields(shouldAllowClient360Navigation: false))])
            case .found(let displayable):
                self.data.setData(displayable: displayable)
                self.sections = .found([FormSection(fields: self.data.getFields(shouldAllowClient360Navigation: self.shouldAllowClient360Navigation))])
            case .failed(let error):
                self.sections = .failed(error)
            }
        }
        .store(in: &self.cancellables)
    }

    private func defineMeetingAvailabilityPublisher() {
        guard let virtualMeeting = self.displayable.value?.virtualMeeting else {
            return
        }
        let timeInterval = Date().distance(to: virtualMeeting.activeMeetingTime)
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
            self.joinVirtualMeetingAvailiable = true
        }
    }

    func presentCancelAppointment() {
        guard let displayable = self.displayable.value else { return }
        self.router.presentCancelAppointmentConfirmation(appointment: BookAppointmentDisplayable(id: displayable.id,
                                                                                                 clientId: displayable.clientId,
                                                                                                 clientName: displayable.clientName,
                                                                                                 topic: displayable.topic,
                                                                                                 type: displayable.type,
                                                                                                 store: displayable.store,
                                                                                                 date: displayable.date,
                                                                                                 notes: displayable.notes)) { [weak self] in
            self?.fetchAppointment()
        }
    }
}
