// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct TypedFieldInformationViewStyle: PairedInformationViewStyle {

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup("info") {
            TypedFieldView(typedField: configuration.field)
                .style("title")
        }
    }
}

extension PairedInformationViewStyle where Self == TypedFieldInformationViewStyle {
    static var typedField: TypedFieldInformationViewStyle {
        return TypedFieldInformationViewStyle()
    }
}
