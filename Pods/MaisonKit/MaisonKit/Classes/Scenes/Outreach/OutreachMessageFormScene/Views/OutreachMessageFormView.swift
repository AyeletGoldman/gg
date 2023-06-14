// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import Combine
import StylableSwiftUI

struct OutreachMessageFormView: View {

    private enum Labels {
        static let outreachMessageInputSubjectTitle = MKLocalizedString("outreach.message.input.subject.title",
                                                                        comment: "Title for subject input field in outreach")
        static let outreachMessageInputSubjectPlaceholder = MKLocalizedString("outreach.message.input.subject.placeholder",
                                                                              comment: "Placeholder for subject line when editing a message in outreach")
        static let outreachMessageInputMessageTitle = MKLocalizedString("outreach.message.input.message.title",
                                                                        comment: "Title for message input field in outreach")
        static let outreachMessageInputMessagePlaceholder = MKLocalizedString("outreach.message.input.message.placeholder",
                                                                              comment: "Placeholder for message line when editing a message in outreach")
    }

    @ObservedObject var viewModel: OutreachMessageViewModel

    init(viewModel: OutreachMessageViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        self.buildForm()
            .padToAvoidKeyboardIfNeeded()
    }

    @ViewBuilder
    private func buildForm() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if self.viewModel.messageFieldType == .html {
                self.buildHtmlPreviewFields()
                    .withNoticeText(text: self.viewModel.noticeText)
            } else {
                self.buildTextFields()
            }
            Spacer()
        }
        .style("background")
    }

    @ViewBuilder private func buildTextFields() -> some View {
        Spacer().frame(height: 20)
        if self.viewModel.shouldShowSubject {
            self.buildSubjectField()
        }
        self.buildMessageField()
    }

    @ViewBuilder
    private func buildHtmlPreviewFields() -> some View {
        if self.viewModel.shouldShowSubject {
            self.buildSubjectField()
        }
        WebView(htmlSource: .string(self.viewModel.message))
            .padding(.top)
    }

    @ViewBuilder
    private func buildSubjectField() -> some View {
        FormFieldView(subtitle: Labels.outreachMessageInputSubjectTitle, isRequired: self.viewModel.isSubjectRequired) {
            if self.viewModel.isSubjectEditable {
                TextField(self.$viewModel.subject).placeHolder(Text(Labels.outreachMessageInputSubjectPlaceholder),
                                                               shouldShow: self.viewModel.subject.isEmpty)
                    .frame(height: 22)
            } else {
                Text(verbatim: self.viewModel.subject)
            }
        }
        .styleInputContent()
        .styleAsInputRow(isBlurred: self.viewModel.subject.isEmpty, includeDivider: true)
    }

    @ViewBuilder
    private func buildMessageField() -> some View {
        FormFieldView(subtitle: Labels.outreachMessageInputMessageTitle, isRequired: self.viewModel.isMessageRequired) {
            MultilineTextField(Labels.outreachMessageInputMessagePlaceholder,
                               text: self.$viewModel.message)
                .frame(minHeight: 22)
        }
        .styleInputContent(edges: [.top, .horizontal])
        .styleAsInputRow(isBlurred: self.viewModel.message.isEmpty)
    }
}
