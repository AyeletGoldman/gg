// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension ClientListDisplayable {
    static var featuredListLoadingStateDisplayable: ClientListDisplayable {
        return ClientListDisplayable(id: UUID().uuidString,
                                     listInfo: ClientListDisplayable.ListInfo(title: "Some list title",
                                                                              subtitle: nil,
                                                                              backgroundImage: .url(URL(string: "https://www.example.com")!),
                                                                              tag: nil),
                                     members: nil,
                                     totalNumberOfClients: 300)
    }

    static var personalListLoadingStateDisplayable: ClientListDisplayable {
        return ClientListDisplayable(id: UUID().uuidString,
                                     listInfo: ClientListDisplayable.ListInfo(title: "Some list title",
                                                                              subtitle: nil,
                                                                              backgroundImage: nil,
                                                                              tag: nil),
                                     members: nil,
                                     totalNumberOfClients: 300)
    }
}
