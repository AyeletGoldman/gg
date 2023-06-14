// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The source of HTML
public enum HTMLSource {
    /// Load the HTML from a given URL
    case url(URL)
    /// The HTML is the associated value in this case
    case string(String)
}
