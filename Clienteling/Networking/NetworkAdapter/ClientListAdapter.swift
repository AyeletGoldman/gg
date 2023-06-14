// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import SwiftUI
import StylableSwiftUI

extension NetworkAdapter: ClientListAdapter {
    func upsertClientList(listId: String?, listName: String, listMemberIds: [String]) -> ClientListDisplayableResultPublisher {
        return Just(.success(createClientListDisplayable(isFeatured: false)))
            .setFailureType(to: Error.self)
            .delay(for: 0.2, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getClientListMembers(listId: String, sortBy: SelectedSortValue?) -> ClientListDisplayableResultPublisher {
        return Just(.success(createClientListDisplayable(isFeatured: listId.contains("featured"), sortBy: sortBy)))
            .setFailureType(to: Error.self)
            .delay(for: 0.2, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getClientLists() -> AnyPublisher<Result<ClientListSection, ErrorDisplayable>, Error> {
        let featuredLists: [ClientListDisplayable] = (0...5).map { _ in
            return createClientListDisplayable(isFeatured: true)
        }
        let personalLists: [ClientListDisplayable] = (0...5).map { _ in
            return createClientListDisplayable(isFeatured: false)
        }
        return Just(.success(ClientListSection(featured: ClientListSectionDisplayable(title: "Featured lists",
                                                                                      listTypeIdentifier: "identifier",
                                                                                      clientLists: featuredLists),
                                               personal: ClientListSectionDisplayable(title: "Personal lists",
                                                                                      listTypeIdentifier: "identifier2",
                                                                                      clientLists: personalLists))))
        .setFailureType(to: Error.self)
        .delay(for: 0.2, scheduler: DispatchQueue.main)
        .eraseToAnyPublisher()
    }

    func deleteClientList(listId: String) -> VoidResultPublisher {
        return Just(.success(()))
            .setFailureType(to: Error.self)
            .delay(for: 0.2, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func deleteClientListMember(memberId: String) -> VoidResultPublisher {
        return Just(.success(()))
            .setFailureType(to: Error.self)
            .delay(for: 0.2, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never> {
        return Just([]).eraseToAnyPublisher()
    }
}

extension NetworkAdapter {
    private func createClientListDisplayable(isFeatured: Bool, sortBy: SelectedSortValue? = nil) -> ClientListDisplayable {
        let backgroundImage: ImageSource? = isFeatured ? .url(URL(string: "https://source.unsplash.com/random")!) : nil
        return ClientListDisplayable(id: UUID().uuidString + (isFeatured ? "featured" : ""),
                                     listInfo: ClientListDisplayable.ListInfo(title: "Some client",
                                                                              subtitle: nil,
                                                                              backgroundImage: backgroundImage,
                                                                              tag: nil),
                                     members: [
                                        ClientMemberDisplayable(listMemberID: UUID().uuidString,
                                                                client: MemberRowDisplayable(id: UUID().uuidString,
                                                                                             title: "Jessy Pinkman",
                                                                                    
                                                                                             subtitles: [LabeledValue(label: "Last contacted date", value: "1 March 2022"),LabeledValue(label: "Last contacted date", value: "1 March 2022")],
                                                                                             segments: ["my client","vip"])),                     
                                        ClientMemberDisplayable(listMemberID: UUID().uuidString,
                                                                client: MemberRowDisplayable(id: UUID().uuidString,
                                                                                             title: "Walter White",
                                                                                    
                                                                                             subtitles: [LabeledValue(label: "Last contacted date", value: "1 March 2022"),LabeledValue(label: "Last contacted date", value: "1 March 2022")],
                                                                                             segments: ["my client"])),
                                     ],
                                     selectedSortValue: sortBy)
    }
}
