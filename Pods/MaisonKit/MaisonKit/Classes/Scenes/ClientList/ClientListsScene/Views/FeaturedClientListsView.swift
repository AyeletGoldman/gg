// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

/// Featured client lists view.
public struct FeaturedClientListsView: View {

    private let clientLists: [ClientListDisplayable]
    private let sectionTitle: String
    private let presentMemberListScene: (String) -> Void

    /// Creates a new `FeaturedClientListsView`
    /// - Parameters:
    ///   - clientLists: The client lists.
    ///   - sectionTitle: The section title.
    ///   - presentMemberListScene: A closure to perform to navigate to member list scene.
    public init(clientLists: [ClientListDisplayable],
                sectionTitle: String,
                presentMemberListScene: @escaping (String) -> Void) {
        self.clientLists = clientLists
        self.sectionTitle = sectionTitle
        self.presentMemberListScene = presentMemberListScene
    }

    public var body: some View {
        CarouselView(title: sectionTitle,
                     numberOfItems: self.clientLists.count,
                     itemAtIndex: { index, _ in
            CardView(viewModel: CardViewModel(item: self.clientLists[index].summaryDisplayable(self.clientLists[index])))
        },
                     onItemSelected: { index in
            self.presentMemberListScene(self.clientLists[index].id)
        })
    }
}

private extension CardViewModel {
    init(item: ClientListDisplayable.SummaryDisplayable) {
        let imageSource: ImageSource = item.backgroundImage != nil ? item.backgroundImage! : .system(name: "blank")
        self.init(id: item.id,
                  imageSource: imageSource,
                  topText: item.tag,
                  title: item.title,
                  subtitle: item.subtitle)
    }
}
