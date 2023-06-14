// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MaisonKit
import Combine
import Moya

extension NetworkAdapter: ProductShareAdapter {

    func getProductShareClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        return self.getClientOutreachChannels(clientID: clientID, channelTypes: [.text])
    }

    func getTemplates(productIds: [String], clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error> {
        let templatesPublisher = self.networking.templatesControllerFindAll(category: .productShare)
            .unwrapDefaultSuccessResponse()
            .mapError { $0 }
        let clientPlaceholderFieldsPublisher = self.getClientPlaceholderFieldsPublisher(clientId: clientId)
        let productPlaceholderFieldsPublisher = self.getProductsPlaceholderFieldsPublisher(productIds: productIds)

        return Publishers.Zip3(templatesPublisher,
                               clientPlaceholderFieldsPublisher,
                               productPlaceholderFieldsPublisher)
        .map { (templatesResponse, clientPlaceholderFields, productPlaceholderFields) -> Result<TemplatesDisplayable, ErrorDisplayable> in
            let placeholderFields = clientPlaceholderFields + productPlaceholderFields + self.getUserPlaceholderFields()
            return .success(TemplatesDisplayable(templatesResponse.data.result, placeholders: placeholderFields))
        }
        .eraseToAnyPublisher()
    }
    
    func getTemplates2(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error> {
        let templatesPublisher = self.networking.templatesControllerFindAll(category: .outreach).unwrapDefaultSuccessResponse()
        let clientPlaceholderFieldsPublisher = self.getClientPlaceholderFieldsPublisher(clientId: clientId)

        return Publishers.Zip(templatesPublisher, clientPlaceholderFieldsPublisher)
            .map { (tempaltesResponse, clientPlaceholderFields) -> TemplatesDisplayable in
                let placeholderFields = clientPlaceholderFields + self.getUserPlaceholderFields()
                return TemplatesDisplayable(tempaltesResponse.data.result, placeholders: placeholderFields)
            }
            .eraseToAnyPublisher()
            .mapToResultViewModel { response in
                return response
            }
    }
    
    func getProductsPlaceholderFields(productIds: [String]) -> [TemplatePlaceholder] {
        let productPlaceholders = { (productId: String) -> [TemplatePlaceholder] in
            let images = ["https://source.unsplash.com/random/200x200",
                          "https://source.unsplash.com/random/200x200"]
            return [
                TemplatePlaceholder.replace(placeholder: "{@Product.Id}", replaceWith: productId),
                TemplatePlaceholder.replaceRepeat(repeatPrefix: "<@ProductImages:",
                                                  repeatSufix: ":ProductImages@>",
                                                  placeholders: images.map { product in
                                                      return [
                                                        TemplatePlaceholder.replace(placeholder: "{@Product.ImageUrl}",
                                                                                    replaceWith: product)
                                                      ]})
            ]
        }
        return [
            TemplatePlaceholder.replaceRepeat(repeatPrefix: "<@Products:",
                                              repeatSufix: ":Products@>",
                                              placeholders: productIds.map(productPlaceholders))
        ]
    }

    func createInteraction(interaction: OutreachInteractionCreation, productIds: [String]) -> VoidResultPublisher {
            return self.createInteraction(interaction: interaction, context: .productShare(productId: productIds.first!))
    }

    func getProductsPlaceholderFieldsPublisher(productIds: [String]) -> AnyPublisher<[TemplatePlaceholder], Error> {
        return self.networking.getProductsV1ProductsProductIdsOrUpcs(productIdsOrUpcs: productIds,
                                                                     shopId: Self.currentStoreCode,
                                                                     currencyCode: Self.currentCurrencyCode,
                                                                     ignoreNotFoundErrors: false,
                                                                     attributes: nil,
                                                                     acceptLanguage: self.currentAcceptLanguageHeaderValue)
        .unwrapDefaultSuccessResponse()
        .map { details in
            return [
                TemplatePlaceholder.replaceRepeat(repeatPrefix: "<@Products:", repeatSufix: ":Products@>", placeholders: details.products.map { product in
                    return [
                        TemplatePlaceholder.replace(placeholder: "{@Product.Name}", replaceWith: product.productName),
                        TemplatePlaceholder.replace(placeholder: "{@Product.SKU}", replaceWith: product.sku ?? Localization.Strings.notAvailable),
                        TemplatePlaceholder.replace(placeholder: "{@Product.Reference}", replaceWith: product.reference),
                        TemplatePlaceholder.replace(placeholder: "{@Product.Price}", replaceWith: product.price ?? Localization.Strings.notAvailable),
                        TemplatePlaceholder.replace(placeholder: "{@Product.Currency}", replaceWith: product.currency ?? Localization.Strings.notAvailable),
                        TemplatePlaceholder.replaceRepeat(repeatPrefix: "<@ProductImages:", repeatSufix: ":ProductImages@>", placeholders: product.images.map { product in
                            return [
                                TemplatePlaceholder.replace(placeholder: "{@Product.ImageUrl}", replaceWith: product)
                            ]})
                    ]})
            ]
        }.eraseToAnyPublisher()
    }
}

extension ProductsDetailsResult.ProductsDetailsResultProducts {

    var productName: String {
        switch self {
        case .masterDetails(let masterDetails):
            return masterDetails.name
        case .productDetails(let productDetails):
            return productDetails.name
        }
    }

    var sku: String? {
        switch self {
        case .masterDetails:
            return nil
        case .productDetails(let productDetails):
            return productDetails.sku
        }
    }

    var reference: String {
        switch self {
        case .masterDetails(let masterDetails):
            return masterDetails.id
        case .productDetails(let productDetails):
            return productDetails.id
        }
    }

    var images: [String] {
        switch self {
        case .masterDetails(let masterDetails):
            return masterDetails.images
        case .productDetails(let productDetails):
            return productDetails.images
        }
    }

    var currency: String? {
        switch self {
        case .masterDetails(let masterDetails):
            return masterDetails.priceRange?.min.currency
        case .productDetails(let productDetails):
            return productDetails.price?.currency
        }
    }

    var price: String? {
        switch self {
        case .masterDetails(let masterDetails):
            guard let priceRange = masterDetails.priceRange else {
                return nil
            }
            let min = CurrencyConvertable(fractionalUnitAmount: priceRange.min.value,
                                          numberOfFractionalUnitsInMonetaryUnit: priceRange.min.divisor,
                                          currencyCode: priceRange.min.currency).toString()
            let max = CurrencyConvertable(fractionalUnitAmount: priceRange.max.value,
                                          numberOfFractionalUnitsInMonetaryUnit: priceRange.max.divisor,
                                          currencyCode: priceRange.max.currency).toString()
            if priceRange.min.value == priceRange.max.value {
                return min
            } else {
                return "\(min) - \(max)"
            }
        case .productDetails(let productDetails):
            guard let productPrice = productDetails.price else {
                return nil
            }
            return CurrencyConvertable(fractionalUnitAmount: productPrice.value,
                                       numberOfFractionalUnitsInMonetaryUnit: productPrice.divisor,
                                       currencyCode: productPrice.currency).toString()
        }
    }
}

