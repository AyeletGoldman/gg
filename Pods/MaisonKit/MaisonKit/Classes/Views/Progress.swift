// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A progress view divided into segments. Each segment will be coloured differently depending on whether
/// the score contains that segment. The number of segments is defined by the `maximumScore` property.
public struct Progress: View {

    enum Labels {
        // swiftlint:disable line_length
        static let scoreFormat = MKLocalizedString("progress.score.format",
                                                   comment: "The format to display the score over the maximum score available. The first parameter is the score and the second one is the maximum score.")
        // swiftlint:enable line_length
    }

    private let maximumScore: Int
    private let score: Int
    private let variant: String?

    /// Creates a new `Progress` view.
    /// - Parameters:
    ///   - maximumScore: the maximum available score; this defines the number of segments that will be in the view.
    ///   - score: the number of segments to show as completed. If this is more than the maximumScore, it is bound to that value.
    ///   - variant: Optional. A variant to use for the progress view that will define a different colour for the completed progress view.
    public init(maximumScore: Int, score: Int, variant: String? = nil) {
        self.maximumScore = maximumScore
        self.score = score > maximumScore ? maximumScore : score
        self.variant = variant
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "progress", variant: nil)) {
            HStack(spacing: 2) {
                ForEach(0..<self.maximumScore, id: \.self) { index in
                    StylableGroup(StylistIdentifier.buildFullIdentifier(for: "progress-item",
                                                                        variant: index >= self.score ? "disabled" : self.variant)) {
                        Rectangle()
                            .frame(height: 5)
                            .foregroundColor(.clear)
                            .style("background")
                    }
                }
            }
            .padding(2)
            .style("background")
        }
    }
}
