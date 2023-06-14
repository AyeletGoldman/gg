// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

public final class StylableTabBarController: UITabBarController {

    public var styleContainer: UIKitStyleContainer = UIKitStyleContainer(stylist: .unstyled) {
        didSet {
            self.styleTabBar()
        }
    }

    private var notificationObserver: NSObjectProtocol?

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.styleTabBar()
        self.listenToThemeChanges()
    }

    private func listenToThemeChanges() {
        self.notificationObserver = NotificationCenter.default.addObserver(forName: .themeDidChangeNotification,
                                                                           object: nil,
                                                                           queue: .main) { [weak self] _ in
            self?.styleTabBar()
        }
    }

    private func styleTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = self.styleContainer.backgroundColor(for: "tabbar/background")
        appearance.backgroundImage = nil

        let normalAttributes = MaisonKitAppearance.getTextAttributes(for: "button-tabbar[disabled]/title", in: self.styleContainer)
        appearance.inlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttributes

        let selectedAttributes = MaisonKitAppearance.getTextAttributes(for: "button-tabbar/title", in: self.styleContainer)
        appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes

        let badgeBackgroundColor = self.styleContainer.backgroundColor(for: "button-tabbar/badge/background")
        let badgeTextAttributes = MaisonKitAppearance.getTextAttributes(for: "button-tabbar/badge/title",
                                                                        in: self.styleContainer)
        appearance.inlineLayoutAppearance.normal.badgeBackgroundColor = badgeBackgroundColor
        appearance.inlineLayoutAppearance.normal.badgeTextAttributes = badgeTextAttributes
        appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = badgeBackgroundColor
        appearance.stackedLayoutAppearance.normal.badgeTextAttributes = badgeTextAttributes
        appearance.compactInlineLayoutAppearance.normal.badgeBackgroundColor = badgeBackgroundColor
        appearance.compactInlineLayoutAppearance.normal.badgeTextAttributes = badgeTextAttributes

        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
        self.tabBar.setNeedsLayout()
    }
}
