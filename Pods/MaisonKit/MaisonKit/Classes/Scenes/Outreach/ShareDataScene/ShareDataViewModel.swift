// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

// Subclasses don't publish updates if their parent class is `ObservableObject`, it has to be the actual
// subclass. https://stackoverflow.com/questions/57615920/published-property-wrapper-not-working-on-subclass-of-observableobject
/// A view model to manage ShareDataScene
public class ShareDataViewModel: BaseSearchClientsViewModel, ObservableObject {

    private let assets: [URL]
    private let adapter: ShareDataAdapter
    private let router: ShareDataRouter

    private var cancellables = Set<AnyCancellable>()
    private let outreachHandler = OutreachPublisherHandler()

    @Published private(set) var isLoading = false

    public init(title: String,
                assets: [URL],
                adapter: ShareDataAdapter,
                onClose: @escaping () -> Void = { },
                router: ShareDataRouter) {

        self.assets = assets
        self.adapter = adapter
        self.router = router

        super.init(clientListId: nil,
                   title: title,
                   onDismiss: onClose)
    }

    func didSelectClient(_ clientID: String) {
        self.addLastSearchToRecentSearches()

        self.router.presentOutreachSelection(getOutreachActions: { [adapter] in
            return adapter.getClientOutreachChannels(clientID: clientID)
        }, onItemSelected: { [weak self] outreachType, recipient in
            let flowItem = OutreachFlowItem(clientID: clientID,
                                            type: outreachType,
                                            recipient: recipient)
            self?.didFinishCreatingOutreachFlowItem(flowItem: flowItem)
            Analytics.log(OutreachActionInvokedEvent(type: outreachType))
        })
    }

    func didFinishCreatingOutreachFlowItem(flowItem: OutreachFlowItem) {
        self.router.presentTemplateSelection(
            outreachFlowItem: flowItem,
            assetURLs: self.assets,
            getTemplates: { [adapter] in
                adapter.getTemplates(clientId: flowItem.clientID)
            },
            onDone: { [weak self] result in
                self?.handleOutreachResult(result)
            })
    }
}

// MARK: - Handle outreach results
private extension ShareDataViewModel {
    private func handleOutreachResult(_ result: OutreachResult) {
        switch result.resultStatus {
        case .success:
            // Create an Outreach Interaction Object to send to the server
            let interaction = OutreachInteractionCreation(result: result)
            // Call server to create The Interaction
            self.isLoading = true
            let publisher = self.adapter.createInteraction(interaction: interaction)
            self.outreachHandler.sinkPublisherWhenNeeded(publisher, onDone: { [weak self] result in
                if !Features.manager.isEnabled(.enableTimelinePublisherRefreshFromImplementation, defaultValue: true), result.isSuccess {
                    NotificationCenter.default.post(name: .outreachCompletedSuccessfullyNotification,
                                                    object: interaction.clientId)
                }
                self?.isLoading = false
                self?.onDismiss?()
            })
            Analytics.log(OutreachActionPerformedEvent(type: result.outreachType,
                                                       templateUsed: result.templateName))
        case .failure, .cancelled:
            break
        }
    }
}
