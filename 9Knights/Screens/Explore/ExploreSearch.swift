//
//  ExploreSearch.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/27.
//

import SwiftUI

struct ExploreSearch: View {
    @State private var search = ""
    @State private var typetags = ["車聚","跑山","旅遊","休閒"]
    @State private var placetags = ["北部","中部","南部","東部"]
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    @Binding var hideTab: Bool
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("輸入關鍵字搜尋", text: $search)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(width: 300, height: 40)
                        .background(Color("Gray"))
                        .cornerRadius(10)
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Spacer()
                        Text("取消")
                            .foregroundColor(Color("Red"))
                            .font(Font.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    .frame(width: 50, height: 40)
                }
                VStack(alignment: .leading){
                    Text("依地區篩選").font(.system(size: 16, weight: .bold)).padding(.vertical, 10).padding(.leading,10)
                    HStack{
                        ForEach(placetags, id: \.self){ placetags in
                            Button{
                                
                            }label: {
                                ZStack{
                                    Capsule()
                                        .stroke(Color("ItemStroke"))
                                        .background( Color("CreamyWhite"))
                                        .cornerRadius(20)
                                        .frame(width: 80, height: 28)
                                    Text(placetags)
                                        .foregroundColor(Color(.black))
                                        .font(.system(size: 14))
                                }
                            }.buttonStyle(StaticButtonStyle())
                        }
                    }.padding(.horizontal)
                    Text("依類型篩選").font(.system(size: 16, weight: .bold)).padding(.vertical, 10).padding(.leading,10)
                    //Remove and add Tags grid
                    HStack{
                        ForEach(typetags, id: \.self){ typetags in
                            Button{
                                
                            }label: {
                                ZStack{
                                    Capsule()
                                        .stroke(Color("ItemStroke"))
                                        .background( Color("CreamyWhite"))
                                        .cornerRadius(20)
                                        .frame(width: 80, height: 28)
                                    Text(typetags)
                                        .foregroundColor(Color(.black))
                                        .font(.system(size: 14))
                                }
                            }.buttonStyle(StaticButtonStyle())
                        }
                    }.padding(.horizontal)
                    
                    //
                    Text("搜尋紀錄").font(.system(size: 16, weight: .bold)).padding(.vertical, 10).padding(.leading,10)
                    
                    ScrollView{
                        //搜尋紀錄的框框
                    }.frame(height: 470)
                }
            }.padding()
            Spacer()
        }.navigationBarBackButtonHidden(true)
        .onAppear {
            hideTab = true
                    }
        .onDisappear {
            hideTab = false
        }
    }
}

//struct ExploreSearch_Previews: PreviewProvider {
//    static var previews: some View {
//        ExploreSearch()
//    }
//}
