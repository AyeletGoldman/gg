// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

struct MKDisclosureGroup<Label: View>: View {

    private enum ContentStyle {
        case custom(AnyView)
        case text(String)
        case html(String)
    }

    private let label: Label
    private let content: ContentStyle
    @State private var contentHeight: CGFloat = 0
    @Binding private var isExpanded: Bool

    init<Content: View>(isExpanded: Binding<Bool>, label: () -> Label, content: () -> Content) {
        self.label = label()
        self.content = .custom(content().eraseToAnyView())
        self._isExpanded = isExpanded
    }

    var body: some View {
        VStack(spacing: 0) {
            Button {
                self.isExpanded.toggle()
            } label: {
                HStack {
                    self.label
                    Spacer()
                    MaisonKitImage(source: .styledImage(identifier: "icon-up"))
                        .frame(width: 20, height: 20)
                        .rotationEffect(.radians(self.isExpanded ? .pi : 0))
                }
            }
            .zIndex(1)
            .style("background")

            if self.isExpanded {
                Group {
                    switch self.content {
                    case .text(let content):
                        Text(verbatim: content)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 12)
                            .fixedSize(horizontal: false, vertical: true)
                            .style("body")
                    case .html(let content):
                        WebView(htmlSource: .string(content), contentHeight: self.$contentHeight)
                            .frame(height: self.contentHeight)
                            .padding(.bottom, 12)
                    case .custom(let view):
                        view
                    }
                }.transition(AnyTransition.move(edge: .top))
                .style("background")
            }
        }
        .clipped()
        .animation(.easeOut, value: self.isExpanded)
    }
}

extension MKDisclosureGroup where Label == AnyView {
    init(title: String, content: String, isExpanded: Binding<Bool>) {
        self._isExpanded = isExpanded
        self.label = MKDisclosureGroup.buildDefaultTitleLabel(with: title)
        self.content = .text(content)
    }
}

extension MKDisclosureGroup where Label == AnyView {
    init(title: String, htmlContent: String, isExpanded: Binding<Bool>) {
        self._isExpanded = isExpanded
        self.label = MKDisclosureGroup.buildDefaultTitleLabel(with: title)
        self.content = .html(htmlContent)
    }
}

private extension MKDisclosureGroup where Label == AnyView {
    static func buildDefaultTitleLabel(with title: String) -> Label {
        return Text(title)
            .padding(.vertical, 12)
            .style("title")
            .eraseToAnyView()
    }
}

struct MKDisclosureGroup_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            MKDisclosureGroup(title: "Title", content: "Content", isExpanded: .constant(false))
                .addStyledRowDivider()
            MKDisclosureGroup(title: "Title", content: "Content", isExpanded: .constant(false))
                .addStyledRowDivider()
            MKDisclosureGroup(title: "Title", content: "Content", isExpanded: .constant(false))
        }.inAllModes()
    }
}
