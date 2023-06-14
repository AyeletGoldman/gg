// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension ClientMemberDisplayable {
    static var loadingStateDisplayable: [ClientMemberDisplayable] {
        return (0..<10).map { _ in
            ClientMemberDisplayable(listMemberID: UUID().uuidString,
                                    client: MemberRowDisplayable(id: UUID().uuidString,
                                                                 title: "A client's name",
                                                                 subtitle: nil))
        }
    }
}
