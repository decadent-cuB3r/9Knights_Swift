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

public var UserID: String = ""

@MainActor class UserInfoViewModel: ObservableObject {
    @Published var bikeModel = ""
    @Published var biography = ""
    @Published var surName = ""
    @Published var location = ""
    @Published var image = ""
    
    let db = Firestore.firestore().collection("users").document(UserID)
    
    func initialData() async -> Bool {
        do {
            try await db.setData([
                "bikeModel": bikeModel,
                "surName": surName,
                "location": location,
                "biography": biography
            ], merge: true)
            return true
        } catch {
            return false
        }
    }
}
