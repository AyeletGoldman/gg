// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import MaisonKitUI

struct ProductAttributesView: View {

    private enum Labels {
        static let expandLabelTitle = MKLocalizedString("product.attributes.expand-cta.title",
                                                        comment: "The title of the label in a product attributes view that will expand the content to its full height")
        static let contractLabelTitle = MKLocalizedString("product.attributes.contract-cta.title",
                                                          comment: "The title of the label in a product attributes view that will contract the content to its collapsed mode")
    }

    private let attributes: [ProductAttributes.Attribute]
    private let attributeRows: ProductAttributeRows
    private let isLoading: Bool
    private let isCollapsable: Bool
    private let allowsDeselection: Bool
    @State private var isCollapsed: Bool = false
    @Binding var selectedAttributesValues: SelectedProductAttributes
    private let presentAttributeItemsSelection: (ProductAttributes.Attribute) -> Void

    init(attributes: [ProductAttributes.Attribute],
         attributeRows: ProductAttributeRows,
         isLoading: Bool,
         isCollapsable: Bool = false,
         allowsDeselection: Bool = true,
         selectedAttributesValues: Binding<SelectedProductAttributes>,
         presentAttributeItemsSelection: @escaping (ProductAttributes.Attribute) -> Void) {
        self.attributes = attributes
        self.attributeRows = attributeRows
        self.isLoading = isLoading
        self.isCollapsable = isCollapsable
        self.isCollapsed = isCollapsable
        self._selectedAttributesValues = selectedAttributesValues
        self.presentAttributeItemsSelection = presentAttributeItemsSelection
        self.allowsDeselection = allowsDeselection
    }

    private func shouldShow(_ attribute: ProductAttributes.Attribute) -> Bool {
        guard self.isCollapsable else { return true }
        guard self.isCollapsed else { return true }

        return self.attributeRows[attribute.id]?.isShownInCollapsedMode == true
    }

    private func heightForAttribute(_ attribute: ProductAttributes.Attribute) -> CGFloat? {
        return self.shouldShow(attribute) ? nil : 0
    }

    private func hasAtLeastOneCollapsableElement() -> Bool {
        for attribute in self.attributes where self.attributeRows[attribute.id]?.isShownInCollapsedMode == false {
            return true
        }
        return false
    }

    private func onCTATapped() {
        withAnimation(.easeOut) {
            self.isCollapsed.toggle()
        }
    }

    var body: some View {
        FormGroup {
            VStack(spacing: 0) {
                ForEach(self.attributes) { attribute in
                    self.buildAttributeRow(attribute: attribute)
                        .frame(height: self.heightForAttribute(attribute))
                        .disabled(!self.shouldShow(attribute))
                        .clipped()
                }
                if self.isCollapsable && self.hasAtLeastOneCollapsableElement() {
                    FormField(padding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10), showDivider: false) {
                        // Use a ZStack so that changing the text value does not break animations
                        ZStack {
                            FormTypeCallToAction(title: Labels.expandLabelTitle,
                                                 icon: .styledImage(identifier: "icon-up"),
                                                 onTap: self.onCTATapped)
                            .disabled(!self.isCollapsed)
                            .hidden(!self.isCollapsed)
                            FormTypeCallToAction(title: Labels.contractLabelTitle,
                                                 icon: .styledImage(identifier: "icon-down"),
                                                 onTap: self.onCTATapped)
                            .disabled(self.isCollapsed)
                            .hidden(self.isCollapsed)
                        }.clipped()
                    }
                }
            }
            .style("background")
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func buildAttributeRow(attribute: ProductAttributes.Attribute) -> some View {
        self.attributeRows[attribute.id]?.makeBody(attribute: attribute,
                                                   selectedAttributes: self.createBinding(),
                                                   presentAttributeItemsSelection: self.presentAttributeItemsSelection,
                                                   isLoading: self.isLoading)
        .eraseToAnyView()
        .allowsHitTesting(!self.isLoading)
    }

    private func createBinding() -> Binding<SelectedProductAttributes> {
        if self.allowsDeselection {
            return self.$selectedAttributesValues
        } else {
            return Binding {
                self.selectedAttributesValues
            } set: { newValue in
                if newValue.keys.count < self.selectedAttributesValues.keys.count {
                    return
                }
                self.selectedAttributesValues = newValue
            }
        }
    }
}
