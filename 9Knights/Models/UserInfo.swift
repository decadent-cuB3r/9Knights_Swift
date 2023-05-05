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
    var name: String
    var surName: String
    var biography: String
    var bikeModel: String
}
