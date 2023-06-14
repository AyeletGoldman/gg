//
//  PrefsEditViewModel.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 18/01/2022.
//

import MaisonKit
import Combine
import Biodag

class PrefsEditViewModel: GenericFormViewModel<NoteAndPrefsData> {
    let onDone: (_ didSave: Bool) -> Void
    private var cancellables = Set<AnyCancellable>()
    
    @Inject private var client360InfoAdapter: Client360InfoAdapter

    init(data:NoteAndPrefsData, onDone: @escaping (_ didSave: Bool) -> Void,router: GenericFormRouter) {
        self.onDone = onDone
        super.init(resultFieldsDataSource: data.$prefsFields.eraseToAnyPublisher(),
                   data: data,
                   router: router)
    }

    func closeForm() {
        self.onDone(false)
    }
    
    func savePrefs() {
        self.client360InfoAdapter.savePreferences(clientId: self.data.clientId, preferences: self.data)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.isSaving = true
            })
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }.sink(receiveValue: { [weak self] completion in
                guard let self = self else { return }
                self.isSaving = false
                switch completion {
                case .success:
                    Analytics.log(SavePreferencesEvent())
                    self.onDone(true)
                case .failure(let error):
                    self.showSavingError(error)
                }
            })
            .store(in: &self.cancellables)
    }
}
