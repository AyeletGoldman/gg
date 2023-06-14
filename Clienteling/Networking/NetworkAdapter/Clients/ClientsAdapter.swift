// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import nmbr_icu

extension NetworkAdapter: ClientsAdapter {
    /// Gets a list of clients
    func searchClients(pageIndex: Int, searchText: String, clientListId: String? = nil) -> AnyPublisher<Result<[ClientSearchRowDisplayable], ErrorDisplayable>, Error> {
        return self.networking.clientsControllerFindAll(query: searchText,
                                                        clientlistId: clientListId,
                                                        searchScope: .global,
                                                        pageIndex: pageIndex,
                                                        pageSize: nil,
                                                        cursor: nil)
        .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return response.data.result.clients.map(ClientSearchRowDisplayable.init)
            }.eraseToAnyPublisher()
    }

    func minimumNumberOfSearchCharacters() -> Int {
        return 3
    }
}

// MARK: - Client Search
private extension ClientSearchRowDisplayable {
    init(from client: ClientWithSubtitle) {
        let clientId = client.clientId
        let memberRowDisplayable = MemberRowDisplayable(id: clientId, from: client)
        self.init(cellProvider: ClientCellProvider(clientID: clientId, clientName: client.clientName ?? "", cellCreation: {
            MemberRowView(client: memberRowDisplayable)
        }))
    }
}

protocol ClientRowDisplayableInitializable {
    var clientName: String? { get }
    var advisorId: String? { get }
    var subtitles: [TypedValue]? { get }
    var segments: [String] { get }
}

extension ClientWithSubtitle: ClientRowDisplayableInitializable {
    var subtitles: [TypedValue]? {
        detailsFields
    }
}
extension ClientListMember: ClientRowDisplayableInitializable {
    var subtitles: [TypedValue]? {
        detailsFields
    }
}

extension MemberRowDisplayable {
    init(id: String, from listMember: ClientRowDisplayableInitializable) {
        let title: String = {
            if let clientName = listMember.clientName {
                return clientName
            }
            return MKLocalizedString("No name",
                                     comment: "The string to display when client name is absent")
        }()
        
        let subtitles: [LabeledValue] = listMember.subtitles?.compactMap { subtitle in
            subtitle.translationKey.map { label in
                LabeledValue(label: MKLocalizedString(label, comment: ""), value: MaisonKit.TypedValue(from: subtitle,currencyFormatter: .short(withPercision: 1)).toString())
            }
        } ?? []
        self.init(id: id,
                  title: title,
                  subtitles: subtitles,
                  segments: listMember.segments,
                  isMyCustomer: false)
    }
}

private func getClientSegment(typedValue: TypedValue) -> String? {
    if case .typedValueCurrency(let currency) = typedValue {
        guard let typedCurrencyValue = currency.value else {
            return nil
        }
        
        return CurrencyConvertable(
            fractionalUnitAmount: Int(typedCurrencyValue),
            numberOfFractionalUnitsInMonetaryUnit: Int(currency.currencyDivisor ?? 1),
            currencyCode: ""
        ).toString(with: .segmentFormat)

    } else {
        return MaisonKit.TypedValue(from: typedValue).toString()
    }
}

extension NumberFormatter {
    static let segmentFormat: NumberFormatter = {
        let shortFormatter = SegmentNumberFormatter()
        shortFormatter.formatter.locale = Locale.autoupdatingCurrent
        return shortFormatter
    }()
}

class SegmentNumberFormatter: NumberFormatter {

    let formatter = KNumberFormatter()

    override func string(from number: NSNumber) -> String? {
        if number < 1000 {
            return "<1K"
        }
        var formattedNumber = self.formatter.string(for: number)
        let formattedWithSymbol = NumberFormatter.short.string(from: number) ?? ""
        let result = formattedWithSymbol.filter("0123456789.".contains)
        formattedNumber = formattedWithSymbol.replacingOccurrences(of: result, with: formattedNumber)
      
        if Int(truncating: number) % 1000 == 0 {
            return formattedNumber
        }
        return "\(formattedNumber)+"
    }
}

open class KNumberFormatter: NumberFormatter {
    open func string(for num: NSNumber) -> String {
        let suffixes = ["", "K", "M", "B"]
        var idx = 0
        var d = num.doubleValue
        while idx < 4 && abs(d) >= 1000.0 {
            d /= 1000.0
            idx += 1
        }
        let rounded = d.rounded(.down)
        let numStr = String(format: "%.0f", rounded)
        return  numStr + suffixes[idx]
    }
}
