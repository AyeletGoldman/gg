// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import Combine

struct ProductDetailsView: View {

    private enum Labels {
        static let similarProductsButtonTitle = MKLocalizedString("product-details.similar-products.button.title",
                                                                  comment: "The title of the similar products button")
    }

    @ObservedObject private var viewModel: ProductDetailsViewModel
    @Environment(\.isModalPresentationStyle) private var isPresentedModally
    @EnvironmentObject var webStylist: WebStylist

    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultStateViewBuilder(result: self.viewModel.detailsDisplayable)
            .setErroredAction(ButtonData(label: GeneralErrorLabel.retryButtonTitle,
                                         icon: "icon-retry",
                                         action: {
                self.viewModel.fetchProductDetails()
            }))
        // Show the loading state, with a spinner in the toolbar
            .setLoadingView {
                self.buildMainView(displayable: ProductDetailsDisplayable.loadingState,
                                   accordionExpandedResolver: { _ in return .constant(false) })
            }.buildContent { detailsDisplayable in
                self.buildMainView(displayable: detailsDisplayable,
                                   accordionExpandedResolver: self.defaultAccordionExpandedResolver)
            }.style("background")
            .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }

    @ViewBuilder
    private func buildMainView(displayable: ProductDetailsDisplayable,
                               accordionExpandedResolver: @escaping (Int) -> Binding<Bool>) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ProductImageCarousel(imageDisplayable: displayable.context.mediaItems, availability: displayable.context.availability)
                ProductInfoView(title: displayable.context.title,
                                subtitle: displayable.context.subtitle,
                                price: displayable.context.price,
                                salePrice: displayable.context.salePrice,
                                productId: displayable.context.id)
                if let attributes = displayable.context.attributes {
                    ProductAttributesView(attributes: attributes.attributes,
                                          attributeRows: attributes.attributes.reduce([:], { acc, next in
                        var acc = acc
                        acc[next.id] = next.row
                        return acc
                    }),
                                          isLoading: self.viewModel.isLoadingAttributes,
                                          selectedAttributesValues: self.$viewModel.selectedAttributesValues,
                                          presentAttributeItemsSelection: self.viewModel.presentAttributeItemsSelection)
                }
                self.buildStockView(displayable: displayable)
                Group {
                    if !self.viewModel.availableActions.pageVerticalActions.isEmpty {
                        self.buildVerticalActions(actions: self.viewModel.availableActions.pageVerticalActions)
                    }
                    if !self.viewModel.availableActions.pageHorizontalActions.isEmpty {
                        self.buildHorizontalActions(actions: self.viewModel.availableActions.pageHorizontalActions)
                    }
                }
                .padding(.horizontal)
                .addStyledRowDivider()
                ProductDetailsAccordion(items: self.viewModel.injectCssIfNeeded(into: displayable.context.informationItems, cssString: self.webStylist.themedCSSString),
                                        expandedResolver: accordionExpandedResolver)
                Spacer()
            }
        }
    }

    private func defaultAccordionExpandedResolver(_ index: Int) -> Binding<Bool> {
        return self.$viewModel.openedInformationItems[index]
    }

    @ViewBuilder
    private func buildStockView(displayable: ProductDetailsDisplayable) -> some View {
        if displayable.context.stockInformationType.showSummary {
            ProductStockInformationView(viewType: displayable.context.isProduct ? .product : .master,
                                        stockDetails: self.viewModel.stockDetails,
                                        privacyMode: self.$viewModel.privacyMode,
                                        refreshStockFunc: self.viewModel.fetchProductStockIfNeeded)
            .padding(.bottom, 9)
        }
    }

    private func getButtonData(of action: ContextualAction, showIcon: Bool = true) -> ButtonData {
        return ButtonData(
            label: action.localizedTitle,
            icon: showIcon ? action.imageIdentifier : nil,
            isEnabled: action.isEnabled,
            action: {
                self.viewModel.handleActionTypeAction(action: action)
            })
    }

    @ViewBuilder
    private func buildVerticalActions(actions: [ButtonAction]) -> some View {
        ForEach(0..<actions.count, id: \.self) { index in
            StyledButton.fullWidthPaddedButton(data: self.getButtonData(of: actions[index].action, showIcon: false),
                                               style: actions[index].buttonIdentifier)
        }
        .padding(.bottom, 9)
    }

    @ViewBuilder
    private func buildHorizontalActions(actions: [MenuAction]) -> some View {
        HStack {
            ForEach(0..<actions.count, id: \.self) { index in
                self.buildHorizontalButton(buttonData: self.getButtonData(of: actions[index]),
                                           disabled: !actions[index].isEnabled)
                .frame(maxWidth: .infinity)
            }
        }
    }

    @ViewBuilder
    private func buildHorizontalButton(buttonData: ButtonData, disabled: Bool) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-icon-center", variant: disabled ? "disabled" : nil)) {
            Button(action: buttonData.action) {
                VStack {
                    if let imageIdentifier = buttonData.icon {
                        MaisonKitImage(source: .styledImage(identifier: imageIdentifier))
                            .frame(width: 20, height: 20)
                    }
                    Text(verbatim: buttonData.label)
                        .style("title")
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
            }
            .style("background")
        }
    }
}

// MARK: - Loading states
private extension ProductDetailsDisplayable {
    static let loadingState: Self = {
        let context = ProductDetailsContext.master(
            ProductMasterDetailsData(
                id: UUID().uuidString,
                title: "Chance Infinie",
                subtitle: "Bracelets",
                price: .price(CurrencyConvertable(fractionalUnitAmount: 300, numberOfFractionalUnitsInMonetaryUnit: 1, currencyCode: "EUR")),
                salePrice: nil,
                informationItems: .buildLoadingStateInformation(),
                mediaItems: HeroCarouselItems(heroImageIndex: 0,
                                              carouselItems: Array(repeating: .image(source: .loadingPlaceholder), count: 6)),
                attributes: ProductAttributes(attributes: [])
            ))
        return ProductDetailsDisplayable(context: context)
    }()
}

extension Array where Element == ProductInformationItem {
    static func buildLoadingStateInformation() -> [ProductInformationItem] {
        return (0..<3).map {
            // swiftlint:disable line_length
            ProductInformationItem(title: "Title \($0)",
                                   content: .text("""
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed risus nibh, laoreet et dictum ac, condimentum ut sem. In ornare ipsum lobortis elit mollis consequat. Integer metus quam, convallis id risus non, consequat luctus ipsum. Duis sagittis congue lacus. Duis vel lorem augue. Vestibulum quam turpis, pharetra eget pellentesque a, tristique vitae dolor. Sed egestas magna mattis lacinia tristique. Duis hendrerit vitae lectus ut pretium. Ut hendrerit, purus ullamcorper rutrum semper, ex massa condimentum enim, at imperdiet velit ligula et leo. Aliquam et mattis ante, et consequat sem. Phasellus lectus est, efficitur at orci eget, sollicitudin sollicitudin magna. Proin egestas sollicitudin sem, ac ultrices risus.
                """))
        }
    }
}

extension StockInformationType {
    var showSummary: Bool {
        switch self {
        case .onlySummary, .summaryAndDetails:
            return true
        default:
            return false
        }
    }
}
