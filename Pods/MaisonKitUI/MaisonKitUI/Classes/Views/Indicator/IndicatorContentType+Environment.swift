// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var indicatorContentType: IndicatorContentType? {
        get { self[IndicatorContentType.self] }
        set { self[IndicatorContentType.self] = newValue }
    }
}

extension IndicatorContentType: EnvironmentKey {
    public static var defaultValue: IndicatorContentType?
}

public extension View {

    /// Add indicator to a view. The indicator will be shown only in case the content type isn't nil.
    /// - Parameter contentType: Optional. The indicator content type.
    /// - Returns: The view with the indicator passed as an environment variable
    func withIndicator(_ contentType: IndicatorContentType?) -> some View {
        self.environment(\.indicatorContentType, contentType)
    }
}
