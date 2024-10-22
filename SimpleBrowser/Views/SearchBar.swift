//
//  SearchBar.swift
//  SimpleBrowser
//
//  Created by Dominic Teh on 22/10/24.
//

import Foundation
import SwiftUI

struct SearchBar: View {
  @ObservedObject var viewModel: ViewModel
  var body: some View {
    HStack {
      Text("URL:")
      TextField("URL", text: $viewModel.urlString)
        .keyboardType(.URL)
        .autocapitalization(.none)
        .disableAutocorrection(true)
    }
  }
}
