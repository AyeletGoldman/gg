// Kenzo Clienteling
// 20/01/2022

import MaisonKit
import Combine

class TimelineVisitViewController: StylableViewController<GenericFormView<TimelineVisitData>> {
    
    private enum Labels {
        static let add = MKLocalizedString("timeline-visit.navigationBar.trailing.add",
                                            comment: "The title for trailing navigation bar add button in timeline visit form")
    }
    
    var viewModel: TimelineVisitViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = MKLocalizedString(viewModel.actionType.title,
                                       comment: "The title for timline action Scene")
        self.createAddButton()
        self.createCloseButton()
    }
    
    private func createAddButton() {
        self.viewModel.$isValidForm.sink { [weak self] isValid in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.add), isEnabled: isValid, action: self.viewModel.saveForm))
        }.store(in: &self.cancellables)
        
        self.viewModel.$isSaving.sink { [weak self] isSaving in
            guard let self = self else { return }
            if isSaving {
                self.setRightBarButtonItem(.loading)
            } else {
                self.setRightBarButtonItem(NavigationButton(title: .text(Labels.add),
                                                            isEnabled: self.viewModel.isValidForm,
                                                            action: self.viewModel.saveForm))
            }
        }.store(in: &self.cancellables)
    }
    
    private func createCloseButton() {
        self.setLeftBarButtonItem(NavigationButton(title: .text(GeneralLabels.cancel), action: self.viewModel.closeForm))
    }
}
