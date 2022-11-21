//
//  DataManager.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/19.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Event: Codable, Identifiable {
    @DocumentID var id: String?
    let eventName: String
    let tags: [String]
    let photo: String
    let host: String
}

struct Post: Codable, Identifiable {
    @DocumentID var id: String?
    
}

struct Tag: Codable, Identifiable {
    @DocumentID var id: String?
    
}
