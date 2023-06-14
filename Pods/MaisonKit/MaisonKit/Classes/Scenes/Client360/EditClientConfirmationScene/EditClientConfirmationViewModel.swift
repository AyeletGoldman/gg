//  Copyright © 2023 LVMH. All rights reserved.

import Combine
import Biodag

final class EditClientConfirmationViewModel: GenericFormViewModel<AnyFormData> {

    private enum Labels {
        static let sectionTitle = MKLocalizedString("clients.edit-client.confirmation.section.title",
                                                    comment: "The title for the section that shows the updates that will be applied to the client's profile")
    }

    private let clientID: String
    private let onSuccess: () -> Void

    @Inject private var adapter: ClientEditAdapter

    private var cancellables = Set<AnyCancellable>()

    init(clientID: String, data: AnyFormData, onSuccess: @escaping () -> Void, router: GenericFormRouter) {
        self.clientID = clientID
        self.onSuccess = onSuccess
        super.init(data: data, router: router)
    }

    func fetchConfirmationData() {
        self.sections = .loading(nil)
        self.adapter.getConfirmEditClientFields(clientID: self.clientID,
                                                data: self.data)
        .map(ResultState.fromResult)
        .map {
            switch $0 {
            case .found(let fields):
                return .found([FormSection(title: Labels.sectionTitle, fields: fields)])
            case .waiting:
                return .waiting
            case .loading(let displayable):
                return .loading(displayable.map { [FormSection(title: Labels.sectionTitle, fields: $0)] })
            case .failed(let error):
                return .failed(error)
            }
        }
        .catch { error in
            return Just(.failed(ErrorDisplayable(error)))
        }.weakAssign(to: \.sections, on: self)
            .store(in: &self.cancellables)
    }

    func didTapApplyButton() {
        self.isSaving = true

        self.adapter.saveClient(clientID: self.clientID, data: self.data)
            .sink { [weak self] completion in
                self?.isSaving = false
                switch completion {
                case .finished:
                    self?.onSuccess()
                case .failure(let error):
                    self?.showSavingError(ErrorDisplayable(error))
                }
            } receiveValue: { _ in }.store(in: &self.cancellables)
    }
}
