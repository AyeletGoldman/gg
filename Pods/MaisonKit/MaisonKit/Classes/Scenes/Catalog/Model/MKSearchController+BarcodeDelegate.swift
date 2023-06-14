// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

final class BarcodeDelegate: NSObject, UISearchBarDelegate {

    private let onTapBarcodeButton: () -> Void

    init(onTapBarcodeButton: @escaping () -> Void) {
        self.onTapBarcodeButton = onTapBarcodeButton
    }

    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        self.onTapBarcodeButton()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsBookmarkButton = false
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsBookmarkButton = true
    }
}

extension MKSearchController {
    func setupSearchBarForBarcodeScanIfNecessary(stylist: Stylist, delegate: BarcodeDelegate?) {
        guard Features.manager.isEnabled(.scanBarcode, defaultValue: false), let delegate else { return }

        self.searchBar.showsBookmarkButton = true
        self.searchBar.setImage(stylist.uiImage(for: "search/icon-qr"),
                                for: .bookmark,
                                state: .normal)
        self.searchBar.delegate = delegate
    }
}
