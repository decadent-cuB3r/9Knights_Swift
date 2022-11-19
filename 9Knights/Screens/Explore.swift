//
//  Explore.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore


struct Event Codable, Identifiable {
    @DocumentID var id: String?
    var eventName: String
    var tags: [String]
    var photo: String
}

struct Explore: View {
    @FirestoreQuery(collectionPath: "events") var events: [Event]
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        Text("Hello World")
        ForEach(events) { event in
            /*@START_MENU_TOKEN@*/Text(event.eventName)/*@END_MENU_TOKEN@*/
        }
        
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
