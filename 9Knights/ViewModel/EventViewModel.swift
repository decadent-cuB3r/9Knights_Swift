//
//  EventViewModel.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/4.
//

//import Foundation
//import Firebase
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//class EventViewModel: ObservableObject {
//    @Published var events: [Event]
//    @Published var tags: [Tag]
//    
//    private var db = Firestore.firestore()
//    
//    init(){
//        fetchData()
//    }
//    func fetchData() {
//        db.collection("books").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//            
//            self.books = documents.map { queryDocumentSnapshot -> Book in
//                let data = queryDocumentSnapshot.data()
//                let title = data["title"] as? String ?? ""
//                let author = data["author"] as? String ?? ""
//                let numberOfPages = data["pages"] as? Int ?? 0
//
//                return Book(id: .init(), title: title, author: author, numberOfPages: numberOfPages)
//            }
//        }
//    }
//}
