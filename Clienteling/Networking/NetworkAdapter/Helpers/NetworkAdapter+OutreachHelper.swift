// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import Moya

extension NetworkAdapter {

    func getClientOutreachChannels(clientId: String,
                                   channelTypes: [OutreachChannels],
                                   additionalEntries: [OutreachSelectionEntry] = []) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        return self.networking.clientsControllerFindOutreachOne(clientId: clientId, channels: channelTypes)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                let givenEntries = response.data.result.channels.compactMap { OutreachSelectionEntry(channel: $0) }
                return OutreachSelectionDisplayable(entries: givenEntries + additionalEntries)
            }
    }
}

extension OutreachSelectionEntry {
    init?(channel: ClientOutreachChannel) {
        switch channel.type {
        case .call:
            guard let recipients = channel.recipients else { return nil }
            self = .call(recipients: recipients, isPreferred: channel.isPreferred)
        case .sms:
            guard let recipients = channel.recipients else { return nil }
            self = .sms(recipients: recipients, isPreferred: channel.isPreferred)
        case .email:
            guard let recipients = channel.recipients else { return nil }
            self = .email(recipients: recipients, isPreferred: channel.isPreferred)
        case .whatsApp:
            guard let recipients = channel.recipients else { return nil }
            self = .whatsapp(recipients: recipients, isPreferred: channel.isPreferred)
        case .weChat:
            self = .wechat(isPreferred: channel.isPreferred)
        case .line:
            self = .line(isPreferred: channel.isPreferred)
        case .kakao:
            self = .kakao(isPreferred: channel.isPreferred)
        default:
            return nil
        }
    }
}
