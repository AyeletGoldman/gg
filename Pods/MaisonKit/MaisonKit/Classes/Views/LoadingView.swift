// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

struct RedactedLoadingView<Wrapped: View>: View {

    let wrapped: Wrapped

    init(wrapped: () -> Wrapped) {
        self.wrapped = wrapped()
    }

    var body: some View {
        self.wrapped
            .redacted(reason: .placeholder)
            .disabled(true)
    }
}

public struct LoadingView: View {

    private enum Constants {
        static let rotationFull: Double = 360
        static let rotationNone: Double = 0
    }

    @State private var rotationAngle: Double = Constants.rotationNone

    private var animation: Animation {
        Animation.linear(duration: 1).repeatForever(autoreverses: false)
    }

    public init() { }

    public var body: some View {
        Group {
            MaisonKitImage(source: .styledImage(identifier: "icon-spinner"))
                .frame(width: 20, height: 20)
                .rotationEffect(Angle.degrees(self.rotationAngle))
                .animation(self.animation, value: self.rotationAngle)
                .onAppear { self.rotationAngle = Constants.rotationFull }
                .onDisappear { self.rotationAngle = Constants.rotationNone }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
