// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit

extension NetworkAdapter: ClientListAdapter {
    
    func getAllClientListMembers(listID: String) -> AnyPublisher<Result<[ClientMemberDisplayable], ErrorDisplayable>, Error> {
        // TODO: Create a better way to fetch all clients in a list
        return self.networking.clientListsControllerFindOne(listId: listID,
                                                            pageIndex: nil,
                                                            pageSize: nil,
                                                            cursor: nil,
                                                            sort: nil)
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { client in
            return client.data.result.items.members.map { ClientMemberDisplayable(from: $0 )}
        }
    }
    
    func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never> {
//        let actions: [MenuAction] = [MenuAction.createClientAction()]
        return Just([]).eraseToAnyPublisher()
    }
    
    func upsertClientList(listId: String?, listName: String, listMemberIds: [String]) -> AnyPublisher<Result<ClientListDisplayable, ErrorDisplayable>, Error> {
        let createListInterface = CreateClientList(listType: .personal, memberIds: listMemberIds, name: listName)
        if let listId = listId {
            return self.networking.clientListsControllerPut(listId: listId, body: createListInterface)
                .unwrapDefaultSuccessResponse()
                .flatMap { [networking] in
                    return networking.clientListsControllerFindOne(listId: listId,
                                                                   pageIndex: nil,
                                                                   pageSize: nil,
                                                                   cursor: nil,
                                                                   sort: nil)
                    .unwrapDefaultSuccessResponse()
                }.eraseToAnyPublisher()
                .mapToResultViewModel { response -> ClientListDisplayable in
                    return ClientListDisplayable(response.data.result)
                }
        }
        return self.networking.clientListsControllerCreate(body: createListInterface)
            .unwrapDefaultSuccessResponse()
            .flatMap { [networking] result in
                return networking.clientListsControllerFindOne(listId: result.data.result.id,
                                                               pageIndex: nil,
                                                               pageSize: nil,
                                                               cursor: nil,
                                                               sort: nil)
                .unwrapDefaultSuccessResponse()
            }
            .handleEvents(receiveOutput: { _ in
                ToastView.show(
                    text: MKLocalizedString("toastMessages.clientListCreated.message", comment: "Message to show when client list is created"),
                    style: .success)
            })
            .eraseToAnyPublisher()
            .mapToResultViewModel { response in
                return ClientListDisplayable(response.data.result)
            }
    }
    
    func getClientListMembers(listID: String, tabID: String?, sortBy: SelectedSortValue?, cursor: String?) -> AnyPublisher<Result<ClientListDisplayable, ErrorDisplayable>, Error> {
        let apiSort: SortKeyValue? = sortBy.map(SortKeyValue.init)
        return self.networking.clientListsControllerFindOne(listId: listID,
                                                            pageIndex: nil,
                                                            pageSize: nil,
                                                            cursor: nil,
                                                            sort: apiSort)
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { response -> ClientListDisplayable in
            return ClientListDisplayable(response.data.result)
        }
    }
    
    func getClientLists() -> AnyPublisher<Result<ClientListSection, ErrorDisplayable>, Error> {
        self.networking.clientListsControllerFindAll()
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response -> ClientListSection in
            return ClientListSection(from: response.data.result)
        }
    }
    
    func deleteClientList(listId: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        self.networking.clientListsControllerDelete(listId: listId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { return $0 }
    }
    
    func deleteClientListMember(memberId: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        self.networking.clientListsMembersControllerDelete(memberId: memberId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { return $0 }
    }
}

// MARK: - Client List
extension ClientMemberDisplayable {
    init(from iClientListMember: ClientListMember) {
        let memberId = iClientListMember.clientListMemberId
        let clientId = iClientListMember.clientId
        let client = MemberRowDisplayable(id: clientId, from: iClientListMember)
        self.init(listMemberID: memberId ?? clientId, clientID: clientId, clientName: client.title) {
            MemberRowView(client: client)
        }
    }
}

extension ClientListSection {
    init(from clientLists: ClientLists) {
        let personalLists = clientLists.personal?.map { ClientListDisplayable($0) }
        let featuredLists = clientLists.featured?.map { ClientListDisplayable($0) }
        
        let featured = ClientListSectionDisplayable(title: MKLocalizedString("Clients lists",
                                                                             comment: "The title for featured lists"),
                                                    listTypeIdentifier: "featured", clientLists: featuredLists ?? [])
        let personal = ClientListSectionDisplayable(title: MKLocalizedString("My lists",
                                                                             comment: "The title for personal lists"),
                                                    listTypeIdentifier: "personal", clientLists: personalLists ?? [])
        self.init(featured: featured, personal: personal)
    }
}

protocol ClientListDisplayableInitializable {
    var id: String { get }
    var title: String { get }
    var subtitle: String? { get }
    var heroImageURL: URL? { get }
    var tag: String? { get }
    var isEditable: Bool { get }
}

extension PersonalList: ClientListDisplayableInitializable {
    var heroImageURL: URL? {
        return nil
    }
    
    var tag: String? {
        return nil
    }
    
    var isEditable: Bool {
        return true
    }
}

extension FeaturedList: ClientListDisplayableInitializable {
    var heroImageURL: URL? {
        return self.imageURL
    }
    
    var tag: String? {
        return nil
    }
    
    var isEditable: Bool {
        return false
    }
}

extension ClientListDisplayable {
    init(_ list: ClientListDisplayableInitializable) {
        let info = ListInfo(title: list.title,
                            subtitle: list.subtitle,
                            backgroundImage: list.heroImageURL.map { .url($0) },
                            tag: list.tag,
                            isEditable: list.isEditable)
        self.init(id: list.id, listInfo: info)
    }
}

extension ClientListDisplayable {
    init(_ result: ClientListJSendSuccessPluginResponseCommonQueryResult) {
        let clientList = result.items
        let id = clientList.id
        let members = clientList.members.map(ClientMemberDisplayable.init)
        let title = clientList.header.title
        let subtitle = clientList.header.description
        let imageURL = clientList.header.imageURL
        let tag = clientList.header.tag
        let listType = clientList.header.listType
        let isEditable = listType == .personal
        let listInfo = ListInfo(title: title,
                                subtitle: subtitle,
                                backgroundImage: imageURL.map { .url($0) },
                                tag: tag,
                                isEditable: isEditable)
        let sortItems: [SortItem]? = result.sort.map { $0.availableSorts.reduce(into: []) {
            $0.append(SortItem(from: $1, order: .asc))
            $0.append(SortItem(from: $1, order: .desc))
        }}
        self.init(id: id,
                  listInfo: listInfo,
                  members: members,
                  sortItems: sortItems,
                  selectedSortValue: SelectedSortValue(from: result.sort?.selectedSort.key ?? "", order: result.sort?.selectedSort.order ?? .asc)
        )
    }
}

private extension SortKeyValue {
    init(string: String) {
        let parts = string.split(separator: "_")
        let key = parts.first.map(String.init)
        let order: SortDirection? = parts.last.map { $0 == "asc" ? .asc : .desc}
        self.init(key: key, order: order)
    }
}

private extension SortItem {
    private enum Labels {
        static let ascendingTitle =  MKLocalizedString("sort.ascending.title", comment: "Sort ascending title")
        static let descendingTitle =  MKLocalizedString("sort.descending.title", comment: "Sort descending title")
    }
    
    init(from sortItem: AvailableSort, order: SortDirection) {
        let value = sortItem.key
        let format = order == .asc ? Labels.ascendingTitle : Labels.descendingTitle
        let sortName = SortItem.sortNameMapping[sortItem.display] ?? sortItem.display
        let title = String(format: format, MKLocalizedString(sortName, comment: "The translated sort"))
        self.init(id: SortID(from: value, order: order), title: title)
    }
    
    private static var sortNameMapping: [String: String] {
        return [
            "countOfSales24M" : "clientlists.sorts.24Mtransactions",
            "account.behaviour.TO24MInclTaxEur" : "clientlists.sorts.turnover24months",
            "account.behaviour.segmentRFAP" : "clientlists.segmentation"
        ]
    }
}

private extension SortID {
    init(from sortValue: String, order: SortDirection) {
        self = "\(sortValue)_\(order.rawValue)"
    }
}
