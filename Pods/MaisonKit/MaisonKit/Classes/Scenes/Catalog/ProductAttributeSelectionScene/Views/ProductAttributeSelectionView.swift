// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductAttributeSelectionView: View {

    private enum Labels {
        static let emptyAttributeItemsTitle = MKLocalizedString("product-details.attributes.selection.empty.title",
                                                                comment: "The title to show for empty attribute items in product details attribute selection screen")
        static let emptyAttributeItemsSubtitle = MKLocalizedString("product-details.attributes.selection.empty.subtitle",
                                                                   comment: "The subtitle to show for empty attribute items in product details attribute selection screen")
    }

    @ObservedObject private var viewModel: ProductAttributeSelectionViewModel

    init(viewModel: ProductAttributeSelectionViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ResultStateViewBuilder(result: self.viewModel.otherSelectedAttributes)
                .setLoadingView {
                    self.buildSelectionSheetHeaderButtons(attributes: .loadingItems)
                }
                .buildContent { otherAttributes in
                    if !otherAttributes.isEmpty && self.viewModel.shouldShowExternalAttributeRemoval {
                        self.buildSelectionSheetHeaderButtons(attributes: otherAttributes)
                    }
                }
            ResultStateViewBuilder(result: self.viewModel.options)
                .setEmptyView {
                    AuxiliaryView(viewModel: self.getEmptyAttributeItemsViewModel())
                }
                .setLoadingView {
                    self.buildSelectionList(items: .loadingItems)
                }
                .buildContent { items in
                self.buildSelectionList(items: items)
            }

        }
        .style("background")
    }

    @ViewBuilder
    private func buildSelectionList(items: [ProductAttributeItem]) -> some View {
        SelectionListView(items: items,
                          selection: self.$viewModel.selectedAttributeItemId,
                          rowStylistIdentifier: "input",
                          shouldShowToolbar: self.viewModel.shouldShowToolbar) { item in
            SelectionListItemView(item: item)
        }.environment(\.editMode, .constant(.active))
    }

    @ViewBuilder
    private func buildSelectionSheetHeaderButtons(attributes: [SelectedAttributePair]) -> some View {
        AttributeCloudView(attributePairs: attributes,
                           onSelect: { pair in
            self.viewModel.removeOtherAttribute(attribute: pair.attribute)
        }).padding(.top)
    }

    private func getEmptyAttributeItemsViewModel() -> AuxiliaryViewModel {
        return AuxiliaryViewModel(imageSource: .styledImage(identifier: "icon-fail-out-of-stock"),
                                  title: Labels.emptyAttributeItemsTitle,
                                  subtitle: String(format: Labels.emptyAttributeItemsSubtitle, self.viewModel.title))
    }
}

private extension Array where Element == SelectedAttributePair {
    static var loadingItems: Self {
        return [
            (
                ProductAttributes.Attribute(id: UUID().uuidString, title: "Attribute", row: .nestedList(items: [], isShownInCollapsedMode: false)),
                ProductAttributes.AttributeValue(id: UUID().uuidString, title: "Value")
            ),
            (
                ProductAttributes.Attribute(id: UUID().uuidString, title: "Attribute", row: .nestedList(items: [], isShownInCollapsedMode: false)),
                ProductAttributes.AttributeValue(id: UUID().uuidString, title: "Value")
            ),
            (
                ProductAttributes.Attribute(id: UUID().uuidString, title: "Attribute", row: .nestedList(items: [], isShownInCollapsedMode: false)),
                ProductAttributes.AttributeValue(id: UUID().uuidString, title: "Value")
            )
        ]
    }
}

private extension Array where Element == ProductAttributeItem {
    static var loadingItems: [SelectionListItem] {
        (0..<20).map { _ in return .init(id: UUID().uuidString, title: "Selection Item") }
    }
}
