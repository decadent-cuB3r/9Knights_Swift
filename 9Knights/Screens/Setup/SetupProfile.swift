//
//  SetupProfile.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/23.
//

import SwiftUI

struct SetupProfile: View {
    @StateObject var viewModel = UserInfoViewModel()
    @State private var positionY = 700
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismiss
//    @Binding var path: NavigationPath
    @State var appear = true
    @State private var isActive: Bool = false
    @EnvironmentObject var AuthViewModel: AuthenticationViewModel
    
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
    
    func setData() {
        Task {
            if await viewModel.initialData() == true {
                dismiss()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom){
                Color("CreamyWhite")
                    .ignoresSafeArea(.all)
                
                VStack{
                    HStack{
                        //                    btnBack
                        Spacer()
                    }.padding(.top,80)
                    VStack{
                        VStack{
                            Text("創建個人資料")
                                .font(.system(size: 32,
                                              weight: .bold))
                            TextField("使用者暱稱", text: $viewModel.surName)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .frame(width: 300, height: 50)
                                .background(Color("Gray"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                ).padding(10)
                            TextField("居住地區", text: $viewModel.location)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .frame(width: 300, height: 50)
                                .background(Color("Gray"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                ).padding(10)
                            TextField("您的愛車", text: $viewModel.bikeModel)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .frame(width: 300, height: 50)
                                .background(Color("Gray"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                ).padding(10)
                            NavigationLink(destination: SetupPhoto().environmentObject(AuthViewModel), isActive: $isActive){
                                Button {
                                    setData()
                                    isActive = true
                                } label: {
                                    Spacer()
                                    Text("完成")
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .frame(width: 300, height: 50)
                                .background(Color("BtnBlack"))
                                .cornerRadius(20)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 130, trailing: 0))
                            }
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
}



struct SetupProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
                    SetupProfile()
                }
            }
    }

