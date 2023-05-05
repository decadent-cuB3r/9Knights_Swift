//
//  Signup.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/22.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Firebase

struct Signup: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    private func signUpWithEmailPassword() {
      Task {
        if await viewModel.signUp() == true {
          dismiss()
        }
      }
    }

    var body: some View {
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color("Gray")]), startPoint: .leading, endPoint: .trailing))
                    .rotationEffect(.degrees(40))
                    .offset(x: 180, y: -250)
                    .frame(width: 500, height: 500)
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color("Gray")]), startPoint: .leading, endPoint: .trailing))
                    .rotationEffect(.degrees(50))
                    .offset(x: -180, y: 350)
                VStack{
                    Image("logoImage")
                    Image("logoWord")
                    TextField("使用者名稱", text: $viewModel.userName)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    TextField("電子郵件", text: $viewModel.email)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    SecureField("密碼", text: $viewModel.password)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    SecureField("確認密碼", text: $viewModel.confirmPassword)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    //Sign Up Button
                    Button (action: signUpWithEmailPassword) {
                        if viewModel.authenticationState != .Authenticating {
                            HStack{
                                Spacer()
                                Text("註冊")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .frame(width: 300, height: 50)
                                .background(Color("BtnBlack"))
                                .cornerRadius(20)
                                .padding(.bottom, 1)
                        } else {
                            ProgressView()
                        }
                    }.alert(title: "Inncorect Password", isPresented: $viewModel.showPasswordAlert)
                    
                    
                    HStack{
                        Text("已擁有帳號？")
                            .font(.system(size: 14))
                        Button(action: {viewModel.UserFlow()}){
                            Text("點此登入")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .underline()
                        }
                    }
                }
            }.ignoresSafeArea().fixedSize()
            .navigationBarBackButtonHidden(true)
        }
}
//#if DEBUG
//class demoViewModel: ObservableObject {
//    @Published var userName = ""
//    @Published var email = ""
//    @Published var password = ""
//    @Published var confirmPassword = ""
//    @Published var stayLoggedIn = false
//    @Published var showPasswordAlert = false
//    
//    init(){
//        userName = "ezra"
//    }
//}
//struct Signup_Previews: PreviewProvider {
//    static var previews: some View {
//        Signup()
//            .environmentObject(demoViewModel)
//    }
//}
//#endif

