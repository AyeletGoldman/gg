// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This Scene creates and configures a `TransactionDetailsViewController`
struct TransactionDetailsScene: Scene {

    /// The ID of the transaction we want to present the details for
    let transactionId: String
    /// A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    let onClose: ((UIViewController) -> Void)?

    /// Creates a new `TransactionDetailsScene`.
    /// - Parameter transactionId: The ID of the transaction we want to present the details for
    /// - Parameter onClose: A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    public init(transactionId: String, onClose: ((UIViewController) -> Void)? = nil) {
        self.transactionId = transactionId
        self.onClose = onClose
    }

    func createViewController() -> TransactionDetailsViewController {
        return TransactionDetailsViewController()
    }

    func configure(controller: TransactionDetailsViewController,
                   using factory: SceneFactory) {
        controller.viewModel = TransactionDetailsViewModel(transactionId: self.transactionId)
        self.onClose.map { onClose in
            controller.onClose = { [weak controller] in
                guard let controller else { return }
                onClose(controller)
            }
        }
    }
}
