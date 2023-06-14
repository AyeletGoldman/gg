// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct FormFieldView<Title: View>: View {

    private let subtitle: String?
    private let tag: String?
    private let isRequired: Bool
    private let title: Title
    private let styleType: FormView.StyleType

    // This initializer is used when typed field holds all needed info
    @available(*, deprecated, message: "Deprecated on version 0.22.0. `FormView` has been deprecated in favor of `GenericFormView`. Use Generic Form instead.")
    init(typedField: TypedField, tag: String? = nil, @ViewBuilder title: () -> Title, styleType: FormView.StyleType) {
        self.subtitle = typedField.title
        self.tag = tag
        self.title = title()
        self.isRequired = false
        self.styleType = styleType
    }

    // This initializer is used when typed field holds all needed info
    public init(typedField: TypedField, tag: String? = nil, @ViewBuilder title: () -> Title) {
        self.subtitle = typedField.title
        self.tag = tag
        self.title = title()
        self.isRequired = false
        self.styleType = .normal
    }

    // This initializer is used for editable fields with added info
    public init(subtitle: String?, tag: String? = nil, isRequired: Bool = false, @ViewBuilder title: () -> Title) {
        self.subtitle = subtitle
        self.tag = tag
        self.isRequired = isRequired
        self.title = title()
        self.styleType = .normal // editable field suppose to have normal form style
    }

    public var body: some View {
        if let subtitle = self.subtitle {
            self.buildBodyWithSubtitle(subtitle)
        } else {
            self.buildBodyWithoutSubtitle()
        }
    }

    @ViewBuilder
    private func buildBodyWithSubtitle(_ subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                Text(verbatim: subtitle)
                    .style("subtitle")
                    .padding(.bottom, self.styleType == .normal ? 10 : 6)
                if self.isRequired {
                    MaisonKitImage(source: .styledImage(identifier: "icon-required"))
                        .frame(width: 12, height: 12)
                        .padding(.leading, 5)
                }
                if let tag = self.tag {
                    Spacer()
                    BadgeView(title: tag)
                        .badgeViewStyle(SecondaryBadgeViewStyle())
                }
            }
            self.title
                .style("title")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    private func buildBodyWithoutSubtitle() -> some View {
        HStack(alignment: .top, spacing: 0) {
            self.title
                .style("title")
                .frame(maxWidth: .infinity, alignment: .leading)
            if let tag = self.tag {
                Spacer()
                BadgeView(title: tag)
                    .badgeViewStyle(SecondaryBadgeViewStyle())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension View {
    @ViewBuilder
    func styleInputContent(styleType: FormView.StyleType = .normal, edges: Edge.Set = [.top, .bottom, .horizontal]) -> some View {
        self.padding(.top, edges.contains(.top) ? (styleType == .normal ? 17 : 13) : 0)
            .padding(.bottom, edges.contains(.bottom) ? (styleType == .normal ? 15 : 11) : 0)
            .padding(.horizontal, edges.contains(.horizontal) ? 12 : 0)
    }
}
