// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A scene for the pay by link create order screen.
/// Usually used to display a "basket" to the user where they can edit quantities before creating the order.
public struct PBLCreateOrderScene: Scene {

    private let data: PayByLinkData
    private let onClose: ((UIViewController) -> Void)?
    private let title: String

    /// Creates a new PBLCreateOrderScene, a scene used to show the details of an order before creating it
    /// - Parameters:
    ///   - data: the displayable information in this scene
    ///   - title: the title in the navigation bar
    ///   - onClose: a closure to invoke
    public init(data: PayByLinkData,
                title: String,
                onClose: ((UIViewController) -> Void)?) {
        self.data = data
        self.title = title
        self.onClose = onClose
    }

    public func createViewController() -> PBLCreateOrderViewController {
        return PBLCreateOrderViewController()
    }

    public func configure(controller: PBLCreateOrderViewController,
                          using factory: SceneFactory) {
        let router = DefaultPBLCreateOrderRouter(controller: controller, factory: factory)
        let viewModel = PBLCreateOrderViewModel(payByLinkData: self.data, title: self.title, onClose: { [weak controller, onClose] in
            guard let controller = controller else { return }
            onClose?(controller)
        }, router: router)
        controller.viewModel = viewModel
    }
}
