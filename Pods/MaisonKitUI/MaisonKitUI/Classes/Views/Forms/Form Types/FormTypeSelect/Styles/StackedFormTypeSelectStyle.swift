// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The stacked style for `FormTypeSelect`.
public struct StackedFormTypeSelectStyle: FormTypeSelectStyle {

    /// Creates a new `StackedFormTypeSelectStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                configuration.selectIcon
                configuration.image?.eraseToAnyView()
                configuration.title
                Spacer()
                configuration.tag?.eraseToAnyView()
            }
            if let subtitle = configuration.subtitle {
                HStack(spacing: 0) {
                    configuration.selectIcon.hidden()
                    configuration.image?.eraseToAnyView().hidden().frame(height: 1)
                    subtitle.eraseToAnyView()
                }
            }
        }
    }
}

public extension FormTypeSelectStyle where Self == StackedFormTypeSelectStyle {

    /// Convenience var to create a new `FormTypeSelectStyle` of type `StackedFormTypeSelectStyle`
    static var stacked: some FormTypeSelectStyle { return StackedFormTypeSelectStyle() }
}
