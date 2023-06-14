// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

protocol FilterButtonStyle {

    associatedtype Body: View

    typealias Configuration = FilterButtonStyleConfiguration

    func makeBody(configuration: Configuration) -> Self.Body

}

struct FilterButtonStyleConfiguration {

    struct Title: View {
        private let text: String

        init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(self.text)
        }
    }

    private(set) var title: FilterButtonStyleConfiguration.Title
    private(set) var isSelected: Bool
    private(set) var isEnabled: Bool
    private(set) var totalItems: Int?
}
