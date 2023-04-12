//
//  Login.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/16.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct Login: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    private func signInWithEmailPassword() {
      Task {
        if await viewModel.signIn() == true {
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
                    TextField("電子信箱", text: $viewModel.email)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                
                        )
                        .padding(.bottom,15)
                    TextField("密碼", text: $viewModel.password)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    HStack{
                        Button{
                            viewModel.stayLoggedIn.toggle()
                            
                        } label: {
                            HStack{
                                Image(systemName: viewModel.stayLoggedIn ? "checkmark.square": "square")
                                    .padding(.trailing, -5)
                                Text("保持登入")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                            }
                        }.buttonStyle(StaticButtonStyle())
                        Spacer()
                        Button{
                            
                        }label: {
                            Text("忘記密碼")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .underline()
                        }
                    }.frame(width: 300)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                    
                    //Login Button
                    Button (action: signInWithEmailPassword) {
                        if viewModel.authenticationState != .Authenticating{
                            HStack {
                                Spacer()
                                Text("登入")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .frame(width: 300, height: 50)
                            .background(Color("BtnBlack"))
                            .cornerRadius(20)
                            .padding(.bottom, 20)
                        } else {
                            ProgressView()
                        }
                    }
                    
                    Text("或")
                        .font(.system(size: 14))
                        .foregroundColor(Color("WordGray"))
                        .padding(.bottom,20)
                    //Facebook Login Button

                    Button {
                        //Login with Facebook
                    } label: {
                        Spacer()
                        Text("登入facebook繼續")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(width: 300, height: 50)
                    .background(Color("Btnfb"))
                    .cornerRadius(20)
                    .padding(1)
                    HStack{
                        Text("還沒有帳號？")
                            .font(.system(size: 14))
                        Button(action: {viewModel.UserFlow()}){
                            Text("點此註冊新帳號")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .underline()
                        }
                    }
                               
                }
            }.ignoresSafeArea().fixedSize()
        }
    
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
