// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ListItemSelectionModifier: ViewModifier {

    var selected: Bool = false
    var selectionStyle: SelectionStyle

    func body(content: Content) -> some View {
        HStack {
            MaisonKitImage(source: ImageSource.styledImage(identifier: StylistIdentifier(self.imageName)))
                .frame(width: 20, height: 20)
            content
        }
    }

    private var imageName: String {
        switch self.selectionStyle {
        case .single:
            return self.selected ? "icon-radio-selected" : "icon-radio"
        case .multiple:
            return self.selected ? "icon-checkbox-selected" : "icon-checkbox"
        }
    }
}
