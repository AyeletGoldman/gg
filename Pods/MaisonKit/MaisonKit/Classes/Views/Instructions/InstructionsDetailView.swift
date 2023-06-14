// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct InstructionItemBlockView: View {

    private enum Constants {
        static let iconHeight: Double = 60
    }

    let displayable: InstructionsDisplayable
    private let variant: String?

    init(displayable: InstructionsDisplayable, variant: String? = nil) {
        self.displayable = displayable
        self.variant = variant
    }

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "note-instructions", variant: self.variant)) {
            VStack(spacing: 0) {
                Text(verbatim: self.displayable.title)
                    .style("title")
                HStack(alignment: .top, spacing: 0) {
                    ForEach(0..<self.displayable.instructions.count, id: \.self) { index in
                        VStack(spacing: 3) {
                            MaisonKitImage(source: .styledImage(identifier: self.displayable.instructions[index].getIcon()))
                                .frame(width: 60, height: Constants.iconHeight)

                            if let subtitle = self.displayable.instructions[index].getSubtitle() {
                                Text(verbatim: subtitle)
                                    .minimumScaleFactor(0.8)
                                    .style("subtitle")
                            }

                            Text(verbatim: self.displayable.instructions[index].getTitle())
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(3)
                                .minimumScaleFactor(0.7)
                                .style("body")
                        }.frame(maxWidth: .infinity)

                        if index < self.displayable.instructions.endIndex-1 {
                            Group {
                                MaisonKitImage(source: .styledImage(identifier: "icon-add"))
                                    .frame(width: 14, height: 14)
                            }.frame(width: 14, height: Constants.iconHeight)
                        }
                    }
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal)
            .style("background")
        }
    }
}
