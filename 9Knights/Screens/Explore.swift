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
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(.white)
                    .shadow(radius: 5.0)
                VStack(alignment: .leading){
                    //Event Image
                    AsyncImage(url: URL(string: event.photo)){ image in
                        image.resizable()
                            .cornerRadius(10)
                            .padding(2.0)
                    } placeholder: {
                        ProgressView()
                    }
                    //Event Tags
                    
                    
                    //Event Date
                    Text("\(event.startDate.formatted(.dateTime.month().day()))")
                        .foregroundColor(Color("WordGray"))
                    //Event Name
                    Text(event.eventName)
                        .foregroundColor(.black)
                    //Event Host 待翻譯中文
                    Text("由 \(event.host) 創建")

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
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        Spacer(minLength: 25)
                        Button {
                            self.selectedTag = "All"
                        } label: {
                            Capsule()
                                .overlay(
                                    Text("全部").foregroundColor(.black)
                                )
                                .foregroundColor(
                                    selectedTag == "All" ? Color("Red") : Color("CreamyWhite")
                                )
                                .frame(width: 100, height: 40)
                                .shadow(radius: 2.0)
                        }.buttonStyle(StaticButtonStyle())
                        ForEach(tags){tag in
                            Spacer(minLength: 25)
                            Button {
                                self.selectedTag = tag.tagID
                                print(tag.tagID)
                            } label: {
                                Capsule()
                                    .overlay(
                                        Text(tag.tagName).foregroundColor(.black)
                                    )
                                    .foregroundColor(
                                        selectedTag == tag.tagID ? Color("Red") : Color("CreamyWhite")
                                    )
                                    .frame(width: 100, height: 40)
                                    .shadow(radius: 2.0)
                            }.buttonStyle(StaticButtonStyle())
                        }
                    }.frame(height: 60)
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
