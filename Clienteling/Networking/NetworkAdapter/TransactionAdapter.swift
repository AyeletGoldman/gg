// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import Contacts
import SwiftUI

extension NetworkAdapter: TransactionAdapter {
    func getTransactionDetails(transactionId: String) -> AnyPublisher<Result<TransactionDetailsDisplayable, ErrorDisplayable>, Error> {
        return self.networking.transactionsControllerFindOneV2(transactionId: transactionId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
            return TransactionDetailsDisplayable(response)
        }
    }
}

extension TransactionDetailsDisplayable {
    init(_ transaction: TransactionV2) {
        let items = transaction.products.map(TransactionDetailsDisplayable.Item.init)
        let fields = transaction.additionalData.map { data -> OrderSectionField in
            let price = PriceType.price(.currency(CurrencyConvertable(fractionalUnitAmount: data.price.value,
                                                                      numberOfFractionalUnitsInMonetaryUnit: data.price.divisor,
                                                                      currencyCode: data.price.currency), nil)).toString()
            return OrderSectionField(title: "",
                                     subtitle: data.name,
                                     tag: price,
                                     onTap: nil)
        }

        let details: [AdditionalDetailsSection] = [
            .paymentInformation(fields: transaction.payments.compactMap { OrderSectionField(orderPayment: $0) }),
            .clientInformation(fields: [
                transaction.shippingAddress.map {
                    let postalAddress = CNMutablePostalAddress(address: $0)
                    return OrderSectionField.shippingAddress(address: postalAddress)
                },
                transaction.billingAddress.map {
                    let postalAddress = CNMutablePostalAddress(address: $0)
                    return OrderSectionField.billingAddress(address: postalAddress)
                }
            ].compactMap { $0 })
        ]
        
        let pricingData = TransactionDetailsDisplayable.buildPricingItems(from: transaction)

        self.init(header: TransactionDetailsDisplayable.Header(
            headline: TypedField(value: .datetime(transaction.datetime.value)),
            title: TypedField(value: .currency(CurrencyConvertable(fractionalUnitAmount: transaction.totalPrice.value,
                                                                   numberOfFractionalUnitsInMonetaryUnit: transaction.totalPrice.divisor,
                                                                   currencyCode: transaction.totalPrice.currency), nil)),
            quantity: transaction.products.count,
            status: nil,
            transactionReference: transaction.id,
            additionalInformation: [
                transaction.store.map { TypedField(value: .text(lines: [$0.name]), icon: "icon-location") },
                TypedField(value: .text(lines: [transaction.advisorName]), icon: "icon-associate")
            ].compactMap { $0 }),
                  items: items,
                  sectionFields: fields,
                  additionalDetails: details,
                  pricingDataView: !pricingData.isEmpty ? { PricingBreakdownView(items: pricingData, alignmentOption: .center) } : { Text("") }
        )
    }

    private static func buildPricingItems(from transaction: TransactionV2) -> [PricingItem] {
        let currencyFromPrice: (Price) -> CurrencyConvertable = { price in
            return CurrencyConvertable(fractionalUnitAmount: price.value,
                                       numberOfFractionalUnitsInMonetaryUnit: price.divisor,
                                       currencyCode: price.currency)
        }
        
        if !transaction.additionalData.isEmpty {
            let delivery = transaction.additionalData.filter{ $0.name == "DELIVERY" }
            return .items(subtotal: currencyFromPrice(transaction.subtotal),
                          taxes: currencyFromPrice(transaction.tax),
                          duties: currencyFromPrice(delivery[0].price),
                          total: currencyFromPrice(transaction.totalPrice))
        }
        else {
            return .items(subtotal: currencyFromPrice(transaction.subtotal),
                          taxes: currencyFromPrice(transaction.tax),
                          total: currencyFromPrice(transaction.totalPrice))
        }
    }
}

private extension OrderSectionField {
    init?(orderPayment: TransactionPayment) {
        var tag: String? = nil
        
        if let orderPayment = orderPayment.amount{
            tag = CurrencyConvertable(fractionalUnitAmount: orderPayment.value,
                                             numberOfFractionalUnitsInMonetaryUnit: orderPayment.divisor,
                                          currencyCode: orderPayment.currency).toString()
        }

        let paymentInformation: TransactionPaymentInformation? = orderPayment.paymentLink.map {
            TransactionPaymentInformation(status: orderPayment.status?.rawValue ?? "",
                                          paymentId: orderPayment.id,
                                          paymentLink: $0)
            
        }
        
        if let paymentInformation {
            self.init(title: MKLocalizedString("payment-information.pay-by-link.title", comment: "The title for pay by link"),
                      subtitle: orderPayment.datetime.map { DateFormatter.default.string(from: $0.value) },
                      tag: tag,
                      paymentInformation: paymentInformation)

        } else {
        self.init(date: orderPayment.datetime.map { DateFormatter.default.string(from: $0.value) },
                  tag: tag,
                  customPaymentInformation: CustomTransactionPaymentInformation(refundMethod: orderPayment.refundMethod ?? "",
                                                                                invoiceReference: orderPayment.invoiceReference ?? ""))
        }
    }
}

//extension MaisonKit.TransactionStatus {
//    init(orderStatus: TransactionStatus) {
//        switch orderStatus {
//        case .activated, .draft:
//            self = .pending
//        case .cancelled:
//            self = .expired
//        case .paid, .deliveryInProgress, .deliveredToStore, .deliveredToClient:
//            self = .paid
//        }
//    }
//}

private extension TransactionDetailsDisplayable.Item {
    init(orderItem: TransactionItemV2) {
        
        var specifications = orderItem.attributes.map { attr in
            LabeledValue(label: attr.displayName, value: MKLocalizedString(attr.displayValue ,comment: ""))
        }
        specifications.append(LabeledValue(label: "Quantity", value: String(orderItem.quantity)))
        
        self.init(id: orderItem.sku,
                  headline: orderItem.category.name,
                  title: orderItem.name,
                  tag: CurrencyConvertable(fractionalUnitAmount: orderItem.price.includingTax.value,
                                           numberOfFractionalUnitsInMonetaryUnit: orderItem.price.includingTax.divisor,
                                           currencyCode: orderItem.price.includingTax.currency).toString(),
                  specifications: specifications,
                  sku: orderItem.sku,
                  imageURL: orderItem.image)
    }
}

private extension CNMutablePostalAddress {
    convenience init(address: Address) {
        self.init()
        if let street = address.street {
            self.street = street
        }
        if let postCode = address.postalCode {
            self.postalCode = postCode
        }
        if let city = address.city {
            self.city = city
        }
        if let state = address.state {
            self.state = state
        }
        if let country = address.country {
            self.country = country
        }
    }
}
