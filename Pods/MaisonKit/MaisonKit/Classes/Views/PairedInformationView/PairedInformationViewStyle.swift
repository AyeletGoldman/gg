// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

protocol PairedInformationViewStyle {

    typealias Configuration = PairedInformationViewStyleConfiguration

    associatedtype Body: View

    func makeBody(configuration: Self.Configuration) -> Self.Body
}

struct PairedInformationViewStyleConfiguration {
    let field: TypedField
}
