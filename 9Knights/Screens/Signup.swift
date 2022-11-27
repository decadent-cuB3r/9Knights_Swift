//
//  Signup.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/22.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct Signup: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordCheck = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    

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
                    TextField("使用者名稱", text: $userName)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    TextField("電子郵件", text: $email)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    TextField("密碼", text: $password)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    TextField("確認密碼", text: $passwordCheck)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .frame(width: 300, height: 50)
                        .background(Color("Gray"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.bottom,15)
                    //Login Button
                    Button {
                    } label: {
                        Spacer()
                        Text("註冊")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(width: 300, height: 50)
                    .background(Color("BtnBlack"))
                    .cornerRadius(20)
                    .padding(.bottom, 1)
                    
                    HStack{
                        Text("已擁有帳號？")
                            .font(.system(size: 14))
                        Button{
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
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
struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}

