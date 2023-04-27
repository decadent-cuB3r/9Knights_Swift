//
//  ExploreSearch.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/27.
//

import SwiftUI
struct NotificationNavigationBar: View {
    @State private var isPresented = false
    @State private var isPresentedright = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
                .shadow(color: Color.gray.opacity(0.05), radius: 4, x: 0, y: 4)
                .frame(width: 390,height: 70)
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    ZStack{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("Gray"))
                            .opacity(0.5)
                        Image("BlackArrowLeft")
                            .font(Font.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Text("通知").font(.system(size: 24)).bold()
                    .padding(.leading, 25)
                Spacer()
                Button{
                    //已讀功能
                }label: {
                    ZStack{
                        Text("全部已讀")
                            .foregroundColor(Color("Red"))
                            .font(.system(size: 16))
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
        .padding(.bottom,20)
    }
}
struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct NotificationListEvent: View {
    let title: String
    let notifications = [
            NotificationItem(title: "First Notification", message: "曉希已經對您的『南橫ＲＶ喝咖啡』行程提出參加意願。"),
            NotificationItem(title: "Second Notification", message: "強生已加入您的『南橫RV喝咖啡』行程。"),
            NotificationItem(title: "Third Notification", message: "強生邀請您加入『環島一日遊』行程。"),
        ]
    var body: some View {
        VStack {
            Text("最近").font(.system(size: 24, weight: .bold)).frame(maxWidth: 348, maxHeight: 40,alignment: .leading).padding(.horizontal,20)
            VStack(alignment: .leading){
                ForEach(notifications) { notification in
                            HStack {
                                Image("knightPhoto")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50,height: 50)
                                Text(notification.message)
                                    .font(.system(size: 14))
                                
                            }.padding(.horizontal,20)
                        Divider()
                        }
                Text("更早之前").font(.system(size: 24, weight: .bold)).frame(maxWidth: 348, maxHeight: 40,alignment: .leading).padding(.horizontal,20)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
struct NotificationListPost: View {
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

struct TabItemLeft: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size:16))
                .bold()
                .padding(.vertical, 10)
                .frame(maxWidth: 174)
                .foregroundColor(
                    isSelected ? Color.white : Color.black
                )
                .background(
                    isSelected ? Color("Red") : Color("Gray")
                )
                
        }
        .buttonStyle(StaticButtonStyle())
        .cornerRadius(10, corners: [.topLeft, .bottomLeft])
    }
}
struct TabItemRight: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size:16))
                .bold()
                .padding(.vertical, 10)
                .frame(maxWidth: 174)
                .foregroundColor(
                    isSelected ? Color.white : Color.black
                )
                .background(
                    isSelected ? Color("Red") : Color("Gray")
                )
                
        }
        .buttonStyle(StaticButtonStyle())
        .cornerRadius(10, corners: [.topRight, .bottomRight])
    }
}

struct ExploreNotification: View {
    @State private var selectedSegment = 0
    @State private var selectedTab = 0
    @Environment(\.presentationMode) var presentationMode
    
   var body: some View {
       VStack {
           NotificationNavigationBar()
           VStack(spacing: 0) {
                      ZStack {
                          Color.white
                              .frame(height: 50)
                          HStack(spacing: 0) {
                              TabItemLeft(title: "旅程", isSelected: selectedTab == 0) {
                                  selectedTab = 0
                              }
                              TabItemRight(title: "貼文", isSelected: selectedTab == 1) {
                                  selectedTab = 1
                              }
                          }
                      }
                      TabView(selection: $selectedTab) {
                          NotificationListEvent(title: "")
                              .tag(0)
                          NotificationListPost(title: "")
                              .tag(1)
                      }}
       }
       .navigationBarHidden(true)
   }
}

struct ExploreNotification_Previews: PreviewProvider {
    static var previews: some View {
        ExploreNotification()
    }
}
