//
//  FirestoreManager.swift
//  Barter
//
//  Created by Alex Hynds on 3/26/23.
//

import Firebase
import FirebaseFirestore

var documents: [QueryDocumentSnapshot] = []

class FirestoreManager: ObservableObject {
    
    init() {
//        fetchAllData()
    }
    
    func fetchAllData() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                    let data = document.data()
                    let url = URL(string: data["Image"] as! String)
                    let imgData = try? Data(contentsOf: url!)
                    market[market.count] = Item(name: data["Title"] as! String, type: data["Type"] as! String, image: UIImage(data: imgData!), owner: data["Name"] as! String, postDate: DateFormatter().date(from: data["Date"] as! String), description: data["Description"] as! String)
                }
//                documents = querySnapshot?.documents ?? []
            }
        }
    }
}



