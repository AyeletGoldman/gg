// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// Holds all the informations related to the templates and the related languages
public struct TemplatesDisplayable {
    /// Array of templates to display
    public let templates: [Template]
    /// Array of available languages related to the templates
    public let languages: [TemplateLanguage]

    /// Creates an instance of TemplatesDisplayable
    /// - Parameters:
    ///   - templates: Array of templates to display
    ///   - languages: Array of available languages related to the templates
    public init(templates: [Template], languages: [TemplateLanguage]) {
        self.templates = templates
        self.languages = languages
    }
}
