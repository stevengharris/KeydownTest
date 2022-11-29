//
//  ContentView.swift
//  KeydownTestMac
//
//  Created by Steven Harris on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    
    // This html content, consisting of a contenteditable DIV never triggers the
    // `keydown` event on Mac Catalyst for MacOS 13 (Ventura). It works fine on earlier
    // MacOS versions, and it works fine on iOS targets. The `click` event triggers
    // properly in all cases. You can view the logging to the console using the
    // Safari Web Inspector. FWIW, the same contenteditable DIV works fine in Safari
    // itself, triggering both events. It only appears to be an issue with WKWebView
    // in Mac Catalyst as of MacOS 13. The same issue occurs in UIKit with direct usage
    // of WKWebView. The issue does not occur on native MacOS apps.
    var html: String = "<div contenteditable=\"true\" onkeydown=\"console.log('keydown: ' + event.key);\" onclick=\"console.log('click');\"><h1>Hello world.</h1></div>"
    
    // Alternatively use an input element, which also fails on Mac Catalyst for MacOS 13 (Ventura)
    // var html: String = "<input type=\"text\" onkeydown=\"console.log('keydown: ' + event.key);\" onclick=\"console.log('click');\">"

    var body: some View {
        WebView(html: html)
    }
    
}
