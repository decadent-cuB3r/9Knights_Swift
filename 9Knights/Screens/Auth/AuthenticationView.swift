//
//  AuthenticationView.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/29.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
          switch viewModel.flow {
          case .login:
            Login()
              .environmentObject(viewModel)
          case .signup:
            Signup()
              .environmentObject(viewModel)
          }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
