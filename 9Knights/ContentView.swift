//
//  ContentView.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/10.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    var body: some View {
        switch viewModel.authenticationState {
        case .FirstLogin :
            SetupProfile()
                .environmentObject(viewModel)
        case .Authenticated :
            TabButton()
                .environmentObject(viewModel)
        case .Unauthenticated:
            AuthenticationView()
                .environmentObject(viewModel)
        default :
            CreatePost()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
