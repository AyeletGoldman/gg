//
//  NPSAdapter.swift
//  Kenzo Clienteling
//
//  Created by ba-link on 24/05/2023.
//

import Foundation
import Combine
import MaisonKit
import StylableSwiftUI

extension NetworkAdapter: NPSAdapter {
    func fetchNPSDetails(npsID: String) -> AnyPublisher<Result<NPSDetailsDisplayable, ErrorDisplayable>, Error> {
        return self.networking.npsControllerFindOne(npsId: npsID)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { feedback in
                return NPSDetailsDisplayable(clientName: feedback.name,
                                             source: NPSEventSource(source: feedback.eventSource),
                                             clientID: feedback.client?.id,
                                             summary: feedback.comment,
                                             score: NPSScore(value: feedback.score.score,
                                                             maximumValue: feedback.score.maximumValue,
                                                             identifierVariant: feedback.score.stylistVariant),
                                             transactionDetails: TimelineItemDisplayable(feedbackDetails: feedback))
        }
    }

    func fetchNPSSurveyDetails(npsID: String) -> AnyPublisher<Result<NPSSurveyDetailsDisplayable, ErrorDisplayable>, Error> {
        return self.networking.npsControllerFindOne(npsId: npsID)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { feedback in
                return NPSSurveyDetailsDisplayable(answeredDate: feedback.datetime.value,
                                                   answers: feedback.answers.map {
                    NPSSurveyAnswer(question: $0.question,
                                    score: NPSScore(value: $0.score.score,
                                                    maximumValue: $0.score.maximumValue,
                                                    identifierVariant: $0.score.stylistVariant))
                })
        }
    }
}

extension NpsFeedbackAnswerScore {
    var stylistVariant: String? {
        switch self.color {
        case .red:
            return "1"
        case .amber:
            return "5"
        case .lightGreen:
            return "8"
        case .darkGreen:
            return "10"
        }
    }
}

extension NPSEventSource {
    init(source: NpsEventSource) {
        switch source {
        case .sourceEventEcomm(let ecomSource):
            switch ecomSource.type {
            case .postDelivery:
                self = .postWebDelivery
            case .postPayment:
                self = .postWebPayment
            }
        case .sourceEventInstore:
            self = .inStorePayment
        }
    }
}

extension NpsEventSource {
    var websiteAddress: String? {
        switch self {
        case .sourceEventEcomm(let ecomSource):
            return ecomSource.name
        case .sourceEventInstore:
            return nil
        }
    }

    var advisorName: String? {
        switch self {
        case .sourceEventEcomm:
            return nil
        case .sourceEventInstore(let event):
            return event.advisor.name
        }
    }

    var storeName: String? {
        switch self {
        case .sourceEventEcomm:
            return nil
        case .sourceEventInstore(let event):
            return event.store.name
        }
    }
}

extension TimelineItemDisplayable {
    init?(feedbackDetails: NpsFeedbackDetails) {
        guard let order = feedbackDetails.order else { return nil }
        let storeName = order.store?.name ?? feedbackDetails.eventSource.storeName
        if let storeName {
            self = .inStoreTransactionItem(id: UUID().uuidString,
                                           filterId: .transaction,
                                           date: order.datetime.value,
                                           totalAmount: CurrencyConvertable(fractionalUnitAmount: order.totalPrice.value,
                                                                            numberOfFractionalUnitsInMonetaryUnit: order.totalPrice.divisor,
                                                                            currencyCode: order.totalPrice.currency),
                                           advisorName: feedbackDetails.eventSource.advisorName ?? "",
                                           storeName: storeName,
                                           productImages: order.products.compactMap { $0.image }.map { .url($0) },
                                           shouldPresentDetailsPage: false)
        } else {
            self = .virtualTransactionItem(id: UUID().uuidString,
                                           filterId: .transaction,
                                           date: order.datetime.value,
                                           websiteAddress: feedbackDetails.eventSource.websiteAddress ?? "",
                                           totalAmount: CurrencyConvertable(fractionalUnitAmount: order.totalPrice.value,
                                                                            numberOfFractionalUnitsInMonetaryUnit: order.totalPrice.divisor,
                                                                            currencyCode: order.totalPrice.currency),
                                           productImages: order.products.compactMap { $0.image }.map { .url($0) })
        }
    }
}
