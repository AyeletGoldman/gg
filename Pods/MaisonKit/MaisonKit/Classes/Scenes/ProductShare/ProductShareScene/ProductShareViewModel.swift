// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

struct ProductShareViewModel: ShareDataAdapter {

    private let productIds: [String]
    @Inject private var productShareAdapter: ProductShareAdapter

    init(productIds: [String]) {
        self.productIds = productIds
    }

    func getClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        self.productShareAdapter.getProductShareClientOutreachChannels(clientID: clientID)
    }

    func getTemplates(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error> {
        self.productShareAdapter.getTemplates(productIds: self.productIds, clientId: clientId)
    }

    func createInteraction(interaction: OutreachInteractionCreation) -> VoidResultPublisher {
        self.productShareAdapter.createInteraction(interaction: interaction, productIds: self.productIds)
    }
}
