//
//  CommunicationSearch.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/29.
//

import SwiftUI

struct CommunicationSearch: View {
    @State private var search = ""
    @State private var tags = ["心得","徵人","路況","詢問"]
    @Environment(\.presentationMode) var presentationMode
    
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
                    Text("依類型篩選").font(.system(size: 16, weight: .bold)).padding(.vertical, 10).padding(.leading,10)
                    HStack{
                        ForEach(tags, id: \.self){ placetags in
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
                    Text("搜尋紀錄").font(.system(size: 16, weight: .bold)).padding(.vertical, 10).padding(.leading,10)
                    
                    ScrollView{
                        //搜尋紀錄的框框
                    }.frame(height: 500)
                }
            }.padding()
            Spacer()
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct CommunicationSearch_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationSearch()
    }
}
