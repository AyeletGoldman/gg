//  Copyright © 2022 LVMH. All rights reserved.

import Combine
import Biodag

final class NPSDetailsViewModel: ObservableObject {

    private enum Labels {
        static let transactionSectionTitle = MKLocalizedString("nps.survey-details.transaction.section.title",
                                                               comment: "Title for the transaction details section")
    }

    private let router: NPSDetailsRouter
    private let npsID: String

    @Inject private var adapter: NPSAdapter

    @Published private(set) var displayable: ResultState<NPSDetailsDisplayable, ErrorDisplayable> = .waiting

    private var cancellables = Set<AnyCancellable>()

    init(npsID: String, router: NPSDetailsRouter) {
        self.router = router
        self.npsID = npsID
    }

    func fetchNPSDetails() {
        self.adapter.fetchNPSDetails(npsID: self.npsID)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.displayable = .loading(nil)
            })
            .map(ResultState.fromResult)
            .catch { Just(.failed(ErrorDisplayable($0))).eraseToAnyPublisher() }
            .weakAssign(to: \.displayable, on: self)
            .store(in: &self.cancellables)
    }

    func didTapViewClientProfile(_ clientID: String) {
        self.router.presentClientProfile(clientID: clientID)
    }

    func didTapViewFullSurvey() {
        self.router.presentSurveyDetails(surveyID: self.npsID)
    }

    func onSelectTimelineEntry(_ timelineEntry: TimelineDisplayable.Entry) {
        guard let action = timelineEntry.action else { return }
        self.handleActionType(action: action)
    }

    func createTimelineSection(for transaction: TimelineItemDisplayable) -> TimelineDisplayable.Section {
        let item = TimelineDisplayable.Entry(item: transaction)
        return TimelineDisplayable.Section(title: Labels.transactionSectionTitle, items: [item])
    }

    private func buildFooter(advisorName: String, storeName: String?) -> String {
        return storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName
    }
}

extension NPSDetailsViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter {
        return self.router
    }
}
