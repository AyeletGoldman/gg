// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine

final class AppointmentsViewModel: ObservableObject, ActionHandlerViewModel {

    private let router: AppointmentsRouter
    var actionHandlingRouter: ActionScenePresenterRouter {
        return self.router
    }
    private var cancellables = Set<AnyCancellable>()

    @Published var selectedDate: Date?
    @Published var scrollToID: UUID?
    @Published private(set) var timelineDisplayable: ResultState<TimelineDisplayable, ErrorDisplayable> = .waiting
    @Published private(set) var filters: ResultState<[TimelineDisplayable.Filter], ErrorDisplayable> = .waiting
    let refreshCalendarPublisher = PassthroughSubject<Void, Never>()

    private let dateToTimelineDictionary = CurrentValueSubject<Result<AppointmentsList, ErrorDisplayable>?, Error>(nil)

    @Inject private var adapter: AppointmentsAdapter

    init(router: AppointmentsRouter) {
        self.router = router
        self.selectedDate = Calendar.autoupdatingCurrent.startOfDay(for: Date())

        self.observeTimeline()
        self.observeSelectedDate()
    }

    private func observeTimeline() {
        self.dateToTimelineDictionary
            .compactMap { $0 }
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.selectedDate = self?.selectedDate
            })
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.timelineDisplayable = .failed(ErrorDisplayable(error))
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.timelineDisplayable = .failed(error)
                case .success(let appointmentsList):
                    let sortedKeys = appointmentsList.appointments.keys.sorted(by: {
                        let calendar = $0.calendar ?? Calendar.autoupdatingCurrent
                        let secondCalendar = $1.calendar ?? Calendar.autoupdatingCurrent
                        if calendar != secondCalendar {
                            // What do we do here?
                            return false
                        }
                        guard let date = calendar.date(from: $0), let date2 = secondCalendar.date(from: $1) else { return false }
                        return date < date2
                    })
                    let allAppointments = sortedKeys.compactMap {
                        return appointmentsList.appointments[$0]
                    }
                    let displayable = allAppointments.reduce(TimelineDisplayable(sections: [], filters: [])) { partialResult, newDisplayable in
                        return TimelineDisplayable(sections: partialResult.sections + [newDisplayable],
                                                   filters: appointmentsList.filters)
                    }

                    self?.timelineDisplayable = .found(displayable)
                }
            })
            .store(in: &self.cancellables)
    }

    private func observeSelectedDate() {
        self.$selectedDate
            .compactMap { $0 }
            .removeDuplicates()
            .setFailureType(to: Error.self)
            .combineLatest(self.dateToTimelineDictionary.compactMap { $0 })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] selectedDate, result in
                let components = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: selectedDate)
                guard let appointmentsList = result.value, let displayable = appointmentsList.appointments[components] else { return }
                self?.scrollToID = displayable.id
            })
            .store(in: &self.cancellables)
    }

    func fetchTimelineDetails() {
        self.adapter.getAppointments().handleEvents(receiveSubscription: { [weak self] _ in
            self?.timelineDisplayable = .loading(nil)
            self?.filters = .loading(nil)
        })
        .sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.timelineDisplayable = .failed(ErrorDisplayable(error))
            case .finished:
                break
            }
        } receiveValue: { [weak self] componentsResult in
            self?.dateToTimelineDictionary.send(componentsResult)
            self?.refreshCalendarPublisher.send(())
            self?.filters = .found(componentsResult.value?.filters ?? [])
        }.store(in: &self.cancellables)
    }

    func presentBookAppointment() {
        self.router.presentBookAppointment()
    }

    func didTapFilter() {
        self.router.presentAppointmentsFilters(filters: [
              FilterData(title: "Filter 1",
                         icon: nil,
                         pluralTitleFormat: "Filter 1",
                         viewBuilder: .textFilter(TextFilter(id: UUID().uuidString,
                                                             filterItems: [
                                                              TextFilterView.Item(displayName: "Value 1",
                                                                                  value: "value-1"),
                                                              TextFilterView.Item(displayName: "Value 2",
                                                                                  value: "value-2"),
                                                              TextFilterView.Item(displayName: "Value 3",
                                                                                  value: "value-3")
                                                             ])))
          ],
                                                 selectedFilters: [:],
                                                 onDone: { newFilters in
              // TODO
              print("Request appointments again", newFilters)
          })
    }

    func onSelectTimelineEntry(_ entry: TimelineDisplayable.Entry) {
        guard let action = entry.action else { return }
        self.handleActionType(action: action)
    }

    func shouldDisableDate(_ date: Date) -> Bool {
        // We disable a date if
        let components = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: date)
        // There are no results yet
        guard let result = self.dateToTimelineDictionary.value?.value else { return true }
        // The results don't contain the components we're looking for
        guard let component = result.appointments[components] else { return true }
        // or the component's displayable has no entries
        return component.items.isEmpty
    }
}
