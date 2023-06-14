// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI
import SwiftUI

/// A view controller that implements the `Stylable` protocol
open class StylableViewController<ChildView: View>: UIViewController, Stylable, UIKitStylable, WebContentStylable, StylableStatusBarController {

    /// The stylist this controller uses to style its views
    public var stylist: Stylist = .unstyled
    /// The style container this controller uses to retrieve any UIKit properties for style
    public var styleContainer: UIKitStyleContainer = UIKitStyleContainer(stylist: .unstyled)
    /// A stylist implementation for styling any web content
    public var webStylist: WebStylist = .unstyled
    /// The child view this controller will display
    public var childView: ChildView?
    /// The stylist section for this view controller
    public var stylistSection: String? { return nil }

    private var notificationObserver: NSObjectProtocol?

    /// StylableViewController viewDidLoad for defining the view controller style
    override open func viewDidLoad() {
        super.viewDidLoad()
        // WARNING: It doesn't appear possible to remove the section header top padding from within SwiftUI
        // so we do a bit of a hack here where we change the appearance for all table views that are inside a
        // `StylableViewController`.
        if #unavailable(iOS 16) {
            UITableView.appearance(whenContainedInInstancesOf: [type(of: self)]).sectionHeaderTopPadding = 0
        }
        if let childView = self.childView {
            self.embedChildView(childView
                .wrapWithStylistPath(self.stylistPath)
                .environment(\.isModalPresentationStyle, self.isModal)
                .environmentObject(self.stylist)
                .environmentObject(self.styleContainer)
                .environmentObject(self.webStylist))
        }
        self.listenToThemeChange()
        self.styleNavigationBar()

        self.view.backgroundColor = self.styleContainer.backgroundColor(for: "background")
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        self.stylablePreferredStatusBarStyle
    }

    private func listenToThemeChange() {
        self.notificationObserver = NotificationCenter.default.addObserver(forName: .themeDidChangeNotification,
                                                                           object: nil,
                                                                           queue: .main) { [weak self] _ in
            self?.styleNavigationBar()
            self?.view.backgroundColor = self?.styleContainer.backgroundColor(for: "background")
        }
    }

    private func styleNavigationBar() {

        let backgroundIdentifier = StylistIdentifier("navbar/background").within(self.stylistPath)
        let titleIdentifier = StylistIdentifier("navbar/title").within(self.stylistPath)
        let leftButtonTitleIdentifier = StylistIdentifier("navbar/button-icon-left/title").within(self.stylistPath)
        let leftButtonIconIdentifier = StylistIdentifier("navbar/button-icon-left/icon-left").within(self.stylistPath)

        let navBarAppearance = UINavigationBarAppearance(styleContainer: self.styleContainer,
                                                         shadowColorIdentifier: backgroundIdentifier,
                                                         backButtonIdentifier: leftButtonTitleIdentifier,
                                                         backgroundColorIdentifier: backgroundIdentifier,
                                                         backIndicatorImageIdentifier: leftButtonIconIdentifier,
                                                         transitionMaskImageIdentifier: leftButtonIconIdentifier,
                                                         titleIdentifier: titleIdentifier)

        self.navigationItem.standardAppearance = navBarAppearance
        self.navigationItem.compactAppearance = navBarAppearance
        self.navigationItem.scrollEdgeAppearance = navBarAppearance
    }
}

extension UIKitStyleContainer: ObservableObject { }

// MARK: - Right Bar button items
public extension StylableViewController {
    /// Set right navigation bar button based on stylist
    /// - Parameter button: The button to set as the right bar button item. Replaces any buttons that are already there.
    func setRightBarButtonItem(_ button: NavigationButton) {
        self.setRightBarButtonItems([button])
    }

    /// Set right navigation bar buttons based on stylist
    /// - Parameter buttons: The array of buttons to set as the right bar button items. Replaces any buttons that are already there.
    func setRightBarButtonItems(_ buttons: [NavigationButton]) {
        let items = buttons.compactMap { button in
            return MKNavigationButton.buildMKNavigationButton(edge: .trailing,
                                                              from: button,
                                                              stylist: self.stylist,
                                                              stylistPath: self.stylistPath).asUIBarButtonItem()
        }
        self.setRightBarButtonItems(items: items)
    }

    /// Add one right navigation bar button to the existing list based on stylist
    /// - Parameter button: The button to add to the right bar button items.
    func addRightBarButtonItem(_ button: NavigationButton) {
        guard let barButtonItem = MKNavigationButton.buildMKNavigationButton(edge: .trailing,
                                                                             from: button,
                                                                             stylist: self.stylist,
                                                                             stylistPath: self.stylistPath)
            .asUIBarButtonItem() else { return }
        self.setRightBarButtonItems(items: (self.navigationItem.rightBarButtonItems ?? []) + [barButtonItem])
    }

    /// Set a list of right UIBarButtonItem
    /// - Parameter items: The array of buttons to set as the right bar button items. Replaces any buttons that are already there.
    func setRightBarButtonItems(items: [UIBarButtonItem]) {
        self.navigationItem.rightBarButtonItems = items
    }
}

// MARK: - Left bar button items
public extension StylableViewController {
    /// Set left navigation bar button based on stylist
    /// - Parameter button: The button to set as the left bar button item. Replaces any buttons that are already there.
    func setLeftBarButtonItem(_ button: NavigationButton) {
        self.setLeftBarButtonItems([button])
    }

    /// Set left navigation bar buttons based on stylist
    /// - Parameter buttons: The array of buttons to set as the left bar button items. Replaces any buttons that are already there.
    func setLeftBarButtonItems(_ buttons: [NavigationButton]) {
        let items = buttons.compactMap { button in
            return MKNavigationButton.buildMKNavigationButton(edge: .leading,
                                                              from: button,
                                                              stylist: self.stylist,
                                                              stylistPath: self.stylistPath)
            .asUIBarButtonItem()
        }
        self.setLeftBarButtonItems(items)
    }

    /// Set a list of left UIBarButtonItem
    /// - Parameter items: The array of buttons to set as the left bar button items. Replaces any buttons that are already there.
    func setLeftBarButtonItems(_ items: [UIBarButtonItem]) {
        self.navigationItem.leftBarButtonItems = items
    }
}

private extension MKNavigationButton where Label == AnyView {
    @ViewBuilder
    static func buildMKNavigationButton(edge: EdgeStyle,
                                        from button: NavigationButton,
                                        stylist: Stylist,
                                        stylistPath: StylistIdentifier.Path) -> some View {
        StylableGroup(stylistPath.description) {
            switch button.title {
            case .image(let source):
                MKNavigationButton(edge: edge,
                                   iconSource: source,
                                   isDisabled: !button.isEnabled,
                                   badgeTitle: button.badgeTitle,
                                   action: button.action)
            case .text(let title):
                MKNavigationButton(edge: edge,
                                   label: title,
                                   isDisabled: !button.isEnabled,
                                   badgeTitle: button.badgeTitle,
                                   action: button.action)
            case .loading:
                MKNavigationButton(edge: edge,
                                   label: { LoadingView().eraseToAnyView() },
                                   isDisabled: !button.isEnabled,
                                   badgeTitle: button.badgeTitle,
                                   action: {})
            }
        }
        .environmentObject(stylist)
    }
}

private extension View {
    @ViewBuilder
    func wrapWithStylistPath(_ stylistPath: StylistIdentifier.Path) -> some View {
        if stylistPath.description.isEmpty {
            self
        } else {
            StylableGroup(stylistPath.description) {
                self
            }
        }
    }
}
