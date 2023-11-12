//
//  Model.swift
//  CaloriesApp
//
//  Created by Данила on 06.07.2023.
//

import FirebaseFirestore
import Firebase

class ModelSettings {
    
    private let db = Firestore.firestore()
    
    func getStoredData(docId: String, completion: @escaping (String?, String?, Int?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
                completion(nil, nil, nil)
            } else if let document = document, document.exists {
                if let weightGoal = document.data()?["WeightGoal"] as? String,
                   let goalCalories = document.data()?["GoalCalories"] as? Int,
                   let name = document.data()?["firstname"] as? String {
                    DispatchQueue.main.async {
                        completion(weightGoal, name, goalCalories)
                    }
                } else {
                    print("Data is not in the expected format")
                    completion(nil, nil, nil)
                }
            } else {
                print("Document does not exist")
                completion(nil, nil, nil)
            }
        }
    }

    func setData(calories: Int, name: String, weight: String, docId: String) {
        let db = Firestore.firestore()
        db.collection("usersNew").document("\(docId)").updateData([
            "GoalCalories": calories,
            "firstname": name,
            "WeightGoal": weight
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
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

