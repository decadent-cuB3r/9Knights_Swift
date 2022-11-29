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
//    @State var isLogin = false

    var body: some View {
        if viewModel.isLogin {
            TabButton()
        } else {
            Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
