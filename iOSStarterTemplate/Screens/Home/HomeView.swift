//
//  HomeView.swift
//  iOSStarterTemplate
//
//  Created by diayan siat on 16/11/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject public var viewModel: HomeViewModel
    
    var body: some View {
        Text("Hello, World! Counter: \(viewModel.counter)")
        
        Button("Increment") {
            viewModel.increment()
        }
    }
}

//#Preview {
//    HomeView()
//}
