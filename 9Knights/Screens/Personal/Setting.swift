//
//  Setting.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/3/26.
//

import SwiftUI
struct Setting: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var isOn = false
    private func signOut() {
        viewModel.signOut()
    }
    var body: some View {
        NavigationStack{
            VStack{
                CustomBar(text: "設定")
                VStack{
                    HStack{
                        Toggle("暗色模式", isOn: $isOn)
                            .font(.system(size: 20)).bold()
                            .toggleStyle(SwitchToggleStyle(tint: Color("Red")))
                    }.padding(.horizontal).frame(height: 50)
                    Divider()
                    HStack{
                        Text("帳號管理")
                            .font(.system(size: 20)).bold()
                        Spacer()
                        Image("BlackArrowRight")
                    }.padding(.horizontal).frame(height: 50)
                    Divider()
                    HStack{
                        Text("常見問題")
                            .font(.system(size: 20)).bold()
                        Spacer()
                        Image("BlackArrowRight")
                    }.padding(.horizontal).frame(height: 50)
                    Divider()
                    HStack{
                        Text("使用說明")
                            .font(.system(size: 20)).bold()
                        Spacer()
                        Image("BlackArrowRight")
                    }.padding(.horizontal).frame(height: 50)
                    Divider()
                    Spacer()
                    VStack{
                        Divider()
                        Button(action: signOut) {

                            Text("登出")
                                .font(.system(size: 20)).bold()
                                .foregroundColor(Color("Red"))
                            Spacer()
                        }.padding()
                        Divider()
                    }
                   
                   
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
