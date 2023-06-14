// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct AnswerView: View {

    let question: String
    let answer: String?
    let score: NPSScore

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            StylableGroup(StylistIdentifier.buildFullIdentifier(for: "note", variant: "rating")) {
                Text(self.question)
                    .style("title")
                    .padding(.bottom, 8)
                HStack(spacing: 25) {
                    Progress(maximumScore: self.score.maximumValue, score: self.score.value, variant: self.score.identifierVariant)
                    Text(score.displayableValue)
                        .style("subtitle")
                }.padding(.bottom, 10)
                if let answer {
                    Text(answer)
                        .style("body")
                }
            }
        }
    }
}
