//
//  ClientInfoEditViewModel.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 13/01/2022.
//

import MaisonKit
import Combine
import Biodag

class ClientInfoEditViewModel: GenericFormViewModel<ClientInfoData> {
    
    private let clientDetailsData: [FieldsSection]
    private let onDone: (_ didSave: Bool) -> Void
    private var cancellables = Set<AnyCancellable>()
    
    @Inject private var client360InfoAdapter: Client360InfoAdapter

    init(clientId: String,
         clientDetailsData: [FieldsSection],
         onDone: @escaping (_ didSave: Bool) -> Void,
         router: GenericFormRouter) {
        self.clientDetailsData = clientDetailsData
        self.onDone = onDone
        let data: ClientInfoData = .init(clientId: clientId)
        data.setFields(fields: clientDetailsData)
        super.init(
            resultFieldsDataSource: data.$fields.eraseToAnyPublisher(),
            data: data,
            router: router
        )
    }
    
    func closeForm() {
        self.onDone(false)
    }
    
    func saveForm() {
        self.client360InfoAdapter.saveClientDetails(clientId: self.data.clientId, clientInfo: self.getDataToSave())
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.isSaving = true
            })
            .mapError(ErrorDisplayable.init)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.showSavingError(error)
                    self?.isSaving = false
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.isSaving = false
                self.onDone(true)
            })
            .store(in: &self.cancellables)
    }

    private func getDataToSave() -> GeneralInfoData {
        return self.data.getDataToSave(keysToRemove: [])
    }
}
