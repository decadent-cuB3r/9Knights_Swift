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
            SetupProfile(path: .constant(NavigationPath()))
        case .Authenticated :
            TabButton()
                .environmentObject(viewModel)
        default :
            AuthenticationView()
                .environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
