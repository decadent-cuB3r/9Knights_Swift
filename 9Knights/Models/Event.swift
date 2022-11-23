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
    var eventName: String
    var tags: [String]
    var photo: String
    var host: String
    var startDate: Date
    var endDate: Date
    
}

struct Post: Codable, Identifiable {
    @DocumentID var id: String?
    
}
