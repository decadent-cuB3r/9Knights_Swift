//
//  User.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/3/29.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserInfo: Codable, Identifiable {
    @DocumentID var id: String?
    var UID: String
    var tagName: String
    var postID: [String]
    var eventID: [String]
    var participatedEventID: [String]
    var biography: String
    var name: String
    var bikeModel: String
    var followersID: [String]
    var followingID: [String]
}
