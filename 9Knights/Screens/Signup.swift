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
    @State private var positionY = 700
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  
    var btnBack : some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Spacer()
            Image("whiteArrow")
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: 50, height: 50)
        .background(Color("Red"))
        .cornerRadius(50)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 60, trailing: 0))
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color("CreamyWhite")
                .ignoresSafeArea(.all)
            
            VStack{
                HStack{
                    btnBack
                    Spacer()
                }.padding(.top,80)
                VStack{
                    VStack{
                        Text("註冊新帳號")
                            .font(.system(size: 32,
                                          weight: .bold))
                        TextField("使用者名稱", text: $userName)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .frame(width: 300, height: 50)
                            .background(Color("Gray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            ).padding(10)
                        TextField("電子信箱", text: $email)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .frame(width: 300, height: 50)
                            .background(Color("Gray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            ).padding(10)
                        TextField("密碼", text: $password)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .frame(width: 300, height: 50)
                            .background(Color("Gray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            ).padding(10)
                        TextField("確認密碼", text: $passwordCheck)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .frame(width: 300, height: 50)
                            .background(Color("Gray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            ).padding(10)
                        Button {
                            //Login func
                        } label: {
                            Spacer()
                            Text("註冊")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 300, height: 50)
                        .background(Color("BlackBtn"))
                        .cornerRadius(20)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 70, trailing: 0))
                    }
                   
                    .frame(width: 390, height: 700)
                    .background(.white)
                    .cornerRadius(60)
                    //                    .onAppear(){
                    //                        positionY += 200
                    //                    }
                }
                .offset(y:CGFloat(positionY))
                .animation(.spring(), value: positionY)
                .onAppear(){
                    positionY -= 700
                }
            }
                
            
             
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}

