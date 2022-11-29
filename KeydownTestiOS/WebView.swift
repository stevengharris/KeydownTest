//
//  WebView.swift
//  KeydownTestiOS
//
//  Created by Steven Harris on 11/29/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var html: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
}
