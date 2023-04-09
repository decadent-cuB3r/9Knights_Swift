//
//  UserInfoViewModel.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/4.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor class UserInfoViewModel: ObservableObject {
    @Published var name = ""
    @Published var bikeModel = ""
    @Published var biography = ""
    
    
    let db = Firestore.firestore()
}
