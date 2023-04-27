//
//  EventViewTile.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/3/29.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct EventTileView: View {
    @FirestoreQuery(collectionPath: "areaTags") var tags: [Tag]
    var event: Event
    
    var body: some View {
        NavigationLink(destination: EventDetail(event: event)){
            ZStack{
                Rectangle()
                    .foregroundColor(Color("ItemShadow"))
                    .cornerRadius(10)
                    .frame(width: 170, height: 208)
                    .offset(y:4)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color("ItemStroke"), lineWidth: 1)
                    .background(.white)
                    .cornerRadius(10)
                    .frame(width: 180,height: 204)
                VStack(alignment: .leading){
                    //Event Image
                    AsyncImage(url: URL(string: event.photo)){ image in
                        image.resizable()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 166,height: 98)
                    //Event Tags
                    HStack{
                        ForEach(event.tags, id: \.self){ tags in
                            ZStack{
                                Rectangle()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("Gray"))
                                    .cornerRadius(2)
                                    .frame(width: 40, height: 16)
                                Text(tags)
                                    .foregroundColor(Color(.black))
                                    .bold()
                                    .font(.system(size: 10))
                            }
                        }
                    }
                    
                    //Event Date
                    Text("\(event.startDate.formatted(.dateTime.month().day()))")
                        .foregroundColor(Color("WordGray"))
                        .font(.system(size: 14, weight: .bold))
                        .padding(.bottom, 0.1)
                    //Event Name
                    Text(event.eventName)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom,0.1)
                    //Event Host 待翻譯中文
                    Text("由 \(event.host) 創建")
                        .foregroundColor(Color("WordGray"))
                        .font(.system(size: 10, weight: .regular))

                }
            }
            .frame(width: 180, height: 200)
            .fixedSize()
            
        }

    }
}
