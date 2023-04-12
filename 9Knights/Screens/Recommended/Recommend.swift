//
//  Map.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import MapKit

struct RecommendRoot: View {
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal){
                //UpcomingEvent tile
                NavigationLink(destination: RideView()){
                    VStack{
                        StandardHeader(text: "北宜公路一日遊")
                        Text("5月31日, 週二 8:00  - 5月31日, 週二 15:00 ")
                        HStack{
                            
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarItems(leading:
                                    Text("旅程").font(.system(size: 32)).bold().padding(.top,-8)
                                , trailing:
                                    HStack{
                Button{
                    
                } label: {
                    ZStack{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("Gray"))
                        Image(systemName: "message")
                            .font(Font.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("BtnGray"))
                    }
                }
            }.padding(.top,-8))
        }
    }
}

struct RecommendRoot_Previews: PreviewProvider {
    static var previews: some View {
        RecommendRoot()
    }
}
