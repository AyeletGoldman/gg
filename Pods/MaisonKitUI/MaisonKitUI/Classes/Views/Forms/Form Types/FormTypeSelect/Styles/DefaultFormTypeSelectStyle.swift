// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The default form type Select style.
public struct DefaultFormTypeSelectStyle: FormTypeSelectStyle {

    /// Creates a new `DefaultFormTypeSelectStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.selectIcon
            configuration.image?.eraseToAnyView()
            configuration.title
            Spacer()
            configuration.subtitle?.eraseToAnyView()
                .lineLimit(1)
                .padding(.leading, 5)
            configuration.tag?.eraseToAnyView()
        }
    }
}

public extension FormTypeSelectStyle where Self == DefaultFormTypeSelectStyle {

    /// Convenience var to create a new `FormTypeSelectStyle` of type `DefaultFormTypeSelectStyle`
    static var `default`: some FormTypeSelectStyle { return DefaultFormTypeSelectStyle() }
}
