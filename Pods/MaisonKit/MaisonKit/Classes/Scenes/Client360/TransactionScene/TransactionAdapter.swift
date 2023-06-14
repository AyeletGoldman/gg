// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// An adapter to retrieve transaction details given a transaction ID.
public protocol TransactionAdapter {

    /// Retrieves the transaction details given a transaction ID.
    /// - Parameter transactionId: A string identifying a single transaction.
    /// - Returns: A publisher which will return either a `TransactionDetailsDisplayable` to be shown on screen or an `ErrorDisplayable`.
    func getTransactionDetails(transactionId: String) -> AnyPublisher<Result<TransactionDetailsDisplayable, ErrorDisplayable>, Error>
}
