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
    var event: Event
    
    var body: some View {
        NavigationLink(destination: Text("second View")){
            ZStack{
                VStack{
//                    AsyncImage(url: URL(string: event.photo), scale: 2.0)
                    
                    Text(event.eventName)
                }
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(.white)
            }.frame(width: 200, height: 200).fixedSize()
        }.buttonStyle(PlainButtonStyle())

    }
}

struct Explore: View {
    
    @FirestoreQuery(collectionPath: "events") var events: [Event]
    
    var body: some View {
        ScrollView {
            let twoItemGrid = [GridItem(.flexible()), GridItem(.flexible())]
            LazyVGrid(columns: twoItemGrid) {
                ForEach(events) { event in
                    EventTileView(event: event)
                }
            }
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
