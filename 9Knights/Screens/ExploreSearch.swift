//
//  ExploreSearch.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/27.
//

import SwiftUI

struct ExploreSearch: View {
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var search = ""
    @State private var tags1 = ["跑山","夜騎","巡航","咖啡"]
    @State private var tags2 = ["RV","美式","環島","新手"]
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
                
                Text("依日期篩選").font(.system(size: 18, weight: .bold)).padding(.leading,10)
                VStack{
                    DatePicker("開始時間", selection: $startTime, displayedComponents: .date)
                    DatePicker("結束時間", selection: $endTime, displayedComponents: .date)
                }.padding(.leading, 10)
                Text("依標籤篩選").font(.system(size: 18, weight: .bold)).padding(.vertical, 10).padding(.leading,10)
                //Remove and add Tags grid
                HStack{
                    ForEach(tags1, id: \.self){ tags1 in
                        Button{
                            
                        }label: {
                            ZStack{
                                Capsule()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("CreamyWhite"))
                                    .cornerRadius(20)
                                    .frame(width: 80, height: 30)
                                Text(tags1)
                                    .foregroundColor(Color(.black))
                                    .bold()
                            }
                        }
                    }
                }.padding(.horizontal)
                HStack{
                    ForEach(tags2, id: \.self){ tags2 in
                        Button{
                            
                        }label: {
                            ZStack{
                                Capsule()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("CreamyWhite"))
                                    .cornerRadius(20)
                                    .frame(width: 80, height: 30)
                                Text(tags2)
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
                }.frame(height: 290)
                
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

struct ExploreSearch_Previews: PreviewProvider {
    static var previews: some View {
        ExploreSearch()
    }
}
