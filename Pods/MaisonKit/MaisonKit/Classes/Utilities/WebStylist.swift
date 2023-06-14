// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import StylableSwiftUI

/// The identifier for a given theme. This is a string to be able to switch the themes in the app. It will usually be
/// the same as the name of the theme in the stylist.
public typealias ThemeIdentifier = String
/// A type to indicate the contents of a css file
public typealias CSSString = String
/// A dictionary of theme identifiers to CSS strings
public typealias CSSThemeDictionary = [ThemeIdentifier: CSSString]

/// A set of css themes available for stylist.
/// We will always have an unthemed style, and a list of "themed" alternatives.
public struct CSSThemes {

    /// The unthemed CSS string
    public let unthemed: CSSString
    /// The dictionary of CSS themes keyed by theme identifier
    public let themes: CSSThemeDictionary

    /// Creates a new CSSThemes object
    /// - Parameters:
    ///   - unthemed: The unthemed CSS string
    ///   - themes: The dictionary of CSS themes keyed by theme identifier
    public init(unthemed: CSSString, themes: CSSThemeDictionary = [:]) {
        self.unthemed = unthemed
        self.themes = themes
    }
}

/// A stylist instance that deals with styling web content
/// It's main responsibility is to listen to changes in the stylist and update the
/// active CSS theme for all webviews that require it.
final public class WebStylist: ObservableObject {

    /// The unstyled version of the `WebStylist`.
    /// Use this if you do not have any web content and want to pass in a stylist to the factory.
    public static var unstyled: WebStylist {
        return WebStylist(stylist: .unstyled, base: "", themes: CSSThemes(unthemed: ""))
    }

    private let base: CSSString
    private let themes: CSSThemes
    private let stylist: Stylist

    private var cancellables = Set<AnyCancellable>()

    @Published private(set) var themedCSSString: CSSString?

    /// Creates a new `WebStylist`
    /// - Parameters:
    ///   - stylist: the global app stylist instance
    ///   - base: the base CSS styles, that are shared among all themes
    ///   - themes: A set of css themes available for stylist.
    public init(stylist: Stylist, base: CSSString, themes: CSSThemes) {
        self.base = base
        self.themes = themes
        self.stylist = stylist

        self.subscribeToThemeChanges()
    }

    private func subscribeToThemeChanges() {
        self.stylist.$currentTheme.sink { [weak self] theme in
            guard let self = self else { return }
            let themeCss: CSSString = {
                guard let theme = theme,
                      let themedCss = self.themes.themes[theme.name] else {
                    return self.themes.unthemed
                }

                return themedCss
            }()

            self.themedCSSString = self.base.appending("\n").appending(themeCss)
        }.store(in: &self.cancellables)
    }
}
