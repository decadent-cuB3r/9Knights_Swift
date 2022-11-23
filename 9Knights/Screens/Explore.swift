//
//  Explore.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct EventTileView: View {
    @FirestoreQuery(collectionPath: "tags") var tags: [Tag]
    var event: Event
    
    var body: some View {
        NavigationLink(destination: Text("second View")){
            ZStack{
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(.white)
                VStack{
//                    AsyncImage(url: URL(string: event.photo), scale: 2.0)
                    
                    Text("\(event.startDate.formatted(.dateTime.month().day()))")
                        .foregroundColor(Color("737373"))
                    Text(event.eventName)
                        .foregroundColor(.black)

                }
            }.frame(width: 200, height: 200).fixedSize()
        }

    }
}

struct Explore: View {
    
    @FirestoreQuery(collectionPath: "events") var events: [Event]
    @FirestoreQuery(collectionPath: "areaTags") var tags: [Tag]
    
    @State var selectedTag = "All"
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack{
                    Button {
                        self.selectedTag = "All"
                    } label: {
                        Capsule()
                            .overlay(
                                Text("全部").foregroundColor(.black)
                            )
                            .foregroundColor(
                                selectedTag == "All" ? Color("DA4F40") : Color("FAF3EA")
                            )
                    }.buttonStyle(StaticButtonStyle())

                    ForEach(tags){tag in
                        Button {
                            self.selectedTag = tag.tagID
                            print(tag.tagID)
                        } label: {
                            Capsule()
                                .overlay(
                                    Text(tag.tagName).foregroundColor(.black)
                                )
                                .foregroundColor(
                                    selectedTag == tag.tagID ? Color("DA4F40") : Color("FAF3EA")
                                )
                        }.buttonStyle(StaticButtonStyle())
                    }
                }
                let twoItemGrid = [GridItem(.flexible()), GridItem(.flexible())]
                LazyVGrid(columns: twoItemGrid) {
                    ForEach(events) { event in
                        EventTileView(event: event)
                    }
                }
            }
            .navigationBarTitle("探索旅程")
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
