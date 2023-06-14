// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

@available(*, deprecated, message: "Deprecated on version 0.22.0. `FormView` has been deprecated in favor of `GenericFormView`. Use Generic Form instead.")
struct FormView: View {

    enum StyleType {
        case normal
        case compact
    }

    private let sections: [DetailsSection]
    private let footer: AnyView?
    private let styleType: StyleType

    init<Footer: View>(sections: [DetailsSection], footer: (() -> Footer), styleType: StyleType = .normal) {
        self.sections = sections
        self.footer = footer().eraseToAnyView()
        self.styleType = styleType
    }

    init<Footer: View>(fields: [TypedField], footer: (() -> Footer), styleType: StyleType = .normal) {
        self.sections = [DetailsSection(fields: fields)]
        self.footer = footer().eraseToAnyView()
        self.styleType = styleType
    }

    init(sections: [DetailsSection], styleType: StyleType = .normal) {
        self.sections = sections
        self.footer = nil
        self.styleType = styleType
    }

    init(fields: [TypedField], styleType: StyleType = .normal) {
        self.sections = [DetailsSection(fields: fields)]
        self.footer = nil
        self.styleType = styleType
    }

    var body: some View {
        self.buildForm()
    }
}

extension FormView {

    /// A section to be shown in the form view with a title and a set of fields
    struct DetailsSection {

        /// Optional. The title for this section. This will be shown above the fields.
        let title: String?

        /// The set of fields to be displayed in the section. Each field will be separated
        /// from the previous by some whitespace and possibly a divider, similar to a table view.
        let fields: [TypedField]

        /// Creates a new `DetailsSection`
        /// - Parameters:
        ///   - title: Optional. The title for this section. This will be shown above the fields. Defaults to `nil`.
        ///   - fields: The set of fields to be displayed in the section. Each field will be separated
        ///   from the previous by some whitespace and possibly a divider, similar to a table view.
        init(title: String? = nil, fields: [TypedField]) {
            self.title = title
            self.fields = fields
        }
    }
}

extension FormView {
    @ViewBuilder func buildForm() -> some View {
        MKList {
            self.buildContent()
        }
    }

    @ViewBuilder private func buildContent() -> some View {
        Group {
            ForEach(0..<self.sections.count, id: \.self) { index in
                if !self.sections[index].fields.isEmpty {
                    self.buildSection(title: self.sections[index].title, with: self.sections[index].fields)
                }
            }
            self.footer
                .padding(.top, 10)
                .padding(.bottom, 20)
            Color.clear.frame(height: 20)
        }
        .padding(.horizontal)
    }

    @ViewBuilder private func buildSection(title: String?, with fields: [TypedField]) -> some View {
        Group {
            Color.clear.frame(height: 20)
            if let title = title {
                FormSectionHeaderView(title: title)
            }
            self.buildSectionFields(with: fields)
            Color.clear.frame(height: 20)
        }
    }

    @ViewBuilder private func buildSectionFields(with fields: [TypedField]) -> some View {
        ForEach(fields, id: \.id) { field in
            FormTextFieldView(typedField: field, styleType: self.styleType)
                .addStyledRowDivider(if: self.styleType == .normal || field.id != fields.last?.id)
        }
    }
}
