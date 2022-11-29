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
        VStack{
            HStack{
                TextField("輸入關鍵字搜尋", text: $search)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .frame(width: 300, height: 50)
                    .background(Color("Gray"))
                    .cornerRadius(20)
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Spacer()
                    Image(systemName: "cross.fill")
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(45))
                        .font(.system(size: 16, weight: .thin))
                    
                    Spacer()
                }
                .frame(width: 40, height: 40)
                .background(Color("Red"))
                .cornerRadius(50)
            }
            VStack(alignment: .leading){
                Text("依標籤篩選").font(.system(size: 18, weight: .bold)).padding(.bottom).padding(.leading,10)
                //Remove and add Tags grid
                HStack{
                    ForEach(tags, id: \.self){ tags in
                        Button{
                            
                        }label: {
                            ZStack{
                                Capsule()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("CreamyWhite"))
                                    .cornerRadius(20)
                                    .frame(width: 80, height: 30)
                                Text(tags)
                                    .foregroundColor(Color(.black))
                                    .bold()
                            }
                        }
                    }
                }.padding(.horizontal)
                //
                Text("搜尋紀錄").font(.system(size: 18, weight: .bold)).padding(.vertical, 10).padding(.leading,10)
                
                ScrollView{
                    //搜尋紀錄的框框
                }.frame(height: 450)
                
                Button{
                    
                } label: {
                    Spacer()
                    Text("搜尋")
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(width: 352, height: 50)
                .background(Color("BtnBlack"))
                .cornerRadius(20)
                .padding(.bottom, 20).padding(.leading,10)
            }.padding()
        }
        
    }
}

struct CommunicationSearch_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationSearch()
    }
}
