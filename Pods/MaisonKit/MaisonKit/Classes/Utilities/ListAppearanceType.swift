// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct ListAppearance {
    static var appearanceContainer: UIAppearanceContainer.Type {
        if #available(iOS 16.0, *) {
            // This should be `UICollectionView.self` but in `List`s in iOS16
            // you can't actually remove section header padding so we have to
            // use a mix of UIScrollView and `LazyVStack`.
            return UIScrollView.self
        } else {
            return UITableView.self
        }
    }
}
