//  Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

final class SelectClientViewModel: BaseSearchClientsViewModel, ObservableObject {
    @Published var selectedClientId: String?
    @Published var enableDoneButton: Bool = false

    private let onDone: (SelectedClient?) -> Void
    private var selectedClient: SelectedClient?
    private var selectedClientCancellable: AnyCancellable?

    init(title: String,
         onDismiss: @escaping () -> Void,
         onDone: @escaping (SelectedClient?) -> Void) {
        self.onDone = onDone
        super.init(title: title, onDismiss: onDismiss)
        self.initSelectedClientPublisher()
    }

    func didTapDone() {
        self.addLastSearchToRecentSearches()
        self.onDone(self.selectedClient)
    }

    private func initSelectedClientPublisher() {
        self.selectedClientCancellable = self.$selectedClientId
            .map { [weak self] clientId in
                return self?.dataSource.value?
                    .first { $0.id == clientId }
                    .map { SelectedClient(id: $0.id, name: $0.cellProvider.clientName) }
            }
            .weakAssign(to: \.selectedClient, on: self)

        self.$selectedClientId
            .map { $0 != nil }
            .assign(to: &self.$enableDoneButton)
    }
}
