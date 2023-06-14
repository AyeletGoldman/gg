// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The question, detailed answer, and scoring that a customer gave to an NPS survey question.
public struct NPSSurveyAnswer: Identifiable {

    public let id = UUID()

    /// The score the customer gave this question, along with the maximum score available for the question and information on how
    /// the score widget should be styled.
    public let score: NPSScore
    /// The question asked to the customer.
    public let question: String
    /// Optional. The answers the customer gave to this question.
    public let answer: String?

    /// Creates a new `NPSSurveyAnswer`
    /// - Parameters:
    ///   - question: The question asked to the customer.
    ///   - answer: Optional. The answers the customer gave to this question.
    ///   - score: The score the customer gave this question, along with the maximum score available for the question and information on how
    /// the score widget should be styled.
    public init(question: String, answer: String? = nil, score: NPSScore) {
        self.question = question
        self.answer = answer
        self.score = score
    }
}
