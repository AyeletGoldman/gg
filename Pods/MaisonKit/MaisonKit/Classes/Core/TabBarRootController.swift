// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import Combine
import StylableSwiftUI

/// A convenience class to handle the tab bar's buttons changing between themes.
/// Inherit from this class if your controller is going to provide a `tabBarItem`
class TabBarRootViewController<V: View>: StylableViewController<V> {

    private var stylistSubscription: AnyCancellable?

    private var tabBarImage: UIImage? {
        self.stylist.uiImage(for: StylistIdentifier("button-tabbar[disabled]/" + self.tabBarImageIcon))
    }

    private var tabBarSelectedImage: UIImage? {
        self.stylist.uiImage(for: StylistIdentifier("button-tabbar/" + self.tabBarImageIcon))
    }

    override var stylist: Stylist {
        didSet {
            self.stylistSubscription?.cancel()
            self.stylistSubscription = self.stylist.$currentTheme.receive(on: DispatchQueue.main)
                .sink { [weak self]_ in
                    guard let self = self else { return }
                    self.tabBarItem.image = self.tabBarImage
                    self.tabBarItem.selectedImage = self.tabBarSelectedImage
                }
        }
    }

    override var title: String? {
        didSet {
            self.tabBarItem.title = self.tabBarTitle
        }
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.sharedInit()
    }

    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        self.sharedInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.sharedInit()
    }

    private func sharedInit() {
        self.tabBarItem = UITabBarItem(title: self.tabBarTitle,
                                       image: self.tabBarImage,
                                       selectedImage: self.tabBarSelectedImage)
    }

    /// Override this to provide your own icon
    var tabBarImageIcon: String { return "" }
    /// Override this to provide your own title
    var tabBarTitle: String { return "" }
}
