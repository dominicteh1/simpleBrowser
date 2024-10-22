//
//  ViewModel.swift
//  SimpleBrowser
//
//  Created by Dominic Teh on 22/10/24.
//

import Foundation
import SwiftUI
import Combine

enum WebViewOptions {
  case back
  case forward
  case share
  case refresh
  case stop
}

class ViewModel: ObservableObject {
  @Published var urlString: String = "www.apple.com"
  @Published var webViewOptionsPublisher = PassthroughSubject<WebViewOptions, Never>()
  @Published var shouldShowShareSheet: Bool = false
  
  func goBack() {
    webViewOptionsPublisher.send(.back)
    print("Go Back action triggered")
  }
  
  func goForward() {
    webViewOptionsPublisher.send(.forward)
    print("Go Forward action triggered")
  }
  
  func share() {
    webViewOptionsPublisher.send(.share)
    print("Share action triggered")
  }
  
  func refresh() {
    webViewOptionsPublisher.send(.refresh)
    print("Refresh action triggered")
  }
  
  func stop() {
    webViewOptionsPublisher.send(.stop) 
    print("Stop action triggered")
  }
}
