//
//  RecommendedChat.swift
//  9Knights
//
//  Created by Peggy on 2023/4/24.
//

import Foundation
import SwiftUI

struct PrivateChatList: View {
    let title: String
    let chatcontent = [
            NotificationItem(title: "First chat", message: "明天要不要出來騎車~~")
        ]
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                ForEach(chatcontent) { chatcontent in
                            HStack(spacing: 10) {
                                Image("knightPhoto")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50,height: 50)
                                VStack(alignment: .leading, spacing: 5){
                                    HStack{
                                        Text("張曉希").font(.system(size: 14)).bold()
                                        Spacer()
                                        Text("1分鐘之前").font(.system(size: 12))
                                    }
                                    Text(chatcontent.message)
                                        .font(.system(size: 12))
                                }
                            }.padding(.horizontal,20)
                        Divider()
                        }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.vertical)
        }
    }
}
struct GroupChatList: View {
    let title: String
    
    var body: some View {
        VStack {
            VStack{
                ZStack{
                    Circle().frame(width: 190).foregroundColor(Color("Gray"))
                    Image("NothingHere")
                        .padding(.bottom, 10)
                }
                Text("尚無任何通知")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("WordGray"))
                    .padding(.vertical,10)
            }
        }
    }
}

struct RecommendedChat: View{
    @State private var selectedSegment = 0
    @State private var selectedTab = 0
    @Environment(\.presentationMode) var presentationMode
    @Binding var hideTab: Bool

    var body: some View{
        VStack{
            CustomBar(text: "聊天室")
            VStack(spacing: 0) {
                       ZStack {
                           Color.white
                               .frame(height: 50)
                           HStack(spacing: 0) {
                               TabItemLeft(title: "私人", isSelected: selectedTab == 0) {
                                   selectedTab = 0
                               }
                               TabItemRight(title: "群組", isSelected: selectedTab == 1) {
                                   selectedTab = 1
                               }
                           }
                       }
                       TabView(selection: $selectedTab) {
                           PrivateChatList(title: "")
                               .tag(0)
                           GroupChatList(title: "")
                               .tag(1)
                       }}
        }.navigationBarHidden(true)
            .onAppear {
                hideTab = true
                        }
            .onDisappear {
                hideTab = false
            }
    }
}

struct RecommendedChat_Previews: PreviewProvider {
    @State static private var hideTab = false

    static var previews: some View {
        RecommendedChat(hideTab: $hideTab)
    }
}
