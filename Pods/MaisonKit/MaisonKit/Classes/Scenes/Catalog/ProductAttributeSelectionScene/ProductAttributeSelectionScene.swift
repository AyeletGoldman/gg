// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

struct ProductAttributeSelectionScene: Scene {

    private let masterId: String
    private let attribute: ProductAttributes.Attribute
    private let otherSelectedAttributes: SelectedProductAttributes
    private let initiallySelectedItemID: String?
    private let shouldShowToolbar: Bool

    private let onUpdate: ((ProductAttributeItem.ID?) -> Void)?
    private let onSelectedAttributeRemoved: ((ProductAttributes.Attribute.ID) -> Void)?
    private let onDone: ((ProductAttributeItem.ID?, UIViewController) -> Void)?
    private let onCancel: ((UIViewController) -> Void)?

    init(masterId: String,
         attribute: ProductAttributes.Attribute,
         otherSelectedAttributes: SelectedProductAttributes,
         initiallySelectedItemID: String? = nil,
         shouldShowToolbar: Bool = true,
         onCancel: ((UIViewController) -> Void)? = nil,
         onSelectedAttributeRemoved: ((ProductAttributes.Attribute.ID) -> Void)? = nil,
         onDone: ((ProductAttributeItem.ID?, UIViewController) -> Void)? = nil,
         onUpdate: ((ProductAttributeItem.ID?) -> Void)? = nil) {
        self.masterId = masterId
        self.attribute = attribute
        self.otherSelectedAttributes = otherSelectedAttributes
        self.initiallySelectedItemID = initiallySelectedItemID
        self.shouldShowToolbar = shouldShowToolbar
        self.onUpdate = onUpdate
        self.onSelectedAttributeRemoved = onSelectedAttributeRemoved
        self.onDone = onDone
        self.onCancel = onCancel
    }

    func createViewController() -> ProductAttributeSelectionViewController {
        return ProductAttributeSelectionViewController()
    }

    func configure(controller: ProductAttributeSelectionViewController,
                   using factory: SceneFactory) {
        let onCancel = self.onCancel.map { onCancel in
            return { [weak controller] in
                guard let controller = controller else { return }
                onCancel(controller)
            }
        }

        let onDone: ((ProductAttributeItem.ID?) -> Void)? = self.onDone.map { onDone in
            return { [weak controller] selectedItemId in
                guard let controller = controller else { return }
                onDone(selectedItemId, controller)
            }
        }

        let viewModel = ProductAttributeSelectionViewModel(masterId: self.masterId,
                                                           attribute: self.attribute,
                                                           otherSelectedAttributes: self.otherSelectedAttributes,
                                                           initiallySelectedItemID: self.initiallySelectedItemID,
                                                           shouldShowToolbar: self.shouldShowToolbar,
                                                           onCancel: onCancel,
                                                           onSelectedAttributeRemoved: self.onSelectedAttributeRemoved,
                                                           onDone: onDone,
                                                           onUpdate: self.onUpdate)
        controller.viewModel = viewModel
    }
}
