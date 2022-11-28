//
//  ContentView.swift
//  KeydownTest
//
//  Created by Steven Harris on 11/28/22.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    // This html content, consisting of a contenteditable DIV never triggers the
    // `keydown` event on Mac Catalyst for MacOS 13 (Ventura). It works fine on earlier
    // MacOS versions, and it works fine on iOS targets. The `click` event triggers
    // properly in all cases. You can view the logging to the console using the
    // Safari Web Inspector. FWIW, the same contenteditable DIV works fine in Safari
    // itself, triggering both events. It only appears to be an issue with WKWebView
    // in Mac Catalyst as of MacOS 13. The same issue occurs in UIKit with direct usage
    // of WKWebView.
    var html: String = "<div contenteditable=\"true\" onkeydown=\"console.log('keydown: ' + event.key);\" onclick=\"console.log('click');\"<h1>Hello world.</h1></div>"
    
    // Alternatively use an input element, which also fails on Mac Catalyst for MacOS 13 (Ventura)
    // var html: String = "<input type=\"text\" onkeydown=\"console.log('keydown: ' + event.key);\" onclick=\"console.log('click');\">"

    var body: some View {
        VStack {
            WebView(html: html)
        }
        .padding()
        .background(Color.red)
    }
}

struct WebView: UIViewRepresentable {
    
    var html: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(html, baseURL: nil)
    }
}

