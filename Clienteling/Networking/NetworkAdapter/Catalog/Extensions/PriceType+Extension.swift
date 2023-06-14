// Copyright © 2022 LVMH. All rights reserved.

import MaisonKit

extension PriceType {
    static func getPrice(price: Price?, withDiscount: Bool = false) -> String? {
        guard let price = price else {
            return withDiscount ? nil : Localization.Strings.priceOnDemand
        }
        guard let priceValue = withDiscount ? price.discountValue : price.value else {
            return nil
        }
        return .price(CurrencyConvertable(fractionalUnitAmount: priceValue,
                                          numberOfFractionalUnitsInMonetaryUnit: price.divisor,
                                          currencyCode: price.currency))
    }

    static func getPrice(priceRange: MasterSummary.MasterSummaryPriceRange?, withDiscount: Bool = false) -> String? {
        guard let priceRange = priceRange else {
            return withDiscount ? nil : Localization.Strings.priceOnDemand
        }
        if withDiscount {
            return PriceType(masterSummaryDiscountedPriceRange: priceRange)?.toString()
        } else {
            return PriceType(masterSummaryPriceRange: priceRange)?.toString()
        }
    }
}

extension PriceType {
    init(masterDetailsPriceRange: MasterDetails.MasterDetailsPriceRange) {
        self.init(max: masterDetailsPriceRange.max, min: masterDetailsPriceRange.min)
    }

    init?(masterSummaryPriceRange: MasterSummary.MasterSummaryPriceRange) {
        // If we have a price range for both the value and discounted value, we only show
        // the discounted value, so this should return nil
        if let maxDiscount = masterSummaryPriceRange.max.discountValue,
            let minDiscount = masterSummaryPriceRange.min.discountValue,
           maxDiscount != minDiscount,
           masterSummaryPriceRange.max.value != masterSummaryPriceRange.min.value {
            return nil
        }
        self.init(max: masterSummaryPriceRange.max, min: masterSummaryPriceRange.min)
    }

    init?(masterSummaryDiscountedPriceRange: MasterSummary.MasterSummaryPriceRange) {
        self.init(discountMax: masterSummaryDiscountedPriceRange.max,
                  discountMin: masterSummaryDiscountedPriceRange.min)
    }

    init?(discountMax: Price, discountMin: Price) {
        guard let maxDiscount = discountMax.discountValue, let minDiscount = discountMin.discountValue else {
            return nil
        }
        if discountMax.discountValue == discountMin.discountValue {
            self = .price(.currency(CurrencyConvertable(fractionalUnitAmount: maxDiscount,
                                                        numberOfFractionalUnitsInMonetaryUnit: discountMax.divisor,
                                                        currencyCode: discountMax.currency), nil))
        } else {
            self = .priceRange(
                .currency(CurrencyConvertable(fractionalUnitAmount: minDiscount,
                                              numberOfFractionalUnitsInMonetaryUnit: discountMin.divisor,
                                              currencyCode: discountMin.currency)),
                .currency(CurrencyConvertable(fractionalUnitAmount: maxDiscount,
                                              numberOfFractionalUnitsInMonetaryUnit: discountMax.divisor,
                                              currencyCode: discountMax.currency)))
        }
    }

    init(max: Price, min: Price) {
        if max.value == min.value {
            self = .price(.currency(CurrencyConvertable(fractionalUnitAmount: max.value, numberOfFractionalUnitsInMonetaryUnit: max.divisor, currencyCode: max.currency), nil))
        } else {
            self = .priceRange(
                .currency(CurrencyConvertable(fractionalUnitAmount: min.value, numberOfFractionalUnitsInMonetaryUnit: min.divisor, currencyCode: min.currency)),
                .currency(CurrencyConvertable(fractionalUnitAmount: max.value, numberOfFractionalUnitsInMonetaryUnit: max.divisor, currencyCode: max.currency)))
        }
    }
}
