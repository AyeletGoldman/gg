// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

struct CuratorShareViewModel: ShareDataAdapter {

    @Inject private var adapter: ProductCuratorAdapter

    func getClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        self.adapter.getCuratorClientOutreachChannels(clientID: clientID)
    }

    func getTemplates(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error> {
        self.adapter.getCuratorTemplates(clientId: clientId)
    }

    func createInteraction(interaction: OutreachInteractionCreation) -> VoidResultPublisher {
        self.adapter.createCuratorInteraction(interaction: interaction)
    }
}
