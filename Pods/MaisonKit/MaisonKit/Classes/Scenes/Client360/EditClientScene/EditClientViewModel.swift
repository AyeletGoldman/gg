//  Copyright © 2022 LVMH. All rights reserved.

import Combine
import Biodag

final class EditClientViewModel: GenericFormViewModel<AnyFormData> {

    private let router: EditClientRouter
    private let clientID: String
    private let onCancel: () -> Void
    private let onSuccess: () -> Void

    @Inject private var adapter: ClientEditAdapter
    private var cancellables = Set<AnyCancellable>()

    init(clientID: String,
         router: EditClientRouter,
         onCancel: @escaping () -> Void,
         onSuccess: @escaping () -> Void) {
        self.router = router
        self.clientID = clientID
        self.onCancel = onCancel
        self.onSuccess = onSuccess
        super.init(data: AnyFormData(data: [:]), isReadOnly: false, router: router)
    }

    func didTapCancel() {
        self.onCancel()
    }

    func fetchClientFields() {
        self.sections = .loading(nil)
        self.adapter.getEditClientFields(clientID: self.clientID)
            .map(ResultState.fromResult)
            .map { [weak self] in
                guard let self = self else { return .waiting }
                switch $0 {
                case .found(let displayable):
                    self.data = displayable.data
                    return .found(displayable.sections)
                case .waiting:
                    return .waiting
                case .loading(let displayable):
                    return .loading(displayable.map { $0.sections })
                case .failed(let error):
                    return .failed(error)
                }
            }
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }.weakAssign(to: \.sections, on: self)
            .store(in: &self.cancellables)
    }

    func didTapNext() {
        self.router.presentConfirmation(clientID: self.clientID, data: self.data, onSuccess: self.onSuccess)
    }
}
