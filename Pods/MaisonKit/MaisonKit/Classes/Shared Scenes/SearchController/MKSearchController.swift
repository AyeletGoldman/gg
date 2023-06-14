// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import StylableSwiftUI

final class MKSearchBar: UISearchBar { }

final class MKSearchController: UISearchController, StylableStatusBarController {

    private lazy var _searchBar: MKSearchBar = { return MKSearchBar() }()

    override var searchBar: UISearchBar {
        return self._searchBar
    }

    private var stylist: Stylist
    private(set) var styleContainer: UIKitStyleContainer
    private var cancellables = Set<AnyCancellable>()
    var navBarVariant: String?
    var isPresentedInModalContext: Bool = false
    var stylistSection: String? { return nil }

    var searchBarPlaceholder: String?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.stylablePreferredStatusBarStyle
    }

    init(searchResultsController: UIViewController?,
         stylist: Stylist,
         styleContainer: UIKitStyleContainer) {
        self.stylist = stylist
        self.styleContainer = styleContainer
        super.init(searchResultsController: searchResultsController)
        self.showsSearchResultsController = true
        self.searchBar.returnKeyType = .search

        self.stylist.$currentTheme
            .dropFirst() // ignore the original value
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.styleSearchBar()
            }.store(in: &self.cancellables)
    }

    required init?(coder: NSCoder) {
        fatalError("This initializer has not been implemented")
    }

    func styleSearchBar() {
        let prefix = self.isPresentedInModalContext ? "modal/" : ""
        let navBarGroup: String = StylistIdentifier.buildFullIdentifier(for: "navbar", variant: self.navBarVariant)
        let cancelButtonIdentifier = StylistIdentifier("\(prefix)\(navBarGroup)/button-icon-right/title")
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: self.styleContainer.textColor(for: cancelButtonIdentifier),
            .font: self.styleContainer.font(for: cancelButtonIdentifier)
        ].compactMapValues { $0 }
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [MKSearchBar.self])
            .setTitleTextAttributes(attributes, for: .normal)

        self.searchBar.setImage(self.stylist.uiImage(for: StylistIdentifier("\(prefix)\(navBarGroup)/searchbar/search/icon-search")),
                                for: .search, state: .normal)
        self.searchBar.setImage(self.stylist.uiImage(for: StylistIdentifier("\(prefix)\(navBarGroup)/searchbar/search/icon-clear")),
                                for: .clear, state: .normal)

        let searchBarTitleIdentifier = StylistIdentifier("\(prefix)\(navBarGroup)/searchbar/search/title")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: self.styleContainer.textColor(for: searchBarTitleIdentifier),
            .font: self.styleContainer.font(for: searchBarTitleIdentifier)
        ].compactMapValues { $0 }
        self.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: self.searchBarPlaceholder ?? "",
                                                                                  attributes: placeholderAttributes)

        let searchBarHighlightedTitleIdentifier = StylistIdentifier("\(prefix)\(navBarGroup)/searchbar/search[highlighted]/title")
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: self.styleContainer.textColor(for: searchBarHighlightedTitleIdentifier),
            .font: self.styleContainer.font(for: searchBarHighlightedTitleIdentifier)
        ].compactMapValues { $0 }
        self.searchBar.searchTextField.defaultTextAttributes = textAttributes
        // When the background of the searchbar is pure white or pure black iOS applies a tint automatically
        // The only reasonable way to remove that tint is by setting the borderStyle to `.none` and then applying
        // manually the border style to the border that we want.
        self.searchBar.searchTextField.borderStyle = .none
        // TODO: Update the UIKitStyleContainer to be able to extract corner radius too
        self.searchBar.searchTextField.layer.cornerRadius = 10
        self.searchBar.searchTextField.backgroundColor = self.styleContainer.backgroundColor(for: StylistIdentifier("\(prefix)\(navBarGroup)/searchbar/search/background"))
    }
}
