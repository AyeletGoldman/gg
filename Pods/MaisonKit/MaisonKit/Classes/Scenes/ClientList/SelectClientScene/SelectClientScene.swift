//  Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

struct SelectClientScene: Scene {

    let title: String
    let stylistSection: StylistIdentifier?
    let onDismiss: (SelectClientViewController) -> Void
    let onDone: (SelectClientViewController, SelectedClient?) -> Void

    init(title: String,
         stylistSection: StylistIdentifier? = nil,
         onDismiss: @escaping (SelectClientViewController) -> Void,
         onDone: @escaping (SelectClientViewController, SelectedClient?) -> Void) {
        self.title = title
        self.stylistSection = stylistSection
        self.onDismiss = onDismiss
        self.onDone = onDone
    }

    func createViewController() -> SelectClientViewController {
        return SelectClientViewController()
    }

    func configure(controller: SelectClientViewController,
                   using factory: SceneFactory) {
        let viewModel = SelectClientViewModel(title: self.title,
                                              onDismiss: { [weak controller, onDismiss] in
            guard let controller = controller else { return }
            onDismiss(controller)
        },
                                              onDone: { [weak controller, onDone] selectedClient in
            guard let controller = controller else { return }
            onDone(controller, selectedClient)
        })
        controller.viewModel = viewModel
        controller._stylistSection = self.stylistSection?.description
        controller.searchController = factory.createSearchController(searchResultsController: nil)
    }
}
