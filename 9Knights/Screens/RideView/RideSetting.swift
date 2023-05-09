//
//  RideSetting.swift
//  9Knights
//
//  Created by Peggy on 2023/5/9.
//

import Foundation
import SwiftUI
struct RideSetting: View {
    @State private var hideTab = false
    @State private var MapisOn = false
    @State private var BetteryisOn = false
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    CustomBar(text: "地圖設定")
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: 5){
                                Text("顯示重機停車場").font(.system(size: 20)).bold()
                                Text("將有停車場圖標顯示於您的地圖上").font(.system(size: 14)).foregroundColor(Color("WordGray"))
                            }.frame(width: 220)
                            Toggle("", isOn: $MapisOn)
                                .font(.system(size: 20)).bold()
                                .toggleStyle(SwitchToggleStyle(tint: Color("Red")))
                        }.padding(.horizontal).frame(height: 70)
                        Divider()
                        HStack{
                            VStack(alignment: .leading, spacing: 5){
                                Text("省電模式").font(.system(size: 20)).bold()
                                Text("建議開啟省電模式減少手機耗電量").font(.system(size: 14)).foregroundColor(Color("WordGray"))
                            }.frame(width: 220)
                            Toggle("", isOn: $BetteryisOn)
                                .toggleStyle(SwitchToggleStyle(tint: Color("Red")))
                        }.padding(.horizontal).frame(height: 70)
                        Divider()
                        Spacer()
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            hideTab = true
        }
        .onDisappear {
            hideTab = false
        }
    }
}

struct RideSetting_Previews: PreviewProvider {
    static var previews: some View {
        RideSetting()
    }
}
