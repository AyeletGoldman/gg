// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct ProductListCellView: View {

    private enum Constants {
        static let numberOfColorsToDisplay = 5
    }

    private enum Labels {
        static let additionalColorsFormat = MKLocalizedString("product-list.cell.additional-colors.format",
                                                              comment: "The format to use when too many colors are available and we have to show a number instead of the colors.")
    }

    public let cellDisplayable: ProductListCellDisplayable

    public init(cellDisplayable: ProductListCellDisplayable) {
        self.cellDisplayable = cellDisplayable
    }

    public var body: some View {
        StylableGroup("product[list]") {
            HStack(alignment: .top, spacing: 15) {
                self.buildImageAndStockSection()
                VStack(alignment: .leading, spacing: 8) {
                    self.buildCategoryAndTitleSection()
                    if let body = self.cellDisplayable.body {
                        Text(verbatim: body)
                            .style("body")
                    }
                    self.buildInfoTableSection()
                    Spacer()
                    if !self.cellDisplayable.availableColors.isEmpty {
                        self.buildColorSection()
                    }
                    self.buildPricingSection(price: self.cellDisplayable.price, salePrice: self.cellDisplayable.salePrice)
                }
                Spacer(minLength: 0)
            }
        }
    }

    @ViewBuilder
    private func buildColorSection() -> some View {
        StylableGroup("color") {
            HStack(alignment: .top, spacing: 5) {
                ForEach(0..<self.cellDisplayable.availableColors.prefix(Constants.numberOfColorsToDisplay).count, id: \.self) { index in
                    self.buildAvailableColorView(at: index)
                }
                if self.cellDisplayable.availableColors.count > Constants.numberOfColorsToDisplay {
                    StylableGroup("info") {
                        Text(String(format: Labels.additionalColorsFormat,
                                    "\(self.cellDisplayable.availableColors.count - Constants.numberOfColorsToDisplay)"))
                            .style("title")
                    }
                }
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func buildAvailableColorView(at index: Int) -> some View {
        StylableGroup("color-item") {
            self.cellDisplayable.availableColors[index].makeBody()
                .frame(width: 16, height: 16)
                .style("background")
                .eraseToAnyView()
        }
    }

    @ViewBuilder
    private func buildImageAndStockSection() -> some View {
        MaisonKitImage(source: self.cellDisplayable.image)
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 120)
            .setProductAvailability(self.cellDisplayable.availability)
            .style("image/background")
            .unredacted()
    }

    @ViewBuilder
    private func buildCategoryAndTitleSection() -> some View {
        VStack(alignment: .leading) {
            Text(verbatim: self.cellDisplayable.title).style("title")
            if let caption = self.cellDisplayable.subtitle {
                Text(verbatim: caption).style("subtitle")
            }
        }
    }

    @ViewBuilder
    private func buildInfoTableSection() -> some View {
        StylableGroup("info") {
            LabeledValueView(values: self.cellDisplayable.properties)
        }
    }
}

struct ProductListCellViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        ProductListCellView(cellDisplayable: ProductListCellDisplayable.previewData)
            .inAllModes()
    }
}

private extension ProductListCellDisplayable {
    static var previewData: ProductListCellDisplayable {
        return .product(ProductSummaryDisplayable(productId: "123",
                                                  masterId: "321",
                                                  sku: "123-012",
                                                  image: .loadingPlaceholder,
                                                  properties: [
                                                    ProductSummaryProperty(label: "Gem", value: "Sapphire"),
                                                    ProductSummaryProperty(label: "Material", value: "Leather"),
                                                    ProductSummaryProperty(label: "Collection", value: "Chance Infinie")
                                                  ],
                                                  subtitle: "Title caption",
                                                  price: "£21.32",
                                                  body: "A smaller text beneath the title",
                                                  title: "Product name usually",
                                                  availability: ProductAvailability(displayName: "Testing")))
    }
}
