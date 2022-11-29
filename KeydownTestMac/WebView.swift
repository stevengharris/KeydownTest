//
//  WebView.swift
//  KeydownTestMac
//
//  Created by Steven Harris on 11/29/22.
//

import SwiftUI
import WebKit

@available(macOS 12, *)
struct WebView: NSViewRepresentable {
    
    var html: String
    
    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadHTMLString(html, baseURL: nil)
    }
}
