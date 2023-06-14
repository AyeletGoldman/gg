//  Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct NPSSurveyDetailsView: View {

    private enum Labels {
        // swiftlint:disable line_length
        static let answeredOnFormat = MKLocalizedString("nps.survey-details.answered-on.format",
                                                        comment: "The format for the subtitle in the survey details that shows when a survey was answered. The first placeholder is the date in medium format (MMM DD, YYYY) and the second one is the time in short format HH:MM")
        // swiftlint:enable line_length
    }

    @ObservedObject private var viewModel: NPSSurveyDetailsViewModel

    init(viewModel: NPSSurveyDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultStateViewBuilder(result: self.viewModel.displayable).setLoadingView {
            self.buildMainView(with: .loading)
        }.buildContent { displayable in
            self.buildMainView(with: displayable)
        }
    }

    @ViewBuilder
    private func buildMainView(with displayable: NPSSurveyDetailsDisplayable) -> some View {
        ScrollView {
            VStack {
                Text(String(format: Labels.answeredOnFormat,
                            DateFormatter.medium.string(from: displayable.answeredDate),
                            DateFormatter.timeOnlyFormatter.string(from: displayable.answeredDate)))
                .style("subtitle")
                .padding(.top, 26)
                .padding(.bottom, 16)
                StylableGroup("rating-details") {
                    ForEach(displayable.answers) { answer in
                        AnswerView(question: answer.question, answer: answer.answer, score: answer.score)
                            .padding(.vertical, 18)
                            .addStyledRowDivider(if: answer.id != displayable.answers.last?.id)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

private extension NPSSurveyDetailsDisplayable {
    static var loading: NPSSurveyDetailsDisplayable {
        let answer = """
Cras mattis consectetur purus sit amet fermentum.
Donec id elit non mi porta gravida at eget metus
maecenas sed diam eget risus varius blandit sit amet
non magna.
"""
        return NPSSurveyDetailsDisplayable(
            answeredDate: Date(),
            answers: [
                NPSSurveyAnswer(question: "Etiam porta sem malesuada magna mollis euismod?",
                                answer: answer,
                                score: NPSScore(value: 5, maximumValue: 10, identifierVariant: "disabled")),
                NPSSurveyAnswer(question: "Etiam porta sem malesuada magna mollis euismod?",
                                answer: answer,
                                score: NPSScore(value: 2, maximumValue: 10, identifierVariant: "disabled")),
                NPSSurveyAnswer(question: "Etiam porta sem malesuada magna mollis euismod?",
                                answer: answer,
                                score: NPSScore(value: 8, maximumValue: 10, identifierVariant: "disabled")),
                NPSSurveyAnswer(question: "Etiam porta sem malesuada magna mollis euismod?",
                                answer: answer,
                                score: NPSScore(value: 5, maximumValue: 10, identifierVariant: "disabled"))
            ])
    }
}
