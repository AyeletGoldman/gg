// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import UIKit
import StylableSwiftUI
import SwiftUI

struct IntermediaryView: View {

    private enum Labels {
        static let intermediaryText = MKLocalizedString("authentication.intermediary.title",
                                                        comment: "The text to show to the user while we are verifying they are logged in")
    }

    var body: some View {
        return StylableGroup("login") {
            SplashView {
                VStack {
                    Text(verbatim: Labels.intermediaryText)
                        .style("title")
                    LoadingView()
                }
            }
        }
    }
}

struct SplashView<Content: View>: View {

    private enum Constants {
        static var verticalSpacing: CGFloat { 20 }
        static var topSpacerLayoutPriority: Double { 2 }
        static var bottomSpacerHeight: CGFloat { 60 }
        static var logoSize: CGSize { CGSize(width: 220, height: 220) }
    }

    let content: Content

    init(content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: Constants.verticalSpacing) {
                Spacer().layoutPriority(Constants.topSpacerLayoutPriority)
                self.content
                AppVersionView(textStyle: "subtitle")
                Spacer().frame(height: Constants.bottomSpacerHeight)
            }
            .frame(maxWidth: .infinity)
            MaisonKitImage(source: .styledImage(identifier: "logo"))
                .allowsHitTesting(false)
                .frame(width: Constants.logoSize.width,
                       height: Constants.logoSize.height)
        }
        .style("background")
        .edgesIgnoringSafeArea(.all)
    }
}
