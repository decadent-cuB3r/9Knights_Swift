//
//  MyPost.swift
//  9Knights
//
//  Created by Peggy on 2023/4/24.
//

import Foundation
import SwiftUI

struct MyPost: View {
    @State private var selectedSegment = 0
    @State private var selectedTab = 0
    @Environment(\.presentationMode) var presentationMode
    
   var body: some View {
       VStack {
           CustomBar(text: "我的貼文")
           VStack(spacing: 0) {
               Button{
                   
               }label: {
                   HStack{
                       Image(systemName: "arrowtriangle.down.fill")
                           .font(.system(size: 14))
                       Text("依日期排序(最近)")
                           .font(.system(size:14))
                       Spacer()
                   }
                   .foregroundColor(Color("WordGray")).bold()
                   .padding(.leading,20)
                   .padding(.top, 5)
               }
               VStack{
                   HStack{
                       VStack(alignment: .leading, spacing: 8){
                           HStack(spacing: 5){
                               Image("knightPhoto")
                                   .resizable()
                                   .frame(width: 30, height: 30)
                               Text("陳辰")
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
                               Spacer()
                               Image(systemName: "ellipsis")
                                   .font(Font.system(size: 15, weight: .bold))
                                   .foregroundColor(Color("WordGray"))
                           }
                           HStack{
                               VStack(alignment: .leading,spacing: 8){
                                   Text("好想騎機車露營喔~")
                                       .font(.system(size: 14, weight: .bold))
                                   Text("最近看板上各位大大分享機車露營整個好心動")
                                       .font(.system(size: 12))
                                   Text("2 讚  1 留言  0 收藏")
                                       .font(.system(size: 10, weight: .bold))
                                       .foregroundColor(Color("WordGray"))
                               }.padding(.leading,5)
                               Spacer()
                           }
                       }.padding()
                       
                   }
                   .frame(width: 365, height: 120)
                   .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("ItemStroke"), lineWidth: 1))
                   .padding()
               }
           }
           Spacer()
       }
       .navigationBarHidden(true)
   }
}

struct MyPost_Previews: PreviewProvider {
    static var previews: some View {
        MyPost()
    }
}
