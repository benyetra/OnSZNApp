//
//  TeamTwitterWebView.swift
//  OnSZN
//
//  Created by Bennett Yetra on 11/29/20.
//
import SwiftUI
import WebKit


/// A state indicating the loading state of the WebView.
enum TeamTwitterWebViewState {
    case loading
    case idle
}

/// A simple navigation delegate for the twitter html view.
///
/// The delegate enables the webview to open tweets in the default browser.
fileprivate class TeamTwitterWebViewNavigator: NSObject, WKNavigationDelegate {
    private let onStateChange: (TeamTwitterWebViewState) -> Void

    init(onStateChange: @escaping (TeamTwitterWebViewState) -> Void) {
        self.onStateChange = onStateChange
    }

    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        guard navigationAction.navigationType == .linkActivated else {
            decisionHandler(.allow)
            return
        }
        guard
            let url = navigationAction.request.url,
            UIApplication.shared.canOpenURL(url)
        else {
            decisionHandler(.cancel)
            return
        }

        UIApplication.shared.open(url)
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // This method is called when the WebView is loading.
        onStateChange(.loading)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // This method is called when the WebView finished loading.
        onStateChange(.idle)
    }
}


/// A html view based on WKWebView which wraps a simple twitter feed.
struct TeamTwitterWebView: UIViewRepresentable {
    private let navigator: WKNavigationDelegate
    
    init(onStateChange: @escaping (TeamTwitterWebViewState) -> Void) {
        self.navigator = TeamTwitterWebViewNavigator(
            onStateChange: onStateChange
        )
    }

//    func getTwitterTeamTemplate() -> String {
//        let team: Team
//        return team.name + "TwitterViewTemplate"
//    }

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: .zero)
        guard
            let htmlFilepath = Bundle.main.path(
//                forResource: getTwitterTeamTemplate(), ofType: "html"
                forResource: "TwitterViewTemplate", ofType: "html"
            ),
            let html = try? String(contentsOfFile: htmlFilepath)
        else { fatalError("Twitter Assets not found!") }
        view.loadHTMLString(html, baseURL: nil)
        view.navigationDelegate = navigator
        return view
    }

    func updateUIView(
        _ view: WKWebView,
        context: UIViewRepresentableContext<TeamTwitterWebView>
    ) { /* Protocol requirement */}
}
