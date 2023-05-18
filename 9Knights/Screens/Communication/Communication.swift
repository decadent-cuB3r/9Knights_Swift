//
//  Comunication.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
struct CommunicationNavigationBar: View {
    @Binding var hideTab: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            HStack {
                Text("貼文").font(.system(size: 32)).bold()
                Spacer()
                HStack{
                    NavigationLink(destination: CommunicationSearch(hideTab: $hideTab).navigationBarHidden(true)){
                    label: do {
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("Gray"))
                            Image(systemName: "magnifyingglass")
                                .font(Font.system(size: 16, weight: .semibold))
                                .foregroundColor(Color("BtnGray"))
                        }}
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
        .padding(.bottom, -15)
    }
}
struct Communication: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    @State private var select: Int = 0
    @State private var items = ["熱門", "最新", "追蹤", "珍藏"]
    @Binding var hideTab: Bool
    var body: some View {
            NavigationStack{
                VStack{
                    CommunicationNavigationBar(hideTab: $hideTab)
                SegmentedControl(items: items, selection: $select)
                    .padding(.vertical, 16)
                    ScrollView{
                        if items[select] == "熱門"{
                            VStack{
                                NavigationLink(destination: PostContent(hideTab: $hideTab)){
                                    HStack{
                                        VStack(alignment: .leading, spacing: 8){
                                            HStack(spacing: 5){
                                                Image("knightPhoto")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                Text("張曉希")
                                                    .font(.system(size: 14, weight: .bold))
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
                                            HStack{
                                                VStack(alignment: .leading,spacing: 8){
                                                    Text("我買新車車了！")
                                                        .font(.system(size: 14, weight: .bold))
                                                    Text("終於被我找到了二手的一代MSX!")
                                                        .font(.system(size: 12))
                                                    Text("2 讚  1 留言  0 收藏")
                                                        .font(.system(size: 10, weight: .bold))
                                                        .foregroundColor(Color("WordGray"))
                                                }.padding(.leading,5)
                                                Spacer()
                                                Image("MSX")
                                                    .resizable()
                                                    .frame(width: 60,height: 60)
                                                    .cornerRadius(10)
                                            }
                                        }.padding()
                                        
                                    }
                                    .foregroundColor(Color.black)
                                    .frame(width: 365, height: 120)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("ItemStroke"), lineWidth: 1))
                                    .padding()
                                }
                            }
                        }else{
                            VStack{
                                ZStack{
                                    Circle().frame(width: 190).foregroundColor(Color("Gray"))
                                    Image("NothingHere")
                                        .padding(.bottom, 10)
                                }
                                Text("尚無任何貼文")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color("WordGray"))
                                    .padding(.vertical,10)
                            }.padding(.top, 180)
                        }
                    }.padding(.top,-25)
                }
            }.onAppear {
                hideTab = false
            }
    }
}

struct Communication_Previews: PreviewProvider {
    @State static private var hideTab = false
    static var previews: some View {
        Communication(hideTab: $hideTab)
    }
}
