//
//  Tag.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/24.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Tag: Codable, Identifiable {
    @DocumentID var id: String?
    var tagID: String
    var tagName: String
}

