//
//  WebView.swift
//  SimpleBrowser
//
//  Created by Dominic Teh on 22/10/24.
//

import Foundation
import SwiftUI
import WebKit
import Combine

struct WebView: UIViewRepresentable {
  let viewModel: ViewModel
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = context.coordinator
    return webView
  }
  
  func updateUIView(_ webView: WKWebView, context: Context) {
    if let url = URL(string: "https://\(viewModel.urlString)") {
      let fullURLString = "https://\(viewModel.urlString)"
      print("Attempting to load URL: \(fullURLString)") // Debugging line
      webView.load(URLRequest(url: url))
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, WKNavigationDelegate {
    var parent: WebView
    var webViewOptionsSubscriber: AnyCancellable?
    
    init(_ parent: WebView) {
      self.parent = parent
      super.init()
      // Optionally subscribe to changes in the ViewModel (not implemented here)
    }
    
    deinit {
      webViewOptionsSubscriber?.cancel()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      webViewOptionsSubscriber = parent.viewModel.webViewOptionsPublisher.sink(receiveValue: { webViewOption in
        // create a switch statement for each of the different options
        switch webViewOption {
        case .back:
          if webView.canGoBack {
            webView.goBack()
          }
        case .forward:
          if webView.canGoForward {
            webView.goForward()
          }
        case .share:
          print("to execute")
          self.parent.viewModel.shouldShowShareSheet = true
        case .refresh:
          webView.reload()
        case .stop:
          webView.stopLoading()
        }
      })
    }
  }
}
