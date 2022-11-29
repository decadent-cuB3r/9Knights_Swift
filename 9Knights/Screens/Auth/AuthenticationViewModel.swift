//
//  AuthenticationViewModel.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/29.
//

import Foundation
import FirebaseAuth

enum AuthenticationState {
    case Authenticated
    case Authenticating
    case Unauthenticated
}

enum AuthenticationFlow {
    case login
    case signup
}

@MainActor class AuthenticationViewModel: ObservableObject {
    @Published var flow: AuthenticationFlow = .login
    @Published var authenticationState: AuthenticationState = .Unauthenticated

    @Published var errorMessage = ""
    @Published var isLogin: Bool = false
    let auth = Auth.auth()
    
    
    func UserFlow() {
        flow = flow == .login ? .signup : .login
        errorMessage = ""
    }
    
    func authState() {
        isLogin = isLogin == true ? false : true
    }
}
