// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

public protocol ClientEditAdapter {
    /// Requests the fields for the form to edit a client. The result of this function returns a publisher that contains a dictionary of dynamic data.
    /// - Parameter clientID: the ID of the client for which the form details are requested
    /// - Returns: a publisher that, on success, will return a result containing either a `AnyFormDisplayable` or an error.
    func getEditClientFields(clientID: String) -> AnyPublisher<Result<AnyFormDisplayable, ErrorDisplayable>, Error>

    /// Requests the fields for the form to edit a client. The result of this function returns a publisher that contains a dictionary of dynamic data.
    /// - Parameters:
    ///   - clientID: the ID of the client for which the form details are requested
    ///   - data: the data in the form that was used to modify the client. Use this to get the `diff` between the original data and the current data/
    /// - Returns: a publisher that, on success, will return a result containing either an array of `EditedField` or an error.
    func getConfirmEditClientFields(clientID: String, data: AnyFormData) -> AnyPublisher<Result<[EditedField], ErrorDisplayable>, Error>

    /// Asks the implementing app to save the given form data for a client.
    /// - Parameters:
    ///   - clientID: The ID of the client whose data we want to save
    ///   - data: The data we want to save. This is a class that wraps a dictionary so that dynamic data can be used.
    /// - Returns: A publisher that, on success, will have updated the client data.
    func saveClient(clientID: String, data: AnyFormData) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
}
