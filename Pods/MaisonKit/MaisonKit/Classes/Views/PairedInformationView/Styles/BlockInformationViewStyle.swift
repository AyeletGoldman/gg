// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct BlockInformationViewStyle: PairedInformationViewStyle {

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup("block[center]") {
            TextBlockView(title: configuration.field.value.toString(),
                          subtitle: configuration.field.title)
        }
    }
}

extension PairedInformationViewStyle where Self == BlockInformationViewStyle {
    static var block: BlockInformationViewStyle {
        return BlockInformationViewStyle()
    }
}
