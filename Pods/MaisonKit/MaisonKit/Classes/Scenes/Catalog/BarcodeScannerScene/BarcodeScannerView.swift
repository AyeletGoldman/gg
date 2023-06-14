//  Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct BarcodeScannerView: View {

    private enum Labels {
        static let title = MKLocalizedString("barcode-scanner.scan-barcode.title",
                                             comment: "Title for the scan barcode screen")
        static let subtitle = MKLocalizedString("barcode-scanner.scan-barcode.subtitle",
                                                comment: "Subtitle for the scan barcode screen which informs the user of what they need to do to open a product page")
        static let enableCameraButtonTitle = MKLocalizedString("barcode-scanner.enable-camera.button.title",
                                                comment: "Title for the button that tells users to enable camera use")
        static let openSettignsButtonTitle = MKLocalizedString("barcode-scanner.open-settings.button.title",
                                                comment: "Title for the button that tells users to open the settings app to enable camera use")
    }

    @ObservedObject private var viewModel: BarcodeScannerViewModel

    init(viewModel: BarcodeScannerViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    private var requestAuthorizationButton: some View {
        StylableGroup("button-icon-left") {
            Button(action: self.viewModel.didTapGrantAccess, label: {
                Label(title: {
                    Text(Labels.enableCameraButtonTitle)
                        .style("title")
                },
                      icon: {
                    MaisonKitImage(source: .styledImage(identifier: "icon-camera"))
                        .frame(width: 20, height: 20)
                }).frame(maxWidth: .infinity, maxHeight: .infinity)
            }).style("background")
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            Text(Labels.title)
                .style("title")
            Text(Labels.subtitle)
                .style("subtitle")
                .padding(.top, 8)
            StylableGroup("camera-view") {
                Group {
                    switch self.viewModel.authorizationStatus {
                    case .authorized:
                        BarcodeScannerCameraView { reference in
                            self.viewModel.didFindProductReference(reference)
                        }
                    case .notDetermined, .denied, .restricted:
                        self.requestAuthorizationButton
                    @unknown default:
                        self.requestAuthorizationButton
                    }
                }
                .frame(height: 180)
                .style("background")
                .padding(.top, 16)
            }
            Spacer()
        }.padding(.horizontal)
            .style("Background")
    }
}
