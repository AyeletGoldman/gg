// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct Client360HeaderView: View {

    private enum Labels {
        static let clientIDCopiedMessage = MKLocalizedString("client360.header.toast-message.client-id-copied.title",
                                                             comment: "The message to show when a user copies the client ID in client 360")
    }

    private let headerInfo: ResultState<Client360Displayable.Header, ErrorDisplayable>

    init(headerInfo: ResultState<Client360Displayable.Header, ErrorDisplayable>) {
        self.headerInfo = headerInfo
    }

    var body: some View {
        StylableGroup("navbar-profile") {
            ResultStateViewBuilder(result: self.headerInfo).setLoadingView {
                self.buildMainView(header: .loadingData)
            }
            .buildContent { header in
                self.buildMainView(header: header)
            }
        }
    }

    @ViewBuilder
    private func buildMainView(header: Client360Displayable.Header) -> some View {
        VStack(spacing: 0) {
            VStack(spacing: 24) {
                self.buildHeader(clientId: header.clientId, clientLocalName: header.clientLocalName, tags: header.segments)
                self.buildAdditionalInformationViews(additionalInformation: header.additionalInformation)
            }
            .padding(.top, 8)
            .padding(.bottom, 30)
            .padding(.horizontal, 4)
        }.style("background")
    }

    @ViewBuilder
    private func buildHeader(clientId: String?, clientLocalName: String?, tags: [Client360Displayable.HeaderTag]) -> some View {
        VStack(alignment: .center, spacing: 8) {
            if let clientLocalName {
                Text(verbatim: clientLocalName).style("title")
            }
            if !tags.isEmpty {
                self.buildTagsView(tags: tags)
            }
            if let clientId {
                TertiaryButton.copyableText(textToCopy: clientId, toastMessage: Labels.clientIDCopiedMessage)
            }
        }.frame(maxWidth: .infinity)
    }

    private func buildAdditionalInformationViews(additionalInformation: [TypedField]) -> some View {
        let itemsInPairs = Array(additionalInformation.pairs)
        return PairedInformationView(pairs: itemsInPairs).pairedInformationViewStyle(.block)
    }

    @ViewBuilder
    private func buildTagsView(tags: [Client360Displayable.HeaderTag]) -> some View {
        HStack(spacing: 4) {
            ForEach(tags, id: \.self) { tag in
                self.createBadgeView(for: tag)
            }
            if self.headerInfo.value?.isMyCustomer == true {
                BadgeView(icon: "icon-mine").badgeViewStyle(IconBadgeViewStyle())
            }
        }
    }

    @ViewBuilder
    private func createBadgeView(for tag: Client360Displayable.HeaderTag) -> some View {
        switch tag.variant {
        case .primary:
            BadgeView(title: tag.title)
                .badgeViewStyle(PrimaryBadgeViewStyle())
        case .secondary:
            BadgeView(title: tag.title)
                .badgeViewStyle(SecondaryBadgeViewStyle())
        }
    }
}

extension Client360Displayable.Header {
    static var loadingData: Client360Displayable.Header {
        return Client360Displayable.Header(clientId: "This is loading",
                                           clientName: "Mr Example Example",
                                           segments: [Client360Displayable.HeaderTag(title: "VIP"),
                                                      Client360Displayable.HeaderTag(title: "HERO"),
                                                      Client360Displayable.HeaderTag(title: "PERSON")],
                                           additionalInformation: [
                                            TypedField(title: "Example",
                                                       value: .datetime(Date(), nil),
                                                       isCopyable: false,
                                                       icon: nil),
                                            TypedField(title: "Loading",
                                                       value: .datetime(Date(), nil),
                                                       isCopyable: false,
                                                       icon: nil)
                                           ])
    }
}
