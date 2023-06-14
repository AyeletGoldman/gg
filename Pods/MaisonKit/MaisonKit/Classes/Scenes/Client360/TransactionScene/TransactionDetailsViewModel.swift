// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import Combine
import Biodag

/// View model for the `TransactionDetailsView`
/// Is responsible for fetching the correct transaction details and logging the analytics for viewing of this screen.
public final class TransactionDetailsViewModel: ObservableObject {

    @Published private(set) var transactionDetails: ResultState<TransactionDetailsDisplayable, ErrorDisplayable> = .waiting

    @Inject private var transactionAdapter: TransactionAdapter
    private var fetchCancellable: AnyCancellable?
    private let transactionId: String

    /// Creates a new `TransactionDetailsViewModel` given a transaction ID
    /// - Parameter transactionId: the string identifying the transaction.
    public init(transactionId: String) {
        self.transactionId = transactionId
    }

    /// Asks the Analytics framework to log the transaction details viewed event.
    public func logViewAnalytics() {
        Analytics.log(TransactionDetailsViewedEvent())
    }

    /// Requests the adapter to fetch the transaction details from the view model's `transactionId`.
    public func fetchTransaction() {
        guard case .waiting = self.transactionDetails else {
            return
        }
        self.transactionDetails = .loading(nil)
        self.fetchCancellable = self.transactionAdapter
            .getTransactionDetails(transactionId: self.transactionId)
            .map(ResultState.fromResult)
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }
            .weakAssign(to: \.transactionDetails, on: self)
    }
}
