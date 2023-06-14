// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import UIKit
import SwiftUI

extension View {
    func embedInHostingController() -> UIHostingController<Self> {
        let controller = UIHostingController(rootView: self)
        controller.view.backgroundColor = .clear
        return controller
    }
}

public extension UIViewController {

    /// Embeds the given view into this view controller's `view`.
    /// - Parameter view: the view to embed into this view controller
    func embedChildView<V: View>(_ view: V) {
        let controller = view.embedInHostingController()
        self.add(controller)
    }
}

@nonobjc extension UIViewController {
    func add(_ child: UIViewController,
             containerView: UIView? = nil) {
        self.addChild(child)

        child.view.translatesAutoresizingMaskIntoConstraints = true
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        if let containerView = containerView {
            containerView.addSubview(child.view)
            child.view.frame = containerView.bounds
        } else {
            self.view.addSubview(child.view)
            child.view.frame = self.view.bounds
        }

        child.didMove(toParent: self)
    }

    func remove() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
