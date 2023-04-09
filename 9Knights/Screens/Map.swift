//
//  Map.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import MapKit

struct Map: View {
    var body: some View {
        NavigationView{
            ScrollView{
            
            }
            .navigationBarTitle("")
            .navigationBarItems(leading:
                                Text("旅程地圖").font(.system(size: 32)).bold().padding(.top,-8)
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
                                    }.padding(.top,-8)
                        )
        }
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
