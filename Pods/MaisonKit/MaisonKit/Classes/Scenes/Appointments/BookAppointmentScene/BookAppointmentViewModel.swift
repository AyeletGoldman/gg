// Copyright © 2022 LVMH. All rights reserved.

import Combine
import Biodag

final class BookAppointmentViewModel: GenericFormViewModel<BookAppointmentFormData> {

    private let onDone: (_ didSave: Bool) -> Void
    private var router: BookAppointmentRouter

    @Inject private var adapter: AppointmentsAdapter
    private var cancellables = Set<AnyCancellable>()
    @Published private var availableSlots: ResultState<[Date: [CalendarSlot]], ErrorDisplayable> = .waiting

    init(clientId: String? = nil,
         onDone: @escaping (_ didSave: Bool) -> Void,
         router: BookAppointmentRouter) {

        self.onDone = onDone
        self.router = router

        let data = BookAppointmentFormData(clientId: clientId)
        super.init(
            fieldsDataSource: data.$fields.eraseToAnyPublisher(),
            data: data,
            router: router)

        self.defineTopicPublisher()
        self.defineStorePublisher()
        self.defineAvailableSlotsPublisher()
    }

    func didTapClose() {
        self.onDone(false)
    }

    func didTapNext() {
        guard let displayable = self.data.getDisplayable() else {
            return
        }
        self.router.presentAppointmentConfirmationScene(appointment: displayable, onDone: self.onDone)
    }

    override func onAppear() {
        self.fetchClientName()
        self.fetchTopicOptions()
        self.fetchAppointmentTypeOptions()
    }

    private func defineTopicPublisher() {
        self.data.$topic
            .filter { [weak self] newValue -> Bool in
                return self?.data.topic?.id != newValue?.id
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.fetchAppointmentStoreOptions()
            })
            .store(in: &self.cancellables)
    }

    private func defineStorePublisher() {
        self.data.$store
            .filter { [weak self] newValue -> Bool in
                return self?.data.store?.id != newValue?.id
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.fetchAvailableSlots()
            })
            .store(in: &self.cancellables)
    }

    private func defineAvailableSlotsPublisher() {
        self.$availableSlots
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .waiting:
                    self.data.dataOptions.availableSlotsStatus = .waiting
                case .loading:
                    self.data.dataOptions.availableSlotsStatus = .loading(nil)
                case .found:
                    let availableSlotsData = AvailableSlotsData(availableSlotsClosure: self.getAvailableSlots,
                                                                shouldDisableDate: self.shouldDisableDate)
                    self.data.dataOptions.availableSlotsStatus = .found(availableSlotsData)
                case .failed:
                    self.data.dataOptions.availableSlotsStatus = .failed(AvailableSlotsStatusError(action: {
                        self.fetchAvailableSlots()
                    }))
                }
            })
            .store(in: &self.cancellables)
    }

    private func fetchClientName() {
        guard let clientId = self.data.clientId else {
            return
        }
        self.adapter.getAppointmentClientName(clientId: clientId)
            .sink(receiveCompletion: { _ in
                // TODO: Show an error if needed
            }, receiveValue: { clientName in
                self.data.clientName = clientName
            })
            .store(in: &self.cancellables)
    }

    private func fetchTopicOptions() {
        self.data.dataOptions.topicOptions = .loading(nil)
        self.adapter.getAppointmentTopicOptions()
            .tryMap { items in
                if items.isEmpty {
                    throw EmptyDataError()
                }
                return items
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.data.dataOptions.topicOptions = .failed(PicklistOptionsStatusError(action: { [weak self] in
                        self?.fetchTopicOptions()
                    }))
                }
            }, receiveValue: { options in
                self.data.dataOptions.topicOptions = .found(options)
            })
            .store(in: &self.cancellables)
    }

    private func fetchAppointmentTypeOptions() {
        self.data.dataOptions.typeOptions = .loading(nil)
        self.adapter.getAppointmentTypeOptions()
            .tryMap { items in
                if items.isEmpty {
                    throw EmptyDataError()
                }
                return items
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.data.dataOptions.typeOptions = .failed(PicklistOptionsStatusError(action: { [weak self] in
                        self?.fetchAppointmentTypeOptions()
                    }))
                }
            }, receiveValue: { options in
                self.data.dataOptions.typeOptions = .found(options)
            })
            .store(in: &self.cancellables)
    }

    private func fetchAppointmentStoreOptions() {
        self.data.store = nil
        guard let topicId = self.data.topic?.id else {
            self.data.dataOptions.storeOptions = .waiting
            return
        }
        self.data.dataOptions.storeOptions = .loading(nil)
        self.adapter.getAppointmentStoreOptions(topicId: topicId)
            .tryMap { items in
                if items.isEmpty {
                    throw EmptyDataError()
                }
                return items
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.data.dataOptions.storeOptions = .failed(PicklistOptionsStatusError(action: { [weak self] in
                        self?.fetchAppointmentStoreOptions()
                    }))
                }
            }, receiveValue: { options in
                self.data.dataOptions.storeOptions = .found(options)
            })
            .store(in: &self.cancellables)
    }

    private func fetchAvailableSlots() {
        self.data.date = nil
        guard let topicId = self.data.topic?.id, let storeId = self.data.store?.id else {
            self.availableSlots = .waiting
            return
        }
        self.availableSlots = .loading(nil)
        self.adapter.getAvailableSlots(topicId: topicId, storeId: storeId)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.availableSlots = .failed(error)
                }
            }, receiveValue: { result in
                self.availableSlots = .found(result)
            })
            .store(in: &self.cancellables)
    }

    private func getAvailableSlots(for date: Date) -> [CalendarSlot] {
        return self.availableSlots.value?[date] ?? []
    }

    private func shouldDisableDate(date: Date) -> Bool {
        return self.getAvailableSlots(for: date).isEmpty
    }
}

private extension BookAppointmentFormData {
    func getDisplayable() -> BookAppointmentDisplayable? {
        guard let clientId = self.clientId,
              let clientName = self.clientName,
              let topic = self.topic,
              let type = self.type,
              let store = self.store,
              let date = self.date else {
            return nil
        }
        return BookAppointmentDisplayable(clientId: clientId,
                                          clientName: clientName,
                                          topic: topic,
                                          type: type,
                                          store: store,
                                          date: date,
                                          notes: self.notes)
    }
}

private struct EmptyDataError: Error { }
