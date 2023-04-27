//
//  FriendReview.swift
//  9Knights
//
//  Created by Peggy on 2023/4/24.
//


import Foundation
import SwiftUI
struct ReviewProgressBar: View {
    var progress: Double = 150
    var total: Double = 300

    var body: some View {
        VStack(alignment: .leading) {
            ProgressView(value: progress, total: total)
            .frame(width: 215,height: 5.0)
            .accentColor(Color("Red"))
            .scaleEffect(x: 1, y:2, anchor: .center)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct FriendReview: View {
    
   var body: some View {
       VStack {
           CustomBar(text: "車友評價")
           HStack(spacing: 0){
               VStack(spacing:8){
                   Text("5.0").font(.system(size: 28)).bold()
                   Divider().frame(width: 60)
                   Text("5.0").font(.system(size: 28)).bold().foregroundColor(Color("WordGray"))
               }.padding(.leading,20)
               VStack(spacing: 2){
                   HStack(spacing: 2){
                       Text("5").font(.system(size: 10)).bold()
                       Image(systemName: "star.fill")
                           .foregroundColor(Color.yellow)
                           .font(.system(size: 10))
                       ReviewProgressBar()
                   }
                   HStack(spacing: 2){
                       Text("4").font(.system(size: 10)).bold()
                       Image(systemName: "star.fill")
                           .foregroundColor(Color.yellow)
                           .font(.system(size: 10))
                       ReviewProgressBar()
                   }
                   HStack(spacing: 2){
                       Text("3").font(.system(size: 10)).bold()
                       Image(systemName: "star.fill")
                           .foregroundColor(Color.yellow)
                           .font(.system(size: 10))
                       ReviewProgressBar()
                   }
                   HStack(spacing: 2){
                       Text("2").font(.system(size: 10)).bold()
                       Image(systemName: "star.fill")
                           .foregroundColor(Color.yellow)
                           .font(.system(size: 10))
                       ReviewProgressBar()
                   }
                   HStack(spacing: 2){
                       Text("1").font(.system(size: 10)).bold()
                       Image(systemName: "star.fill")
                           .foregroundColor(Color.yellow)
                           .font(.system(size: 10))
                       ReviewProgressBar()
                   }
                   HStack{
                       Spacer()
                       Text("2份評論").font(.system(size: 10)).bold().foregroundColor(Color("WordGray"))
                   }.padding(.horizontal,20)
                  
               }
           }
           .frame(width: 350, height: 110)
           .background(Color("Gray"))
           .cornerRadius(20)
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
               .padding(.vertical,10)
           }
           ScrollView{
               VStack(alignment: .leading,spacing: 5){
                   HStack(spacing: 5){
                       Image("knightPhoto")
                           .resizable()
                           .frame(width: 25, height: 25)
                           .clipShape(Circle())
                           .padding(.trailing, 2)
                       Text("王強生").font(.system(size:12)).bold()
                       Image(systemName: "arrowtriangle.forward.fill")
                           .font(.system(size:12))
                           .foregroundColor(Color("WordGray"))
                       Text("北宜公路一日遊").font(.system(size:12)).bold().foregroundColor(Color("WordGray"))
                       Spacer()
                       Text("2022/10/12").font(.system(size:10)).bold().foregroundColor(Color("WordGray"))
                   }
                   VStack(spacing: 8){
                       Text("好相處的人!").font(.system(size:12))
                       HStack(spacing: 1){
                           ForEach(0..<5) { index in
                                  Image(systemName: "star.fill")
                                      .foregroundColor(.yellow).font(.system(size: 10))
                              }
                       }
                   }.padding(.leading,30)
               }
               .padding(.horizontal)
               .frame(width: 350, height: 85)
               .background(.white).cornerRadius(10)
               .overlay(
                   RoundedRectangle(cornerRadius: 10)
                   .stroke(Color("ItemStroke"), lineWidth: 1))
               .padding(.vertical)
               Spacer()
           }
           .frame(maxWidth: .infinity)
           .background(Color("Gray"))
           
       }
       .navigationBarHidden(true)
   }
}

struct FriendReview_Previews: PreviewProvider {
    static var previews: some View {
        FriendReview()
    }
}
