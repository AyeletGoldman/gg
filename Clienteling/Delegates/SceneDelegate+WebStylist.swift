// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MaisonKit
import StylableSwiftUI

extension SceneDelegate {
    func setupWebStylist(with stylist: Stylist) -> WebStylist {
        guard let baseCss = self.loadCss(named: "is-css"),
              let lightThemeCss = self.loadCss(named: "sketch"),
              let darkThemeCss = self.loadCss(named: "dark-sketch") else {
                  return .unstyled
        }

        return WebStylist(stylist: stylist,
                          base: baseCss,
                          themes: CSSThemes(unthemed: lightThemeCss, themes: ["dark": darkThemeCss]))
    }

    private func loadCss(named name: String) -> String? {
        let path = Bundle.main.path(forResource: name, ofType: "css")
        return path.map { try? String(contentsOfFile: $0) } ?? nil
    }
}
