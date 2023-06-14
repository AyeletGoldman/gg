// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine

public extension MenuAction {
    /// Creates a new `MenuAction` that will be used to contact a client
    /// - Parameters:
    ///   - clientId: the client ID to contact with
    /// - Returns: an instance of `MenuAction` that will return the outreach channel selection scene that starts the outreach flow.
    static func outreachMenuAction(clientId: String) -> MenuAction {
        let title = MKLocalizedString("actions.client-outreach.title",
                                      comment: "The title of the outreach action that gives the option to contact with a client")
        return MenuAction(localizedTitle: title,
                          imageIdentifier: Self.buildIdentifier(withToken: "icon-message"),
                          preferredPresentationStyle: .modal(detents: [.medium(), .large()])) { onDone in
            let viewModel = OutreachActionViewModel.default
            let outreachFlowContainer = OutreachFlowContainer(
                clientID: clientId,
                assets: [],
                getTemplatesMethod: { viewModel.getTemplates(clientId: clientId) },
                createInteraction: viewModel.createInteraction)
            return OutreachSelectionRouteDescriptor(getOutreachActions: { viewModel.getOutreachActions(clientId: clientId) },
                                                    onCancel: { onDone?($0) },
                                                    outreachFlowContainer: outreachFlowContainer)
        }
    }
}

private class OutreachActionViewModel {
    static let `default` = OutreachActionViewModel()

    @Inject private var outreachAdapter: OutreachAdapter

    func getOutreachActions(clientId: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        return self.outreachAdapter.getClientOutreachChannels(clientID: clientId)
    }

    func getTemplates(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error> {
        return self.outreachAdapter.getTemplates(clientId: clientId)
    }

    func createInteraction(interaction: OutreachInteractionCreation) -> VoidResultPublisher {
        return self.outreachAdapter.createInteraction(interaction: interaction)
    }
}
