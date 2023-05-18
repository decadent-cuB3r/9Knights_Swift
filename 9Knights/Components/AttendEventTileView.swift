//
//  AttendEventTileView.swift
//  9Knights
//
//  Created by Peggy on 2023/4/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AttendEventTileView: View {
    @FirestoreQuery(collectionPath: "areaTags") var tags: [Tag]
    var event: Event
    @Binding var hideTab: Bool

    var body: some View {
        NavigationLink(destination: EventDetail(hideTab: $hideTab, event: event)){
            HStack{
                VStack(alignment: .leading){
                    //Event Image
                    AsyncImage(url: URL(string: event.photo)){ image in
                        image.resizable()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 120,height: 90)

                }
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("參加中")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 55, height: 16)
                            .background(Color("Red"))
                            .cornerRadius(5)
                        Spacer()
                        Button{
                            //更多按鈕功能popup
                        }label: {
                            Image(systemName: "ellipsis")
                                .font(Font.system(size: 15, weight: .bold))
                                .foregroundColor(Color("WordGray"))
                        }
                    }.padding(.bottom,6)
                    //Event Name
                    Text(event.eventName)
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .bold))
                        .padding(.bottom,0.1)
                    //Event Date
                    Text("\(event.startDate.formatted(.dateTime.month().day()))")
                        .foregroundColor(Color("WordGray"))
                        .font(.system(size: 12))
                        .padding(.bottom, 0.1)
                    HStack{
                        //Event Host 待翻譯中文
                        Text("由 \(event.host) 創建")
                            .foregroundColor(Color("WordGray"))
                            .font(.system(size: 12, weight: .regular))
                        Spacer()
                        Text("3 人參加")
                            .foregroundColor(Color("WordGray"))
                            .font(.system(size: 12, weight: .regular))
                    }
                }.frame(width: 200)
            }
            .frame(width: 352, height: 107)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("ItemStroke"), lineWidth: 1))
            .fixedSize()
            
        }

    }
}
