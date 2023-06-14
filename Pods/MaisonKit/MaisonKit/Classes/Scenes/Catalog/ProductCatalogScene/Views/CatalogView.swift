// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

/// A view that shows the state of product category rows and decide what view supposed to be shown next based  on CatalogScreenType
struct CatalogView: View {

    private enum Constants {
        static let horizontalPadding: CGFloat = 16
    }

    @ObservedObject private var viewModel: CatalogViewModel

    init(viewModel: CatalogViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultStateViewBuilder(result: self.viewModel.productCategories)
            .setErroredAction(ButtonData(label: GeneralErrorLabel.retryButtonTitle,
                                         icon: "icon-retry",
                                         action: {
                                            self.viewModel.fetchProductCategories(force: true)
                                         }))
            .setLoadingView {
                self.buildMainView(productCategories: ProductCategoriesScreenDisplayable.loadingDisplayable)
            }
            .buildContent(self.buildMainView)
            .style("background")
    }

    @ViewBuilder
    private func buildMainView(productCategories: ProductCategoriesScreenDisplayable) -> some View {
        VStack(spacing: 0) {
            switch productCategories.listType {
            case .text(let items):
                self.buildTextItems(items: items)
            case .custom(let rows):
                self.buildCustomRows(rows: rows)
            }

            if Features.manager.isEnabled(.displayAllProductsButton, defaultValue: false) {
                PrimaryButton(buttonData: ButtonData(label: self.viewModel.displayAllProductsButtonTitle,
                                                     action: self.viewModel.displayProductList))
                .padding([.horizontal, .bottom])
            }
        }
    }

    @ViewBuilder
    private func buildTextItems(items: [TextOnlyProductCategory]) -> some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(items) { item in
                    Button(action: {
                        self.viewModel.didTapCategory(item)
                    }, label: {
                        ListItemView(title: item.title)
                            .stackWithAccessory()
                            .styleAsListRow(includeDivider: true)
                    })
                }
            }.padding(.top)
        }
    }

    @ViewBuilder
    private func buildCustomRows(rows: [CustomProductCategoryRow]) -> some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ForEach(0 ..< rows.count, id: \.self) { index in
                        rows[index].makeBody(
                            geoWidth: geo.size.width - Constants.horizontalPadding*2,
                            onSelectCategory: { item in
                                self.viewModel.didTapCategory(item)
                            }
                        )
                    }
                }
                .padding(.horizontal, Constants.horizontalPadding)
                .padding(.top)
            }
        }
    }
}

extension ProductCategoriesScreenDisplayable {
    static let loadingDisplayable = ProductCategoriesScreenDisplayable(listType: .loadingDisplayable)
}

extension ProductCategoriesScreenDisplayable.ListType {
    static var loadingDisplayable: ProductCategoriesScreenDisplayable.ListType {
        .text((0..<20).map { _ in return TextOnlyProductCategory(id: UUID().uuidString,
                                                                 title: "Title",
                                                                 nextScreen: .categories) })
    }
}
