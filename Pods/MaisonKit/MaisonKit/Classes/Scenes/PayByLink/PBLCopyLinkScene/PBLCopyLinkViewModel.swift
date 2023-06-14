//  Copyright © 2021 LVMH. All rights reserved.

import Combine
import Biodag

final class PBLCopyLinkViewModel: ObservableObject {

    private enum Labels {
        static let paymentURLCopiedText = MKLocalizedString("pay-by-link.copy.copy-success-toast.title",
                                                            comment: "The text to show in the toast message when a user copies the payment URL")
    }

    @Published private(set) var fields = ResultState<[TypedField], ErrorDisplayable>.waiting

    @Inject private var payByLinkAdapter: PayByLinkAdapter

    private let onDone: () -> Void
    let orderId: String

    init(orderId: String, onDone: @escaping () -> Void) {
        self.orderId = orderId
        self.onDone = onDone
    }

    func fetchOrderData() {
        self.payByLinkAdapter.getPaymentLink(orderId: self.orderId)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.fields = .loading(nil)
            })
            .flatMap { [payByLinkAdapter, orderId] linkResult -> AnyPublisher<Result<[TypedField], ErrorDisplayable>, Error> in
                switch linkResult {
                case .success(let value):
                    return payByLinkAdapter.getCopyPaymentLinkDetails(linkId: value.id, orderId: orderId)
                case .failure(let error):
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .map(ResultState.fromResult)
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }.assign(to: &self.$fields)
    }

    func didTapDone() {
        self.onDone()
    }
}
