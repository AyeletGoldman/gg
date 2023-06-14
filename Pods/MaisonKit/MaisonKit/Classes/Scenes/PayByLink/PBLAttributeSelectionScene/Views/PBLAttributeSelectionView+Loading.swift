// Copyright © 2022 LVMH. All rights reserved.

import Foundation

extension PBLProductInformationDisplayable {
    static var loading: PBLProductInformationDisplayable {
        PBLProductInformationDisplayable(masterId: "masterId",
                                         productId: "productId",
                                         productName: "Product name",
                                         price: "£123.21",
                                         attributes: ProductAttributes.loading)
    }
}

extension ProductAttributes {
    static var loading: ProductAttributes {
        return ProductAttributes(attributes: [
            ProductAttributes.Attribute(id: "color",
                                        title: "Color",
                                        row: .nestedList(items: [], isShownInCollapsedMode: false)),
            ProductAttributes.Attribute(id: "gem",
                                        title: "Gem",
                                        row: .nestedList(items: [], isShownInCollapsedMode: false))
        ],
                                 selectedAttributes: [
                                    "gem": ProductAttributes.AttributeValue(id: "gem1", title: "Gem 1"),
                                    "color": ProductAttributes.AttributeValue(id: "color1", title: "Color 1")])
    }
}
