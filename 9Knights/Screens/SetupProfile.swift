//
//  SetupProfile.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/23.
//

import SwiftUI

struct SetupProfile: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordCheck = ""
    @State private var positionY = 700
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var path: NavigationPath
    @State var appear = true

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
        .background(Color("DA4F40"))
        .cornerRadius(50)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 60, trailing: 0))
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color("FAF3EA")
                .ignoresSafeArea(.all)
            
            VStack{
                HStack{
                    btnBack
                    Spacer()
                }.padding(.top,80)
                VStack{
                    VStack{
                        Text("創建個人資料")
                            .font(.system(size: 32,
                                          weight: .bold))
                        TextField("使用者暱稱", text: $userName)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .frame(width: 300, height: 50)
                            .background(Color("ECECEC"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            ).padding(10)
                        TextField("居住地區", text: $email)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .frame(width: 300, height: 50)
                            .background(Color("ECECEC"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            ).padding(10)
                        TextField("您的愛車", text: $password)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .frame(width: 300, height: 50)
                            .background(Color("ECECEC"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            ).padding(10)
                        Button {
                            path.append("SetupPhoto")
                        } label: {
                            Spacer()
                            Text("完成")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 300, height: 50)
                        .background(Color("43413F"))
                        .cornerRadius(20)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 130, trailing: 0))
                        }
                    }
                    .frame(width: 390, height: 700)
                    .background(.white)
                    .cornerRadius(60)
                }
                .offset(y:CGFloat(positionY))
                .animation(.spring(), value: positionY)
                .onAppear(){ if appear{
                    positionY -= 700
                    appear = false
                }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }



struct SetupProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
                    SetupProfile(path: .constant(NavigationPath()))
                }
            }
    }

