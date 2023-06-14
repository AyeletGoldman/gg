// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

public protocol NPSAdapter {

    /// Requests the details for a single NPS entry.
    /// - Parameter npsID: The ID of the NPS survey.
    /// - Returns: A publisher that contains the details to be able to display the NPS survey details.
    func fetchNPSDetails(npsID: String) -> AnyPublisher<Result<NPSDetailsDisplayable, ErrorDisplayable>, Error>

    /// Requests the details for a single NPS entry.
    /// - Parameter npsID: The ID of the NPS survey.
    /// - Returns: A publisher that contains the details to display the answers of the survey identified by the given NPS ID.
    func fetchNPSSurveyDetails(npsID: String) -> AnyPublisher<Result<NPSSurveyDetailsDisplayable, ErrorDisplayable>, Error>
}
