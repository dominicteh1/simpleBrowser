//
//  SimpleBrowserApp.swift
//  SimpleBrowser
//
//  Created by Dominic Teh on 22/10/24.
//

import SwiftUI

@main
struct SimpleBrowserApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(viewModel: ViewModel())
    }
  }
}
