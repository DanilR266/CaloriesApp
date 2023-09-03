//
//  Model.swift
//  CaloriesApp
//
//  Created by Данила on 06.07.2023.
//

import FirebaseFirestore
import Firebase

class FirebaseService {
    static let shared = FirebaseService()
    
    private let db = Firestore.firestore()

    func updateUserName(docId: String, newName: String, completion: @escaping (Error?) -> Void) {
        db.collection("usersNew").document(docId).updateData([
            "firstname": newName
        ]) { error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    func signOut(authenticated: inout Bool) {
        let firebaseAuth = Auth.auth()
        do {
          try
            firebaseAuth.signOut()
            authenticated.toggle()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

