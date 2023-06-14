// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import SwiftUI
import Biodag

/// The Client360 view model
public final class Client360ViewModel: ObservableObject {

    private enum Labels {
        static let addAnEvent = MKLocalizedString("client360.actions.add-an-event.title",
                                                  comment: "The title for the 'Add an event' action sheet")
        static let confirmTimelineItemFailed = MKLocalizedString("client360.timeline-item.confirmation.confirm-failed.title",
                                                                 comment: "The message to show when confirm timeline item has failed")
        static let denyTimelineItemFailed = MKLocalizedString("client360.timeline-item.confirmation.deny-failed.title",
                                                              comment: "The message to show when deny timeline item has failed")
    }

    @Published private(set) var title: String?
    @Published private(set) var headerInfo: ResultState<Client360Displayable.Header, ErrorDisplayable> = .waiting
    @Published private(set) var kpiInfo: ResultState<Client360Displayable.KPI, ErrorDisplayable> = .waiting
    @Published private(set) var timelineInfo: ResultState<TimelineDisplayable, ErrorDisplayable> = .waiting
    @Published private(set) var hasOutreachChannels: ResultState<Bool, ErrorDisplayable> = .waiting
    @Published private(set) var availableTimelineEventActions: ResultState<[ContextualAction], ErrorDisplayable> = .waiting
    @Published private(set) var availableNavigationBarActions: [MenuAction] = []

    @Published var isLoading = true
    @Published var selectedFilters: Set<TimelineDisplayable.Filter> = []
    @Published var alertContext: AlertContext?

    private var taskCache: [String: AnyTask] = [:]
    private var cancellables = Set<AnyCancellable>()
    private let clientId: String
    private let router: Client360Router
    private let phoneLine: PhoneLine
    private let outreachHandler = OutreachPublisherHandler()

    @Inject private var client360Adapter: Client360Adapter
    @Inject private var outreachAdapter: OutreachAdapter

    /// Creates a new Client360 view model with a client ID and a `Client360Adapter`
    /// - Parameter clientId: the ID of the client that will be used to retrieve data
    /// - Parameter clientName: the name of the client we're showing the details for, if available. Defaults to `nil`.
    /// - Parameter router: the router to handle navigation away from this view
    /// - Parameter phoneLine: an object that handles making phone calls
    public init(clientId: String,
                clientName: String? = nil,
                router: Client360Router,
                phoneLine: PhoneLine = UIApplication.shared) {
        self.clientId = clientId
        self.router = router
        self.phoneLine = phoneLine
        self.title = clientName

        self.initIsLoading()

        // Log analytics when the selected filters change and we are with that filter for 2 secs
        self.$selectedFilters.debounce(for: .seconds(2),
                                       scheduler: DispatchQueue.main)
        .map { filters in filters.map { $0.id } }
        .dropFirst() // Ignore the first event when the vm is created
        .removeDuplicates()
        .sink { filterTypes in
            Analytics.log(TimelineFilteredEvent(filters: filterTypes.map { $0.value }))
        }.store(in: &self.cancellables)

        if !Features.manager.isEnabled(.enableTimelinePublisherRefreshFromImplementation, defaultValue: true) {
            // If ever we are on a tab with c360 open and an outreach completes in another tab, we want to refresh our timeline
            NotificationCenter.default.publisher(for: .outreachCompletedSuccessfullyNotification).sink { [weak self] notification in
                // If we don't have a client ID or we this c360 screen is not the same as the client that got the c360 we ignore
                guard let clientId = notification.object as? String, clientId == self?.clientId else { return }
                Task { [weak self] in await self?.refreshTimeline() }
            }.store(in: &self.cancellables)
        }
    }

    private func handleOutreachFlowItem(_ flowItem: OutreachFlowItem) {
        switch flowItem.type {
        case .call:
            guard let recipient = flowItem.recipient else { return }
            self.phoneLine.call(potentialNumber: recipient) { [weak self] result in
                let outreachResult = OutreachResult(
                    outreachType: .call,
                    clientId: flowItem.clientID,
                    resultStatus: result
                )
                self?.handleOutreachResult(outreachResult)
            }
        case .facetime:
            guard let recipient = flowItem.recipient else { return }
            self.phoneLine.faceTime(potentialNumber: recipient) { [weak self] result in
                let outreachResult = OutreachResult(
                    outreachType: .facetime,
                    clientId: flowItem.clientID,
                    resultStatus: result
                )
                self?.handleOutreachResult(outreachResult)
            }
        default:
            self.router.presentTemplateSelection(
                outreachFlowItem: flowItem,
                getTemplates: { [outreachAdapter, clientId] in
                    outreachAdapter.getTemplates(clientId: clientId)
                },
                onDone: { [weak self] result in
                    self?.handleOutreachResult(result)
                })
        }
    }

    private func initIsLoading() {
        self.$headerInfo.combineLatest(self.$kpiInfo)
            .map { (headerInfo, kpiInfo) in
                return headerInfo.isLoading || headerInfo.isWaiting || kpiInfo.isLoading || kpiInfo.isWaiting
            }.weakAssign(to: \.isLoading, on: self)
            .store(in: &self.cancellables)
    }

    func fetchClientData() {
        self.fetchHeader()
        self.fetchKPIs()
        self.fetchTimeline()
        self.fetchAvailableTimelineActions()
        self.fetchContactabilityStatus()
        self.fetchNavigationBarActions()
    }

    @MainActor
    func refreshClientData() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask { await self.refreshHeader() }
            group.addTask { await self.refreshKPIs() }
            group.addTask { await self.refreshTimeline() }
            group.addTask { await self.refreshAvailableTimelineActions() }
            group.addTask { await self.refreshContactabilityStatus() }
            group.addTask { await self.refreshNavigationBarActions() }
        }
    }

    @MainActor
    func confirmTimelineItem(interactionID: String, action: TimelineEntryConfirmationAction) {
        let publisher = self.client360Adapter.confirmTimelineItem(interactionID: interactionID, action: action)
        Task {
            do {
                try await publisher.getResultAsync()
            } catch {
                let failedTitle: String = {
                    switch action {
                    case .confirm: return Labels.confirmTimelineItemFailed
                    case .deny: return Labels.denyTimelineItemFailed
                    }
                }()
                ToastView.show(text: failedTitle, style: .error)
                await self.refreshTimeline()
            }
        }
    }

    func logViewAnalytics() {
        Analytics.log(Client360ViewedEvent())
    }
}

extension Client360ViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { return self.router }
}

// MARK: - Button handlers
extension Client360ViewModel {
    func didTapFilter(_ filter: TimelineDisplayable.Filter) {
        if self.selectedFilters.contains(filter) {
            self.selectedFilters.remove(filter)
        } else {
            self.selectedFilters.insert(filter)
        }
    }

    /// Handles tapping on the + ADD button in the timeline. When this happens, we take the available timeline actions
    /// and display an actionsheet to allow the user to select a timeline event to create.
    func didTapAddEventButton() {
        // We don't store this subscription because we don't want the sheet
        // to re-appear when the `availableTimelineEventActions` is refreshed.
        // This is a one-off.
        _ = Just(()).combineLatest(self.$availableTimelineEventActions).b
            .compactMap { [weak self] in
                return $0.value?.compactMap { eventAction in
                    self?.buildActionSheetItem(for: eventAction)
                }
            }.sink(receiveValue: { [weak self] items in
                let content = ActionSheetContent(title: Labels.addAnEvent,
                                                 items: items,
                                                 cancelItem: .cancelItem())
                self?.router.presentActionSheet(content, onItemSelected: { item in
                    item.action?()
                })
            })
    }

    private func buildActionSheetItem(for eventAction: ContextualAction) -> ActionSheetItem {
        return ActionSheetItem(title: eventAction.localizedTitle, action: { [weak self] in
            self?.handleActionTypeAction(action: eventAction)
        })
    }

    func contactButtonAction() {
        self.router.presentOutreachSelection { [weak self] in
            guard let self = self else { return Fail(error: ReleasedSelfError()).eraseToAnyPublisher() }
            return self.outreachAdapter.getClientOutreachChannels(clientID: self.clientId)
        } onItemSelected: { [weak self] outreachType, recipient in
            guard let self = self else { return }
            self.handleOutreachFlowItem(OutreachFlowItem(clientID: self.clientId,
                                                         type: outreachType,
                                                         recipient: recipient))
        }
    }

    func onSelectTimelineItem(_ item: TimelineDisplayable.Entry) {
        guard let action = item.action else { return }
        self.handleActionType(action: action)
    }
}

// MARK: - Fetch & listen header
extension Client360ViewModel {

    @MainActor
    private func refreshHeader() async {
        let publisher = self.client360Adapter.getClientHeader(clientId: self.clientId)
        let task = Task {
            return try await publisher.getResultAsync()
        }
        self.headerInfo = await ResultState.fromTask(task)
        self.title = try? await task.value.clientName
    }

    private func fetchHeader() {
        self.headerInfo = .loading(nil)
        let stream = self.client360Adapter.getClientHeader(clientId: self.clientId).values
        let task = Task { [weak self] in
            do {
                for try await result in stream {
                    await self?.updateHeaderInformation(result)
                }
            } catch {
                await self?.setHeaderError(error)
            }
        }
        self.taskCache[#function] = task.eraseToAnyTask()
    }

    @MainActor
    private func updateHeaderInformation(_ result: Result<Client360Displayable.Header, ErrorDisplayable>) {
        self.headerInfo = ResultState.fromResult(result: result)
        self.title = result.value?.clientName
    }

    @MainActor
    private func setHeaderError(_ error: Error) {
        self.headerInfo = .failed(ErrorDisplayable(error))
    }
}

// MARK: - Fetch & listen KPIs
extension Client360ViewModel {

    @MainActor
    private func refreshKPIs() async {
        let publisher = self.client360Adapter.getKpi(clientId: self.clientId)
        self.kpiInfo = await ResultState.fromAsyncPublisher(publisher)
    }

    private func fetchKPIs() {
        self.kpiInfo = .loading(nil)
        let stream = self.client360Adapter.getKpi(clientId: self.clientId).values
        let task = Task { [weak self] in
            do {
                for try await event in stream {
                    await self?.updateKPIInfo(event)
                }
            } catch {
                await self?.updateKPIInfo(.failure(ErrorDisplayable(error)))
            }
        }
        self.taskCache[#function] = task.eraseToAnyTask()
    }

    @MainActor
    private func updateKPIInfo(_ result: Result<Client360Displayable.KPI, ErrorDisplayable>) {
        self.kpiInfo = ResultState.fromResult(result: result)
    }
}

// MARK: - Fetch & listen timeline
extension Client360ViewModel {

    @MainActor
    private func refreshTimeline() async {
        let publisher = self.getTimelineDisplayable()
        self.timelineInfo = await ResultState.fromAsyncPublisher(publisher)
    }

    private func fetchTimeline() {
        self.timelineInfo = .loading(nil)
        let stream = self.getTimelineDisplayable().values
        let task = Task { [weak self] in
            do {
                for try await event in stream {
                    await self?.updateTimelineInfo(event)
                }
            } catch {
                await self?.updateTimelineInfo(.failure(ErrorDisplayable(error)))
            }
        }
        self.taskCache[#function] = task.eraseToAnyTask()
    }

    @MainActor
    private func updateTimelineInfo(_ result: Result<TimelineDisplayable, ErrorDisplayable>) {
        self.timelineInfo = ResultState.fromResult(result: result)
    }

    private func getTimelineDisplayable() -> AnyPublisher<Result<TimelineDisplayable, ErrorDisplayable>, Error> {
        return self.client360Adapter.getTimeline(clientId: self.clientId)
            .combineLatest(self.$selectedFilters.setFailureType(to: Error.self))
            .compactMap { [weak self] result, filters in
                return self?.filterResults(result, filters: filters)
            }.eraseToAnyPublisher()
    }

    private func filterResults(_ result: Result<TimelineDisplayable, ErrorDisplayable>,
                               filters: Set<TimelineDisplayable.Filter>) -> Result<TimelineDisplayable, ErrorDisplayable> {
        switch result {
        case .success(let timeline):
            if filters.isEmpty {
                return result
            }
            let sections = timeline.sections.map { section in
                return TimelineDisplayable.Section(
                    id: section.id,
                    title: section.title,
                    items: section.items.filter { item in
                        filters.map { filter in filter.id }.contains(item.filterId)
                    })
            }.filter {
                !$0.items.isEmpty
            }
            return .success(TimelineDisplayable(sections: sections,
                                                filters: timeline.filters))
        case .failure:
            return result
        }
    }
}

// MARK: - Fetch & listen timeline actions
extension Client360ViewModel {

    @MainActor
    private func refreshAvailableTimelineActions() async {
        let publisher = self.client360Adapter.getAvailableTimelineActions(clientId: self.clientId)
        self.availableTimelineEventActions = await ResultState.fromAsyncPublisher(publisher)
    }

    private func fetchAvailableTimelineActions() {
        self.availableTimelineEventActions = .loading(nil)
        let stream = self.client360Adapter.getAvailableTimelineActions(clientId: self.clientId).values
        let task = Task { [weak self] in
            do {
                for try await event in stream {
                    await self?.updateTimelineActions(event)
                }
            } catch {
                await self?.updateTimelineActions(.failure(ErrorDisplayable(error)))
            }
        }
        self.taskCache[#function] = task.eraseToAnyTask()
    }

    @MainActor
    private func updateTimelineActions(_ result: Result<[ContextualAction], ErrorDisplayable>) {
        self.availableTimelineEventActions = ResultState.fromResult(result: result)
    }
}

// MARK: - Fetch & listen contactability status
extension Client360ViewModel {

    @MainActor
    private func refreshContactabilityStatus() async {
        let publisher = self.client360Adapter.getClientIsContactable(clientID: self.clientId)
        self.hasOutreachChannels = await ResultState.fromAsyncPublisher(publisher)
    }

    private func fetchContactabilityStatus() {
        self.hasOutreachChannels = .loading(nil)
        let stream = self.client360Adapter.getClientIsContactable(clientID: self.clientId).values
        let task = Task { [weak self] in
            do {
                for try await event in stream {
                    await self?.updateOutreachChannelAvailability(.success(event))
                }
            } catch {
                await self?.updateOutreachChannelAvailability(.failure(ErrorDisplayable(error)))
            }
        }
        self.taskCache[#function] = task.eraseToAnyTask()
    }

    @MainActor
    private func updateOutreachChannelAvailability(_ result: Result<Bool, ErrorDisplayable>) {
        self.hasOutreachChannels = ResultState.fromResult(result: result)
    }
}

// MARK: - Fetch & listen navigation bar actions

extension Client360ViewModel {

    @MainActor
    private func refreshNavigationBarActions() async {
        let publisher = self.client360Adapter.getClientNavigationActions(clientId: self.clientId)
        let task = Task {
            return try? await publisher.getAsync()
        }
        let result = await task.value
        self.availableNavigationBarActions = result ?? []
    }

    private func fetchNavigationBarActions() {
        let stream = self.client360Adapter.getClientNavigationActions(clientId: self.clientId).values
        let task = Task { [weak self] in
            for try await event in stream {
                await self?.updateAvailableNavigationBarActions(event)
            }
        }
        self.taskCache[#function] = task.eraseToAnyTask()
    }

    @MainActor
    private func updateAvailableNavigationBarActions(_ result: [MenuAction]) {
        self.availableNavigationBarActions = result
    }
}

// MARK: - Handle outreach results
private extension Client360ViewModel {
    private func handleOutreachResult(_ result: OutreachResult) {
        switch result.resultStatus {
        case .success:
            // Create an Outreach Interaction Object to send to the server
            let interaction = OutreachInteractionCreation(result: result)
            // Call server to create The Interaction
            let publisher = self.outreachAdapter.createInteraction(interaction: interaction)
            self.outreachHandler.sinkPublisherWhenNeeded(publisher) { result in
                if !Features.manager.isEnabled(.enableTimelinePublisherRefreshFromImplementation, defaultValue: true), result.isSuccess {
                    Task { [weak self] in await self?.refreshTimeline() }
                }
            }
            Analytics.log(OutreachActionPerformedEvent(type: result.outreachType,
                                                       templateUsed: result.templateName))
        case .failure:
            // Log analytics?
            break
        case .cancelled:
            // Do nothing
            break
        }
    }
}
