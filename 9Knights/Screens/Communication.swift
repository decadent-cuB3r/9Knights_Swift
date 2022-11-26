//
//  Comunication.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI

struct Communication: View {
    @State private var select: Int = 0
        private var items = ["熱門", "最新", "追蹤", "珍藏"]
    
    var body: some View {
        NavigationStack{
            SegmentedControl(items: items, selection: $select)
                .padding(.vertical, 16)
            ScrollView{
                if items[select] == "熱門"{
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                HStack{
                                    Image("knightPhoto")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .mask(
                                            ZStack {
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                            })
                                    Text("張曉希")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("心得")
                                        .font(.system(size: 12, weight: .bold))
                                        .frame(width: 50, height: 20)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("ItemStroke"), lineWidth: 1))
                                        .background(Color("CreamyWhite"))
                                    
                                }
                                Text("我買新車車了！")
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.bottom,1)
                                Text("2 讚  1 留言  0 收藏")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(Color("WordGray"))
                                
                            }.padding()
                            Spacer()
                            Image("MSX")
                                .resizable()
                                .frame(width: 80,height: 80)
                                .cornerRadius(10)
                                .padding()
                        }
                        .frame(width: 365, height: 110)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("ItemStroke"), lineWidth: 1))
                        .padding()
                    }
                }else{
                    VStack{
                        Image("NothingHere")
                        Text("尚無任何貼文")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("WordGray"))
                    }.padding(.top, 180)
                }
                
            }.padding(.top,-25)
            .navigationBarTitle("")
            .navigationBarItems(leading:
                                Text("車友交流").font(.system(size: 32)).bold().padding(.top,-8)
                                , trailing:
                                    HStack{
                                        Button{
                                            
                                        } label: {
                                            ZStack{
                                                Circle()
                                                    .frame(width: 40, height: 40)
                                                    .foregroundColor(Color("Gray"))
                                                Image(systemName: "magnifyingglass")
                                                    .font(Font.system(size: 16, weight: .semibold))
                                                    .foregroundColor(Color("BtnGray"))
                                            }
                                        }
                                    }.padding(.top,-8)
                        )
        }
        
    }
}

struct Communication_Previews: PreviewProvider {
    static var previews: some View {
        Communication()
    }
}
