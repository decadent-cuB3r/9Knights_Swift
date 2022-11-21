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
        NavigationLink {
            //destination
        } label: {
            ZStack{
                VStack{
                    AsyncImage(url: URL(string: event.photo), scale: 2.0)
                    
                    Text(event.eventName)
                }
                RoundedRectangle(cornerRadius: 6.0)
            }.frame(width: 200, height: 200).fixedSize()
        }

    }
}

struct Explore: View {
    
    @FirestoreQuery(collectionPath: "events") var events: [Event]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(events) { event in
                    Text(event.eventName)
                }
            }
            .navigationTitle("探索旅程")
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
