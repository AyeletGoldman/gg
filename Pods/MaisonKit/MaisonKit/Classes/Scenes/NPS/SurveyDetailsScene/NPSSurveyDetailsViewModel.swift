//  Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

final class NPSSurveyDetailsViewModel: ObservableObject {

    private let npsID: String

    @Inject private var adapter: NPSAdapter

    @Published private(set) var displayable: ResultState<NPSSurveyDetailsDisplayable, ErrorDisplayable> = .waiting

    private var cancellables = Set<AnyCancellable>()

    init(npsID: String) {
        self.npsID = npsID
    }

    func fetchSurveyDetails() {
        self.adapter.fetchNPSSurveyDetails(npsID: self.npsID)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.displayable = .loading(nil)
            })
            .map(ResultState.fromResult)
            .catch { Just(.failed(ErrorDisplayable($0))).eraseToAnyPublisher() }
            .weakAssign(to: \.displayable, on: self)
            .store(in: &self.cancellables)
    }
}
