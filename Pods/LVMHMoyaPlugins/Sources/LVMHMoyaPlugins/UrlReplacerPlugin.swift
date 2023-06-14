//
//  Copyright © 2019 LVMH. All rights reserved.
//

import Foundation

import Moya

/// Plugin to replace regex matches sections of a url.
///
/// Obviously, this is a Bad Idea and you should avoid it if possible.
///
/// However, if you do need to replace part of the url which can't be identified (i.e. it's not just the host
/// or the path) then this will do that.
public final class UrlReplacerPlugin: PluginType {

    /// The expression to apply to the incoming url - matches of this will be replaced
    private let needle: String

    /// Method to fetch the replacement for a given `URLRequest`
    private let replacement: (URLRequest) -> String

    // MARK: Replace with regex

    public init(instancesMatching expression: String, with replacement: @escaping (URLRequest) -> String) {
        self.needle = expression
        self.replacement = replacement
    }

    public convenience init(instancesMatching expression: String, with replacement: String) {
        self.init(instancesMatching: expression, with: { _ in replacement })
    }

    // MARK: Replace all instances

    public convenience init(instancesOf needle: String, with replacement: @escaping (URLRequest) -> String) {
        self.init(instancesMatching: NSRegularExpression.escapedPattern(for: needle), with: replacement)
    }

    public convenience init(instancesOf needle: String, with replacement: String) {
        self.init(instancesOf: needle, with: { _ in replacement })
    }

    // MARK: Replace starting text

    public convenience init(starting: String, with replacement: @escaping (URLRequest) -> String) {
        self.init(instancesMatching: "^" + NSRegularExpression.escapedPattern(for: starting), with: replacement)
    }

    public convenience init(starting: String, with replacement: String) {
        self.init(starting: starting, with: { _ in replacement })
    }

    // MARK: PluginType methods

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        // Sanity. It's technically possible that the request didn't get given a valid URL
        guard let originalUrlString = request.url?.absoluteString else { return request }

        // Get the replacement and apply it to the original url
        let replacementString = self.replacement(request)
        let replacedUrlString = originalUrlString.replacingOccurrences(of: self.needle,
                                                                       with: replacementString,
                                                                       options: [ .regularExpression,
                                                                                  .caseInsensitive ])

        guard let replacedUrl = URL(string: replacedUrlString) else { return request }

        // Return the modified request, which takes 3 lines in Swift because Immutability
        var request = request
        request.url = replacedUrl
        return request
    }
}
