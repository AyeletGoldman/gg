// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A representation of a template.
public struct Template: Identifiable, Equatable {

    private enum Labels {
        static let blankTemplateName = MKLocalizedString("outreach.templates.blank-template.name",
                                                         comment: "Title for the 'No template' default template")
        static let blankTemplatePreview = MKLocalizedString("outreach.templates.blank-template.preview",
                                                            comment: "Preview for the 'No template' default template")
    }

    /// Different types of content
    public enum ContentType {
        case text
        case html
    }

    /// Unique id of the template
    public let id: String
    /// The template name
    public let name: String
    /// The template's language code, in two-character ISO-639-1
    public let languageCode: String
    /// The subject of the template (for email)
    public let subject: String?
    /// The preview of the template
    public let preview: String?
    /// The content of the template
    public let content: String
    /// The template content type
    public let contentType: ContentType
    /// A boolean to define if it's a blank template that doen't related to any language
    public let skipsFiltering: Bool

    /// A constant to define a blank template should be shown for all languages option.
    public static let blankTemplate = Template(
        id: "__BLANK_TEMPLATE__",
        name: Labels.blankTemplateName,
        languageCode: "",
        preview: Labels.blankTemplatePreview,
        content: "",
        contentType: .text,
        skipsFiltering: true
    )

    /// Creates an instance of `Template`
    /// - Parameters:
    ///   - id: Unique id of the template
    ///   - name: The template name
    ///   - languageCode: The template's language code, in two-character ISO-639-1
    ///   - subject: The subject of the template (for email)
    ///   - preview: The preview of the template
    ///   - content: The content of the template
    ///   - contentType: The template content type
    ///   - skipsFiltering: A boolean to define if it's a blank template that doen't related to any language
    public init(
        id: String,
        name: String,
        languageCode: String,
        subject: String? = nil,
        preview: String? = nil,
        content: String,
        contentType: ContentType,
        skipsFiltering: Bool = false) {
        self.id = id
        self.name = name
        self.languageCode = languageCode
        self.subject = subject
        self.preview = preview
        self.content = content
        self.contentType = contentType
        self.skipsFiltering = skipsFiltering
    }
}
