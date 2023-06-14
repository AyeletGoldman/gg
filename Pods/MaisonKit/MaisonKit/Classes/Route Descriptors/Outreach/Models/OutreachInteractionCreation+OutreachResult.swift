// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension OutreachInteractionCreation {
    init(result: OutreachResult) {
        self.init(
            clientId: result.clientId,
            channel: result.outreachType,
            title: result.title,
            templateId: result.templateId == Template.blankTemplate.id ? nil : result.templateId)
    }
}
