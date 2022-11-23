//
//  ContentView.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/10.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var isLogin = false

    var body: some View {
        if isLogin {
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
