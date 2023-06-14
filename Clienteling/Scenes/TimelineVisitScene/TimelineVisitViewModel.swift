// Kenzo Clienteling
// 20/01/2022

import MaisonKit
import Combine
import Biodag

struct TimlineActionType {
    let title : String
    let id : String
}

class TimelineVisitViewModel: GenericFormViewModel<TimelineVisitData> {
    
    private var cancellables = Set<AnyCancellable>()
    let actionType : TimlineActionType
    let onDone: () -> Void
    
    @Inject private var client360InfoAdapter: Client360InfoAdapter
    
    init(clientId: String, actionType: TimlineActionType, onDone: @escaping () -> Void, router: DefaultGenericFormRouter) {
        self.onDone = onDone
        self.actionType = actionType
        let data = TimelineVisitData(clientId: clientId)
        super.init(
            fields: data.getFields(),
            data: data,
            router: router
        )
    }
    
    func closeForm() {
        self.onDone()
    }
    
    func saveForm() {
        self.client360InfoAdapter.saveTimelineItem(clientId: self.data.clientId,
                                                   actionType: self.actionType,
                                                   date: self.data.date ?? Date(),
                                                   comment: self.data.comment)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.isSaving = true
            })
            .mapError(ErrorDisplayable.init)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.isSaving = false
                    self?.showSavingError(error)
                }
            }, receiveValue: { [weak self] completion in
                guard let self = self else { return }
                let eventType = self.actionType.id.replacingOccurrences(of: " ", with: "_")
                Analytics.log(AddToTimelineEvent(type: eventType))
                self.isSaving = false
                NotificationCenter.default.post(name: .outreachCompletedSuccessfullyNotification,
                                                object: self.data.clientId)
                self.onDone()
            })
            .store(in: &self.cancellables)
    }
}
