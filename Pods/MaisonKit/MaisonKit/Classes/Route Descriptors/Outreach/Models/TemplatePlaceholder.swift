// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// An enum to define the options for filing data text into a template.
public enum TemplatePlaceholder {
    /// Replace `placeholder` text in the template with the given `replaceWith` text
    case replace(placeholder: String, replaceWith: String)
    /// Replace and repeat a section of text by given a list of arrays to be repeated
    /// - Parameters:
    ///   - repeatPrefix: The start of the text section to be repeated
    ///   - repeatSufix: The end of the text section to be repeated
    ///   - placeholders: An array of placeholders to be repeated
    case replaceRepeat(repeatPrefix: String, repeatSufix: String, placeholders: [[TemplatePlaceholder]])
}
