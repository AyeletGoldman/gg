// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import Combine
import WebKit

/// A container for using a WKWebView in SwiftUI
struct WebView: UIViewRepresentable {

    private let htmlSource: HTMLSource
    private let didTapLink: (URL) -> Void
    /// The configuration for the webview
    private let configuration: WKWebViewConfiguration?
    private weak var navigationDelegate: WebViewNavigationDelegate?
    @Binding private var contentHeight: CGFloat

    init(htmlSource: HTMLSource,
         didTapLink: @escaping (URL) -> Void,
         configuration: WKWebViewConfiguration? = nil,
         navigationDelegate: WebViewNavigationDelegate? = nil,
         contentHeight: Binding<CGFloat>? = nil) {
        self.htmlSource = htmlSource
        self.didTapLink = didTapLink
        self.configuration = configuration
        self.navigationDelegate = navigationDelegate
        self._contentHeight = contentHeight ?? .constant(0)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView: WKWebView = {
            if let conf = self.configuration {
                return WKWebView(frame: .zero, configuration: conf)
            }
            return WKWebView(frame: .zero)
        }()
        webView.scrollView.isScrollEnabled = false
        webView.navigationDelegate = context.coordinator
        switch self.htmlSource {
        case .url(let url):
            webView.load(URLRequest(url: url))
        case .string(let htmlContent):
            webView.loadHTMLString(htmlContent, baseURL: nil)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }

    func makeCoordinator() -> Coordinator {
        return Coordinator(delegate: self.navigationDelegate,
                           didTapLink: self.didTapLink,
                           contentHeight: self.$contentHeight)
    }
}

extension WebView {

    final class Coordinator: NSObject, WKNavigationDelegate {

        private weak var delegate: WebViewNavigationDelegate?
        private let didTapLink: (URL) -> Void

        @Binding private var contentHeight: CGFloat

        init(delegate: WebViewNavigationDelegate?,
             didTapLink: @escaping (URL) -> Void,
             contentHeight: Binding<CGFloat>) {
            self.delegate = delegate
            self.didTapLink = didTapLink
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
            if let actionUrl = navigationAction.request.url, actionUrl != URL(string: "about:blank") {
                decisionHandler(.cancel, preferences)
                self.didTapLink(actionUrl)
                return
            }
            decisionHandler(self.delegate?.shouldAllowNavigation(to: url) ?? .allow, preferences)
        }
    }
}
