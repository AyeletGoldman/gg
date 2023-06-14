// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import Combine
import WebKit

protocol WebViewNavigationDelegate: AnyObject {

    func didStartNavigating(to url: URL)

    func didFinishNavigating(to url: URL)

    func didFailNavigation(to url: URL, with error: Error)

    func shouldAllowNavigation(to url: URL) -> WKNavigationActionPolicy
}

extension WebViewNavigationDelegate {

    func didStartNavigating(to url: URL) { }

    func didFinishNavigating(to url: URL) { }

    func didFailNavigation(to url: URL, with error: Error) { }

    func shouldAllowNavigation(to url: URL) -> WKNavigationActionPolicy {
        return .allow
    }
}

/// A container for using a WKWebView in SwiftUI
struct WebView: UIViewRepresentable {

    class Coordinator: NSObject, WKNavigationDelegate {

        private weak var delegate: WebViewNavigationDelegate?

        @Binding private var contentHeight: CGFloat

        init(delegate: WebViewNavigationDelegate?, contentHeight: Binding<CGFloat>) {
            self.delegate = delegate
            self._contentHeight = contentHeight
            super.init()
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            guard let url = webView.url else { return }
            webView.determineContentHeight { [weak self] height in
                self?.contentHeight = height ?? 0
            }

            self.delegate?.didFinishNavigating(to: url)
        }

        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            guard let url = webView.url else { return }
            self.delegate?.didStartNavigating(to: url)
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            guard let url = webView.url else { return }
            self.delegate?.didFailNavigation(to: url, with: error)
        }

        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     preferences: WKWebpagePreferences,
                     decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
            guard let url = webView.url else {
                decisionHandler(.allow, preferences)
                return
            }
            decisionHandler(self.delegate?.shouldAllowNavigation(to: url) ?? .allow, preferences)
        }

    }

    enum HTMLSource {
        case url(URL)
        case string(String)
    }

    /// The configuration for the webview
    private let configuration: WKWebViewConfiguration?
    private weak var navigationDelegate: WebViewNavigationDelegate?
    private let htmlSource: HTMLSource
    @Binding private var contentHeight: CGFloat

    init(htmlSource: HTMLSource,
         configuration: WKWebViewConfiguration? = nil,
         navigationDelegate: WebViewNavigationDelegate? = nil,
         contentHeight: Binding<CGFloat>? = nil) {
        self.htmlSource = htmlSource
        self.configuration = configuration
        self.navigationDelegate = navigationDelegate
        self._contentHeight = contentHeight ?? .constant(0)
    }

    func makeUIView(context: Context) -> WebView.UIViewType {
        let webView: WKWebView = {
            if let conf = self.configuration {
                return WKWebView(frame: .zero, configuration: conf)
            }
            return WKWebView(frame: .zero)
        }()
        webView.navigationDelegate = context.coordinator
        switch self.htmlSource {
        case .url(let url):
            webView.load(URLRequest(url: url))
        case .string(let htmlContent):
            webView.loadHTMLString(htmlContent, baseURL: nil)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.navigationDelegate = context.coordinator
        // If we're loading from a string, reload it here, in case it changed.
        switch self.htmlSource {
        case .url:
            break
        case .string(let htmlContent):
            uiView.loadHTMLString(htmlContent, baseURL: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(delegate: self.navigationDelegate, contentHeight: self.$contentHeight)
    }
}
