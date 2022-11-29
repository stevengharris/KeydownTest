# KeydownTest

The test is a WKWebView with a `contenteditable div`. The `div` has two event handlers, one for `click` and one for `keydown`. 

To see the problem, use the KeydownTestiOS target to deploy the app to your Mac using Mac Catalyst on MacOS 13. 
Attach the Safari Web Inspector or something else that will show the console log. The `click` event fires, printing 
to the log as you click around. The `keydown` is never triggered when you type. The same app deployed to an iOS device 
or the simulator works fine, triggering the `keydown` as you type. The same app deployed to your Mac using Mac Catalyst 
on earlier versions of MacOS (tested 12.6) works fine, too. The same app deployed to MacOS directly, without using 
Mac Catalyst (using the KeydownTestMac target) works fine, too.
