// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import Moya

extension NetworkAdapter {

    func getOutreachChannels(clientId: String, channelTypes: [OutreachChannels]) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        return self.networking.clientsControllerFindOutreachOne(clientId: clientId, channels: channelTypes)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return OutreachSelectionDisplayable(entries: response.data.result.channels.compactMap { OutreachSelectionEntry(channel: $0) })
            }
    }

    func getClientOutreachChannels(clientID: String,
                                   channelTypes: [OutreachChannels],
                                   additionalEntries: [OutreachSelectionEntry] = []) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        return self.networking.clientsControllerFindOutreachOne(clientId: clientID, channels: channelTypes)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                let givenEntries = response.data.result.channels.compactMap { OutreachSelectionEntry(channel: $0) }
                return OutreachSelectionDisplayable(entries: givenEntries + additionalEntries)
            }
    }

    func createInteraction(interaction: OutreachInteractionCreation, context: MKInteractionContext) -> VoidResultPublisher {
        guard let dto = CreateInteractionV2(interaction: interaction, context: context) else {
            return Just(.failure(ErrorDisplayable(localizedDescription: MKLocalizedString("Unsupported interaction type",
                                                                                          comment: "Error to return when the interaction type is not supported"))))
                .setFailureType(to: Error.self)
               
                .eraseToAnyPublisher()
        }

        return self.networking.interactionsControllerCreate(body: dto)
            .unwrapDefaultSuccessResponse()
            .onFinished { [weak self] in
                self?.updateClientTimeline(for: interaction.clientId)
            }
            .mapToResultViewModel { _ in }
    }
}

/// Context of the interaction, could be from a product share, client outreach or pay by link
enum MKInteractionContext {
    case client360
    case productShare(productId: String)
    case payByLink(orderId: String)
    case curation(curationID: String)
    case consultation
}

extension CreateInteractionV2 {
    init?(interaction: OutreachInteractionCreation, context: MKInteractionContext) {
        let metaData: InteractionV2CreationMetadata = {
            switch context {
            case .client360, .consultation:
                return .interactionOutreachCreationMetadata(InteractionOutreachCreationMetadata(context: .outreachTemplate,
                                                                             templateId: interaction.templateId))
            case .productShare(let productId):
                return .interactionProductShareCreationMetadata(InteractionProductShareCreationMetadata(context: .productShare,
                                                                             productId: productId))
            case .payByLink(let orderId):
                return .interactionPayByLinkCreationMetadata(InteractionPayByLinkCreationMetadata(context: .paymentLink,
                                                                         paymentLinkId: orderId))
            case .curation(let curationID):
                return .interactionProductCuratorCreationMetadata(InteractionProductCuratorCreationMetadata(context: .productCurator,
                                                                                                            curationId: curationID,
                                                                                                            productIds: []))
            }
        }()

        guard let channel = InteractionChannel(interaction.channel) else {
            return nil
        }
        self.init(channel: channel,
                  clientId: interaction.clientId,
                  datetime: ISO8601DateTime(value: interaction.date),
                  metadata: metaData)
    }
}

extension InteractionChannel {
    init?(_ from: OutreachType) {
        switch from {
        // TODO: Fix this when the server has support for facetime
        case .call, .facetime:
            self = .phone
        case .sms:
            self = .sms
        case .email:
            self = .email
        case .whatsapp:
            self = .whatsApp
        case .wechat:
            self = .weChat
        case .kakao:
            self = .kakao
        case .line:
            self = .line
        case .lineWorks:
            return nil
        }
    }
}

extension InteractionContext {
    init(_ from: MKInteractionContext) {
        switch from {
        case .client360:
            self = .outreachTemplate
        case .productShare:
            self = .productShare
        case .payByLink:
            self = .paymentLink
        case .curation:
            self = .productCurator
        case .consultation:
            self = .virtualConsultation
        }
    }
}
