//
//  LevelRules.swift
//  9Knights
//
//  Created by Peggy on 2023/4/25.
//

import Foundation
import SwiftUI
struct LevelRules: View {
    @State private var selectedSegment = 0
    @State private var selectedIndex = 0
    @Environment(\.presentationMode) var presentationMode
    let levelstar = ["0", "300", "600", "1000"]
    let levelname = ["LV.1 見習騎士","LV.2 白銀騎士","LV.3 黃金騎士","LV.4 騎士團長"]
    let levelcontent = ["開始踏上機車旅行的旅程吧！認識更多的朋友，一起騎車探索美景，一步步地向著夢想前進","愛上團體騎車的樂趣，一步步探索新的路線，認識更多志同道合的朋友，一起分享歡樂，體驗獨特的旅程吧","你的旅程經歷已經到了一個新的境界，不僅能夠帶領團隊也已經是個經歷豐富的車友，成為團隊中的領袖和楷模","你已經成為了團隊的核心，也參與了無數美好的旅程，帶領團隊一起創造美好的回憶和經驗，已是缺一不可的好車友"]
    let titles = ["如何獲得積分", "排行榜"]
    let mission = ["完成旅程一次","建立旅程並完成旅程一次","旅程結束後為一位用戶評價","發布一則貼文","邀請一位朋友下載APP"]
    let star = ["20","30","5","5","20"]
    
   var body: some View {
       VStack {
           CustomBar(text: "等級與規則")
           ScrollView(showsIndicators: false){
               HStack(spacing: 0){
                   VStack(spacing: 20){
                       Circle().frame(width: 12).foregroundColor(Color("Red"))
                       Rectangle().frame(width: 4).cornerRadius(5).foregroundColor(Color("Gray"))
                       Circle().frame(width: 12).foregroundColor(Color("Gray"))
                       Rectangle().frame(width: 4).cornerRadius(5).foregroundColor(Color("Gray"))
                       Circle().frame(width: 12).foregroundColor(Color("Gray"))
                       Rectangle().frame(width: 4).cornerRadius(5).foregroundColor(Color("Gray"))
                       Circle().frame(width: 12).foregroundColor(Color("Gray"))
                   }.frame(width: 15, height: 325).padding(.trailing,5)
                   VStack{
                       LazyVStack(spacing: 80) {
                           ForEach(0..<4) { index in
                               VStack{
                                   Text(levelstar[index]).font(.system(size: 12, weight: .bold))
                                   Image(systemName: "star.fill")
                                       .foregroundColor(Color("Red"))
                                       .font(.system(size: 10))
                               }
                           }
                       }
                   }.frame(width: 40)
                   VStack(spacing: 15){
                       Image("Bronze")
                           .resizable()
                           .frame(width: 62, height: 73)
                       Image("Silver")
                           .resizable()
                           .frame(width: 61, height: 90)
                       Image("Gold")
                           .resizable()
                           .frame(width: 94, height: 103)
                       Image("Leader")
                           .resizable()
                           .frame(width: 106, height: 76)
                   }
                   VStack{
                       LazyVStack(spacing: 44) {
                           ForEach(0..<4) { index in
                               VStack(spacing: 5){
                                   Text(levelname[index]).font(.system(size: 12, weight: .bold))
                                   Text(levelcontent[index])
                                       .font(.system(size: 10))
                                       .foregroundColor(Color("WordGray"))
                               }.frame(width: 173)
                           }
                       }
                   }.frame(width: 180)
               }.padding()
               VStack{
                   TwoTabSegmentedControl(selectedIndex: $selectedIndex, titles: titles)
                   if selectedIndex == 0 {
                       VStack{
                           Text("透過特殊任務或達成以下一般任務來獲取積分")
                               .font(.system(size: 12))
                               .foregroundColor(Color("WordGray"))
                           LazyVStack(spacing: 10) {
                               ForEach(0..<5) { index in
                                   VStack{
                                       HStack{
                                           Text(mission[index]).font(.system(size: 12, weight: .bold))
                                           Spacer()
                                           Text(star[index]).font(.system(size: 12, weight: .bold))
                                           Image(systemName: "star.fill")
                                               .foregroundColor(Color("Red"))
                                               .font(.system(size: 10))
                                       }.padding()
                                   }
                                   .frame(width: 352, height: 52)
                                   .overlay(
                                           RoundedRectangle(cornerRadius: 10)
                                           .stroke(Color("ItemStroke"), lineWidth: 1))
                                   .padding(2)
                               }
                           }
                       }
                   }else{
                       VStack {
                           ZStack{
                               Circle().frame(width: 100).foregroundColor(Color("Gray"))
                               Image("NothingHere")
                                   .resizable()
                                   .frame(width: 50, height: 60)
                                   .padding(.bottom, 10)
                           }
                           Text("尚無排行榜")
                               .font(.system(size: 16, weight: .bold))
                               .foregroundColor(Color("WordGray"))
                               .padding(.bottom,100)
                       }.padding(.top,20)
                   }
               }
               
           }
           
       }
       .navigationBarBackButtonHidden(false)
       .navigationBarHidden(true)
       
   }
}

struct LevelRules_Previews: PreviewProvider {
    static var previews: some View {
        LevelRules()
    }
}
