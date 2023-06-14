// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension String {
    /// Asks to replace part of the string with defined placeholders.
    /// - Parameter placeholders: the placeholders to replace in the string. Each placeholder defines the given string to replace + the given string value to replace with.
    /// - Returns: the string result after the placeholders replacements.
    func replace(placeholders: [TemplatePlaceholder]) -> String {
        var str = self
        placeholders.forEach { placeholder in
            switch placeholder {
            case .replace(let placeholder, let replaceWith):
                str = str.replacingOccurrences(of: placeholder, with: replaceWith)
            case .replaceRepeat(let repeatPrefix, let repeatSufix, let placeholders):
                str = str.replaceRepeat(repeatPrefix: repeatPrefix, repeatSufix: repeatSufix, placeholders: placeholders)
            }
        }
        return str
    }

    /// Asks to replace and repeat part of the string with defined placeholders.
    /// - Parameters:
    ///   - repeatPrefix: the string that defines the place to start the repeat (this string will be removed from the string)
    ///   - repeatSufix: the string that defines the place to stop the repeat (this string will be removed from the string)
    ///   - placeholders: two-dimensional list of placeholders. the repeat will work as count as the top list level.
    ///   Each repeat will take the inner placeholder list and will try to replace them inside the string to be repeated.
    /// - Returns: the string result after the placeholders replacements.
    func replaceRepeat(repeatPrefix: String, repeatSufix: String, placeholders: [[TemplatePlaceholder]]) -> String {
        var newTemplateText = self
        guard let regularExpression = try? NSRegularExpression(pattern: "\(repeatPrefix)(.+)\(repeatSufix)", options: [.dotMatchesLineSeparators]) else {
            return newTemplateText
        }
        let matches = regularExpression.matches(
            in: self,
            options: [],
            range: NSRange(location: 0, length: self.utf16.count)
        )
        for match in matches {
            let replaceOf = (self as NSString).substring(with: match.range)
            let itemTemplate = replaceOf
                .replacingOccurrences(of: repeatPrefix, with: "")
                .replacingOccurrences(of: repeatSufix, with: "")
            let itemReplacedText: [String] = placeholders.map {
                itemTemplate.replace(placeholders: $0)
            }
            let replaceWith = itemReplacedText.joined()
            newTemplateText = newTemplateText.replacingOccurrences(of: replaceOf, with: replaceWith)
        }
        return newTemplateText
    }
}

public extension TemplatesDisplayable {
    /// Creates an instance of TemplatesDisplayable by given placeholders to replace in the templates
    /// - Parameters:
    ///   - templates: Array of templates to display including placeholders to replace inside subject, preview and content fields.
    ///   - languages: Array of available languages related to the templates
    ///   - placeholders: Array of placeholders to replace in the templates (subject, preview and content)
    init(templates: [Template], languages: [TemplateLanguage], placeholders: [TemplatePlaceholder]) {
        let templates = templates.map {
            Template(id: $0.id,
                     name: $0.name,
                     languageCode: $0.languageCode,
                     subject: $0.subject?.replace(placeholders: placeholders),
                     preview: $0.preview?.replace(placeholders: placeholders),
                     content: $0.content.replace(placeholders: placeholders),
                     contentType: $0.contentType,
                     skipsFiltering: $0.skipsFiltering)
        }
        self.init(templates: templates, languages: languages)
    }
}
