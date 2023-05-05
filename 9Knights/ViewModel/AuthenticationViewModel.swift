//
//  AuthenticationViewModel.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/29.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

enum AuthenticationState {
    case Authenticated
    case Authenticating
    case Unauthenticated
    case FirstLogin
}

enum AuthenticationFlow {
    case login
    case signup
}

@MainActor class AuthenticationViewModel: ObservableObject {
    @Published var flow: AuthenticationFlow = .login
    @Published var authenticationState: AuthenticationState = .Unauthenticated

    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var stayLoggedIn = false
    @Published var showPasswordAlert = false
    @Published var user: User?
    
    @Published var errorMessage = ""
    @Published var isLogin: Bool = false
    let firstSetup: Bool = true
    let auth = Auth.auth()
    let db = Firestore.firestore()
    init() {
        registerAuthStateHandler()
    }
    
    func UserFlow() {
        flow = flow == .login ? .signup : .login
        errorMessage = ""
    }
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
                self.user = user
                print(user?.uid)
                self.authenticationState = user == nil ? .Unauthenticated : .Authenticated
            }
        }
    }
    
    func signIn() async -> Bool {
        authenticationState = .Authenticating
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            return true
        }
        catch  {
          print(error)
          errorMessage = error.localizedDescription
          authenticationState = .Unauthenticated
          return false
        }
      }
    
    func signUp() async -> Bool {
        if password == confirmPassword {
            authenticationState = .Authenticating
            do  {
                try await Auth.auth().createUser(withEmail: email, password: password)
                try await db.collection("users").document(user!.uid).setData(["name": userName])
                UserID = user!.uid
                authenticationState = .FirstLogin
                return true
            }
            catch {
                print(error)
                errorMessage = error.localizedDescription
                authenticationState = .Unauthenticated
                return false
            }
        } else {
            showPasswordAlert = true
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
            return true
        }
        catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
