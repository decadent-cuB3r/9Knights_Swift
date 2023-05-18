//
//  PostContent.swift
//  9Knights
//
//  Created by Peggy on 2023/5/14.
//

import Foundation
import SwiftUI
struct PostContentNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var hideTab: Bool

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
                        self.presentationMode.wrappedValue.dismiss(); hideTab = false
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
                    Text("title")
                        .font(Font.system(size: 20, weight: .bold))
                        .foregroundColor(Color("WordGray"))
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
struct PostContent: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var message: String = ""
    @State var islike = false
    @State var isFav = false
    @Binding var hideTab: Bool
    var body: some View {
                ZStack(alignment: .top){
                    PostContentNavigationBar(hideTab: $hideTab)
                    ScrollView(){
                        VStack{
                            HStack{
                                Image("knightPhoto")
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                VStack(spacing: 7){
                                    Text("張曉希")
                                        .font(.system(size: 16)).bold()
                                    ZStack{
                                        Rectangle()
                                            .stroke(Color("ItemStroke"), lineWidth: 2)
                                            .background( Color("Gray"))
                                            .cornerRadius(2)
                                            .frame(width: 50, height: 19)
                                        Text("心得")
                                            .foregroundColor(Color(.black))
                                            .bold()
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                VStack{
                                    Text("2022/10/12")
                                        .font(.system(size: 12)).bold()
                                        .foregroundColor(Color("WordGray"))
                                        .padding(.bottom, 25)
                                }
                            }.padding()
                            VStack{
                                HStack{
                                    Text("我買新車車啦!") .font(.system(size: 18)).bold()
                                    Spacer()
                                }
                                HStack{
                                    Text("終於被我找到了二手的一代MSX!\n頭燈超漂漂...\n下一台想買CB150R><")
                                        .font(.system(size: 14)).lineSpacing(5)
                                    Spacer()
                                }.padding(.vertical, 2)
                            }.padding(.horizontal, 20)
                            HStack{
                                Image("MSX")
                                    .resizable()
                                    .frame(width: 164, height: 164)
                                    .cornerRadius(10)
                                Spacer()
                            }.padding()
                        }
                        HStack{
                            Button(action: {
                                islike.toggle()
                                    }) {
                                        Image(systemName: islike ? "heart.fill" : "heart")
                                            .foregroundColor(islike ? Color("Red") : .black)
                                    }
                                    .font(.system(size: 24))
                            Spacer()
                            Button(action: {
                                isFav.toggle()
                                    }) {
                                        Image(systemName: isFav ? "bookmark.fill" : "bookmark")
                                            .foregroundColor(isFav ? Color("Red") : .black)
                                    }
                                    .font(.system(size: 24))
                        }.padding(.horizontal).padding(.bottom, 10)
                        VStack{
                            HStack{
                                Text("2 個讚")
                                Text("1 則留言")
                                Text("2 收藏")
                                Spacer()
                            }
                            .padding().padding(.bottom, -10)
                            .font(.system(size: 12))
                            Rectangle()
                                .frame(height: 1).foregroundColor(Color("Gray"))
                            HStack(spacing: 10){
                                Image("knightPhoto")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                VStack(alignment: .leading,spacing: 4){
                                    Text("張曉希")
                                        .font(.system(size: 14)).bold()
                                    Text("太讚了8!")
                                        .font(.system(size: 12))
                                }
                                Spacer()
                                VStack{
                                    Text("1分鐘之前")
                                        .font(.system(size: 10))
                                        .foregroundColor(Color("WordGray"))
                                        .padding(.bottom, 25)
                                }
                            }.padding()
                        }
                        .frame(width: 390)
                        .background(Color("PostGray"))
                    }.padding(.top, 60)
                    VStack{
                        Spacer()
                        ZStack(alignment: .bottom){
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
                            }.frame(width: 356, height: 54)
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.top, 10)
                        }
                        .frame(width: 390, height: 80)
                        .background(Color("Red"))
                    }

        }.navigationBarHidden(true)
        .onAppear {
            hideTab = true
                    }
        .onDisappear {
            hideTab = false
        }
    }
}

struct PostContent_Previews: PreviewProvider {
    @State static private var hideTab = false
    static var previews: some View {
        PostContent(hideTab: $hideTab)
    }
}
