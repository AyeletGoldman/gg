//
//  Copyright © 2019 LVMH. All rights reserved.
//

import Foundation

import Moya

// Q: Why are we including Result here?
// A: https://github.com/Moya/Moya/issues/1840#issuecomment-536610277
#if canImport(Result)
import Result
#endif

/// Dumps out request information to the console.
///
/// Q: Why choose this instead of the default Moya network logger?
/// A: So we can filter the details about each request
///
/// It's really simple to use, and has some sensible defaults. the options enum is commented, so look there for what you can / can't do.
///
/// ```
/// LoggerPlugin(options: [
///     .outputHeaders,
///     .outputBody(prettyPrint: true, pastable: false)
/// ])
/// ```
public final class LoggerPlugin: PluginType {

    // MARK: Types

    public typealias OutputFunction = (_ line: String) -> Void

    /// User this to configure what sections of a request/response are output by the logger
    public enum OutputOptions: Equatable {
        /// The headers on requests and responses will be included in the output
        case outputHeaders

        /// The body data will be included in the output
        ///
        /// - parameter prettyPrint: Attempts to format the body if possible - defaults to `true`
        /// - parameter pastable: Remove styling in the log so the body can be cut/paste easily. Defaults to `false`
        case outputBody(prettyPrint: Bool = true, pastable: Bool = false)
    }

    // The default options
    private static let defaultOptions: [OutputOptions] = [ .outputHeaders,
                                                           .outputBody(prettyPrint: true, pastable: false) ]

    // MARK: Properties

    /// Log lines from this logger are created and output from a background queue - this should help if the body is
    /// large and needs formatting before it is output.
    ///
    /// - note: There is a single queue for all `MoyaLogger` instances, so their logs shouldn't interfere
    /// with each other.
    private static let loggingQueue = DispatchQueue(label: "fr.lvmh.api.logger", qos: .utility, attributes: [])

    private let options: [OutputOptions]
    private let output: OutputFunction

    // MARK: Constructors

    /// Create a new `LVMHLoggerPlugin`
    ///
    /// - parameter options: _(optional)_ Pass in options to configure the behaviour of the logger, defaults to
    ///                      outputting everything.
    /// - parameter outputFunction: _(optional)_ Pass in a method to output each line from the logger.
    ///                             Defaults to `Swift.print`, which is probably what you wanted all along.
    public init(options: [OutputOptions]? = nil, outputFunction: @escaping OutputFunction = { print($0) }) {
        self.options = options ?? LoggerPlugin.defaultOptions
        self.output = outputFunction
    }

    // MARK: Plugin methods

    public func willSend(_ request: RequestType, target: TargetType) {
        let request = request.request

        self.logRequest(path: request?.url?.absoluteString,
                        method: request?.httpMethod,
                        headers: request?.allHTTPHeaderFields,
                        body: request?.httpBody)
    }

    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .failure(.statusCode(let response)):
            self.logResponse(statusCode: response.statusCode,
                             path: response.response?.url?.absoluteString,
                             method: response.request?.httpMethod,
                             headers: response.response?.allHeaderFields,
                             body: response.data)
        case .failure(let error):
            self.logResponseError(error)

        case .success(let response):
            self.logResponse(statusCode: response.statusCode,
                             path: response.response?.url?.absoluteString,
                             method: response.request?.httpMethod,
                             headers: response.response?.allHeaderFields,
                             body: response.data)
        }
    }

    // MARK: Private methods

    private func logRequest(path: String?, method: String?, headers: [AnyHashable: Any]?, body: Data?) {
        self.log(title: "REQUEST", path: path, method: method, headers: headers, body: body)
    }

    private func logResponse(statusCode: Int, path: String?, method: String?, headers: [AnyHashable: Any]?, body: Data?) {
        self.log(title: "RESPONSE \(self.iconForStatusCode(statusCode)) (\(statusCode))",
                 path: path,
                 method: method,
                 headers: headers,
                 body: body)
    }

    private func logResponseError(_ error: Error) {
        let output = self.output

        LoggerPlugin.loggingQueue.async {
            output(" ┌── RESPONSE")
            output("\(error)".prefixEachLine(with: " │ "))
            output(" └──")
        }
    }

    private func iconForStatusCode(_ code: Int) -> String {
        switch code {
        case 200..<300: return "✅"
        default: return "❌"
        }
    }

    private func log(title: String, path: String?, method: String?, headers: [AnyHashable: Any]?, body: Data?) {
        let output = self.output

        // There are a few ways to format the data in the body, depending on the options etc
        var bodyFormatters: [(Data) -> String?] = [
            { String(data: $0, encoding: .utf8) },
            { String(describing: $0) }
        ]

        if self.options.shouldPrettyPrintBody {
            bodyFormatters.insert({ $0.asPrettyJsonString }, at: 0)
        }

        LoggerPlugin.loggingQueue.async {
            // It's easier to work with headers if they aren't optional anymore
            let headers = headers ?? [:]

            output(" ┌── \(title)")

            output(" │ \(method?.uppercased() ?? "<unknown method>") \(path ?? "<unknown path>")")

            if self.options.contains(.outputHeaders) {
                output(" ├─ Headers")

                if headers.isEmpty {
                    output(" │ No headers sent")
                }

                for key in headers.keys.sorted(by: { String(describing: $0) < String(describing: $1) }) {
                    let value = headers[key] ?? ""
                    output(" │ \(key): \(value)")
                }
            }

            if let body = body, !body.isEmpty, self.options.shouldOutputBody {
                output(" ├─ Body")

                // Do our best to format the body correctly
                var bodyString = bodyFormatters.lazy.compactMap { $0(body) }.first ?? "Could not format body data"

                if !self.options.shouldOutputPastableBody {
                    bodyString = bodyString.prefixEachLine(with: " │ ")
                }

                output(bodyString)
            }

            output(" └──")
        }
    }
}

// MARK: Internal extensions

private extension String {

    func prefixEachLine(with prefix: String, finalLine: String? = nil) -> String {
        let finalLine = finalLine ?? prefix

        var prefixed = prefix + self.replacingOccurrences(of: "\n", with: "\n\(prefix)")

        if let lastRange = prefixed.range(of: prefix, options: [ .backwards ], range: nil, locale: nil) {
            prefixed = prefixed.replacingCharacters(in: lastRange, with: finalLine)
        }

        return prefixed
    }
}

private extension Data {

    /// Returns the reciever as a pretty printed JSON string, or `nil` if the reciever isn't a valid json object.
    var asPrettyJsonString: String? {
        /// Parse it into a JSON object
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []) else {
            return nil
        }

        // Serialize it to JSON data, but pretty
        guard let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: [ .prettyPrinted ]) else {
            return nil
        }

        // Return it as a string
        return String(data: data, encoding: .utf8)
    }
}

private extension Sequence where Element == LoggerPlugin.OutputOptions {

    var shouldPrettyPrintBody: Bool {
        return self.contains { element in
            guard case .outputBody(let prettyPrint, _) = element else { return false }
            return prettyPrint
        }
    }

    var shouldOutputPastableBody: Bool {
        return self.contains { element in
            guard case .outputBody(_, let pastable) = element else { return false }
            return pastable
        }
    }

    var shouldOutputBody: Bool {
        return self.contains { element in
            guard case .outputBody = element else { return false }
            return true
        }
    }
}
