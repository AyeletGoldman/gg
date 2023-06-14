// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine

final class Client360DetailsViewModel: GenericFormViewModel<Client360Displayable.Details> {

    private enum Labels {
        static let defaultNavigationBarTitle = MKLocalizedString("client360.details.navigationBar.title",
                                                                 comment: "Title for the client 360 details subview navigation bar")
    }

    /// The string to use as a title for the screen
    let title: String
    private let clientId: String
    private let router: Client360DetailsRouter
    private var cancellables = Set<AnyCancellable>()

    @Inject private var client360Adapter: Client360Adapter

    init(title: String?, clientId: String, router: Client360DetailsRouter) {
        self.clientId = clientId
        self.title = title ?? Labels.defaultNavigationBarTitle
        self.router = router
        super.init(data: Client360Displayable.Details(), isReadOnly: true, router: router)
    }

    func fetchClientData() {
        self.fetchClientDetails()
    }

    func fetchClientDetails() {
        self.sections = .loading(nil)
        self.client360Adapter.getClientDetails(clientId: self.clientId)
            .map(ResultState.fromResult)
            .map { [weak self] in
                guard let self = self else { return .waiting }
                switch $0 {
                case .found(let details):
                    return .found(self.buildFields(from: details))
                case .waiting:
                    return .waiting
                case .loading(let details):
                    return .loading(details.map { self.buildFields(from: $0) })
                case .failed(let error):
                    return .failed(error)
                }
            }
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }.weakAssign(to: \.sections, on: self)
            .store(in: &self.cancellables)
    }

    private func buildFields(from details: Client360Displayable.Details) -> [FormSection<Client360Displayable.Details>] {
        return details.sections.map {
            return FormSection(title: $0.title, fields: $0.fields)
        }
    }

    func didTapEditClientButton() {
        self.router.presentEditClient(clientID: self.clientId, onSuccess: {
            // TODO: Handle successful client update
        })
    }

    func logViewAnalytics() {
        Analytics.log(PersonalInformationViewedEvent())
    }
}
