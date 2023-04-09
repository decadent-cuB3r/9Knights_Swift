//
//  Setting.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/3/26.
//

import SwiftUI

struct Setting: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    private func signOut() {
        viewModel.signOut()
    }
    var body: some View {
        Button(action: signOut) {
            Text("登出")
        }
    }
}

