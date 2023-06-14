// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension ToastViewPresenter {

    /// The edges available for presentation of a `ToastView`
    enum Edge {
        /// Indicates the toast view should be presented from the top of the screen
        case top
        /// Indicates the toast view should be presented from the bottom of the screen
        case bottom

        /// Returns `true` if the `Edge` is `.top`
        public var isTop: Bool {
            switch self {
            case .top: return true
            case .bottom: return false
            }
        }

        /// Returns `true` if the `Edge` is `.bottom`
        public var isBottom: Bool {
            return !self.isTop
        }
    }
}
