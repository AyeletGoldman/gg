// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension ClientListSection {
    static let loadingStateDisplayable: ClientListSection = {
        return ClientListSection(featured: ClientListSectionDisplayable(title: "Featured lists",
                                                                        listTypeIdentifier: "identifier",
                                                                        clientLists: (0...5).map { _ in ClientListDisplayable.featuredListLoadingStateDisplayable }),
                                 personal: ClientListSectionDisplayable(title: "Personal lists",
                                                                        listTypeIdentifier: "identifier2",
                                                                        clientLists: (0...5).map { _ in ClientListDisplayable.personalListLoadingStateDisplayable }))
    }()
}
