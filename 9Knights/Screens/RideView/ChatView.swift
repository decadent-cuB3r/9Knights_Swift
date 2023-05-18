//
//  ChatView.swift
//  9Knights
//
//  Created by Peggy on 2023/5/17.
//

import Foundation
import SwiftUI
struct ChatViewNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
                .shadow(color: Color.gray.opacity(0.05), radius: 4, x: 0, y: 4)
                .frame(width: 390,height: 70)
            ZStack {
                HStack{
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("Gray"))
                                .opacity(0.5)
                            Image("BlackArrowLeft")
                                .font(Font.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Text("群組聊天室")
                        .font(Font.system(size: 20, weight: .bold))
                    Spacer()
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("Gray"))
                                .opacity(0.5)
                            Image(systemName: "ellipsis")
                                .font(Font.system(size: 20, weight: .bold))
                                .foregroundColor(Color("WordGray"))
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 50)
    }
}
struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var message: String = ""
    @State var islike = false
    @State var isFav = false
    @Binding var hideTab: Bool
    var body: some View {
                ZStack(alignment: .top){
                    ChatViewNavigationBar()
                    ScrollView(){
                        VStack{
                            HStack{
                                Image("knightPhoto")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                VStack(spacing: 7){
                                    Text("張曉希")
                                        .font(.system(size: 14)).bold()
                                    Spacer()
                                }
                                Spacer()
                                
                            }.padding()
                        }
                        
                        
                    }.padding(.top, 60)
                    VStack{
                        Spacer()
                        ZStack(alignment: .bottom){
                            HStack{
                                Button{
                                    // 處理選擇照片按鈕的動作
                                }label: {
                                    Image(systemName: "photo")
                                }
                                .frame(width: 44, height: 44)
                                .background(Color.white.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(30)
                                .padding(.top, 10)
                                HStack(spacing: -30){
                                        VStack {
                                            TextField("輸入訊息...", text: $message)
                                                .textFieldStyle(PlainTextFieldStyle())
                                                .background(Color.clear)
                                                .padding(20)
                                        }
                                        Button{
                                            // 處理送出按鈕的動作
                                        }label: {
                                            Image(systemName: "paperplane.fill")
                                        }
                                        .frame(width: 44, height: 44)
                                        .background(Color("Gray"))
                                        .foregroundColor(.black)
                                        .cornerRadius(30)
                                        .padding(10)
                                }.frame(width: 308, height: 54)
                                .background(Color.white)
                                .cornerRadius(30)
                                .padding(.top, 10)
                            }
                            
                        }
                        .frame(width: 390, height: 80)
                        .background(Color("Red"))
                    }

        }.navigationBarHidden(true)
        .onAppear {
            hideTab = true
                    }
    }
}

struct ChetView_Previews: PreviewProvider {
    @State static private var hideTab = false
    static var previews: some View {
        ChatView(hideTab: $hideTab)
    }
}

