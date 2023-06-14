// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct PairedInformationView: View {

    @Environment(\.pairedInformationStyle) private var style

    let pairs: [Pair<TypedField>]

    init(pairs: [Pair<TypedField>]) {
        self.pairs = pairs
    }

    var body: some View {
        VStack(spacing: 21) {
            ForEach(0..<self.pairs.count, id: \.self) { index in
                HStack(spacing: 10) {
                    self.buildInformationCell(with: self.pairs[index].left)
                    if let right = self.pairs[index].right {
                        self.buildInformationCell(with: right)
                    }
                }
            }
        }
    }

    private func buildInformationCell(with field: TypedField) -> some View {
        self.style.makeBody(configuration: PairedInformationViewStyleConfiguration(field: field))
    }
}

extension PairedInformationView {

    func pairedInformationViewStyle<S: PairedInformationViewStyle>(_ style: S) -> some View {
        self.environment(\.pairedInformationStyle, AnyPairedInformationViewStyle(style: style))
    }
}
