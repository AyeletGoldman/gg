// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A simple HTML builder that creates an HTML string to be displayed in a webview.
struct HTMLBuilder {
    private let style: String?

    /// Creates a new HTMLBuilder.
    /// - Parameter cssString: A css string to insert into a `style` tag in the header of the rendered HTML.
    init(cssString: String?) {
        self.style = cssString
    }

    /// Creates an HTML string that can be used to display in a view.
    /// The content is expected to be an HTML string that could be inserted in a `body` tag. Any `script` or `a` tags
    /// are removed from the content before display.
    /// - Parameter content: an HTML string that will be inserted into a `body` tag that
    /// will be styled with the CSS that this builder was created with.
    /// - Returns: A fully-formed, valid HTML string, ready for display in a webview.
    func build(content: String) -> String {
        // As a minimum precaution, we wemove `script` and `a` tags.
        let cleanedContent = content
            .replacingOccurrences(of: "<script>[^>]+</script>", with: "", options: .regularExpression, range: nil)
            .replacingOccurrences(of: "<a>[^>]+</a>", with: "", options: .regularExpression, range: nil)
        let htmlString = """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style>
                    {{style}}
                </style>
            </head>
            <body>
                {{content}}
            </body>
        </html>
        """
            .replacingOccurrences(of: "{{style}}", with: self.style ?? "")
            .replacingOccurrences(of: "{{content}}", with: cleanedContent)

        return htmlString
    }
}
