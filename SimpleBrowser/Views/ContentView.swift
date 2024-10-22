//
//  ContentView.swift
//  SimpleBrowser
//
//  Created by Dominic Teh on 22/10/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ViewModel()

  var body: some View {
    VStack {
      SearchBar(viewModel: viewModel)
      WebView(viewModel: viewModel)
      BottomBar(viewModel: viewModel)
    }
    .sheet(isPresented: $viewModel.shouldShowShareSheet) {
      if let url: URL = URL(string: "https://\(viewModel.urlString)") {
        ShareSheet(activityItems: [url])
      }
    }
  }
}
