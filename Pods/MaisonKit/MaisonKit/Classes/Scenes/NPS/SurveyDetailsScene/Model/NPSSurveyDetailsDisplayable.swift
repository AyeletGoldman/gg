// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The detailed questions and answers of an NPS survey. 
public struct NPSSurveyDetailsDisplayable {

    /// The date at which the survey was answered
    public let answeredDate: Date

    /// The questions, and answers to the survey
    public let answers: [NPSSurveyAnswer]

    /// Creates a new `NPSSurveyDetailsDisplayable`
    /// - Parameters:
    ///   - answeredDate: The date at which the survey was answered
    ///   - answers: The questions, and answers, to the survey.
    public init(answeredDate: Date, answers: [NPSSurveyAnswer]) {
        self.answeredDate = answeredDate
        self.answers = answers
    }
}
