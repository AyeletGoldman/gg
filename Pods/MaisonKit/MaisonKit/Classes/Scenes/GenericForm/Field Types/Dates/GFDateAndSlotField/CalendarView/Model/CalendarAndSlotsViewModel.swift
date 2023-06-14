// Copyright © 2021 LVMH. All rights reserved.

import Combine

final class CalendarAndSlotsViewModel: ObservableObject {
    @Published var selectedDate: Date?
    @Published var selectedSlot: CalendarSlot?
    @Published var selectedDateAndSlot: DateAndSlot?
    let pageTitle: String
    let getAvailableSlots: (Date) -> [CalendarSlot]
    let shouldDisableDate: ((Date) -> Bool)?
    let onDismiss: () -> Void
    private let _onDone: (DateAndSlot?) -> Void

    private(set) var availableSlots: [CalendarSlot] = []
    private var cancellables = Set<AnyCancellable>()

    init(selectedDateAndSlot: DateAndSlot?,
         pageTitle: String,
         getAvailableSlots: @escaping (Date) -> [CalendarSlot],
         shouldDisableDate: ((Date) -> Bool)?,
         onDismiss: @escaping () -> Void,
         onDone: @escaping ((DateAndSlot?) -> Void)) {
        self.selectedDate = selectedDateAndSlot?.date
        self.selectedSlot = selectedDateAndSlot?.slot
        self.selectedDateAndSlot = selectedDateAndSlot
        self.pageTitle = pageTitle
        self.getAvailableSlots = getAvailableSlots
        self.shouldDisableDate = shouldDisableDate
        self.onDismiss = onDismiss
        self._onDone = onDone

        self.$selectedDate.sink { [weak self] date in
            self?.setAvailableSlots(for: date)
        }.store(in: &self.cancellables)

        self.$selectedSlot.sink { [weak self] slot in
            self?.setSelectedDateAndSlot(for: slot)
        }.store(in: &self.cancellables)
    }

    func onDone() {
        self._onDone(self.selectedDateAndSlot)
    }

    private func setAvailableSlots(for date: Date?) {
        if let date = date {
            self.availableSlots = self.getAvailableSlots(date)
        }
    }

    private func setSelectedDateAndSlot(for slot: CalendarSlot?) {
        if let slot = slot, let date = self.selectedDate {
            self.selectedDateAndSlot = .init(date: date, slot: slot)
        } else {
            self.selectedDateAndSlot = nil
        }
    }
}
